
`timescale 1 ns / 1 ps

module audio_out_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		output speaker_out,
		output ampSD,
		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 1;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 4
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	wire	 slv_reg_rden;
	(* mark_debug = "true" *) wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          2'h0:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h1:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h2:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h3:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	                slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                      slv_reg2 <= slv_reg2;
	                      slv_reg3 <= slv_reg3;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        2'h0   : reg_data_out <= slv_reg0;
	        2'h1   : reg_data_out <= slv_reg1;
	        2'h2   : reg_data_out <= slv_reg2;
	        2'h3   : reg_data_out <= slv_reg3;
	        default : reg_data_out <= 0;
	      endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end
	
	(* mark_debug = "true" *) wire [3:0]axi_awaddr_test;
	(* mark_debug = "true" *) wire [2:0]reg0;
	(* mark_debug = "true" *) wire [2:0]reg1;
	(* mark_debug = "true" *) wire speaker_out_out;
	(* mark_debug = "true" *) wire ampSD_out_out;
	assign reg0[2:0] = slv_reg0[2:0];
	assign reg1[2:0] = slv_reg1[2:0];
	assign speaker_out_out = speaker_out;
	assign ampSD_out_out = ampSD;
	assign axi_awaddr_test[3:0] = axi_awaddr[3:0];
	
	
	    
                        
    // Add user logic here
    ////////instantiate sound mudule
/*    reg [1:0] temp;
    always@(posedge S_AXI_ACLK)
    begin
        if (!S_AXI_ARESETN)
            temp <=0;
        else
            temp <= S_AXI_AWADDR[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB];
    end
*/    
    (* mark_debug = "true" *) wire speaker_out1,speaker_out2,ampSD1,ampSD2,SE_on,bgm_enable,se_enable;
    wire test_bgm,test_se;
    assign test_bgm = (slv_reg0[2:0] == 1)? 1:0;
    assign test_se = (slv_reg1[2:0] == 1)? 1:0;
    
    assign speaker_out = SE_on ? speaker_out2 : speaker_out1;
    //assign speaker_out = speaker_out2 | speaker_out1;
    assign ampSD = SE_on ? ampSD2 : ampSD1;
    //assign ampSD = ampSD1 | ampSD2;

    //assign bgm_enable = S_AXI_BVALID & ~temp[1] & ~temp[0];
    //assign se_enable = S_AXI_BVALID & ~temp[1] & temp[0];
	assign bgm_enable = slv_reg_wren & ~S_AXI_AWADDR[ADDR_LSB+OPT_MEM_ADDR_BITS] & ~S_AXI_AWADDR[ADDR_LSB];
	assign se_enable = slv_reg_wren & ~S_AXI_AWADDR[ADDR_LSB+OPT_MEM_ADDR_BITS] & S_AXI_AWADDR[ADDR_LSB];
	
	reg bgm_enable_delay;
	reg se_enable_delay;
	always@(posedge S_AXI_ACLK)
        begin
            if (!S_AXI_ARESETN)
            begin
                bgm_enable_delay <= 0;
                se_enable_delay <=0;
            end
            else
            begin
                bgm_enable_delay <= bgm_enable;
                se_enable_delay <= se_enable;
            end
        end
	
	bgm bgm1(
	   .test(0),//test_bgm),
	   .resetn(S_AXI_ARESETN),
       .clk(S_AXI_ACLK),
       .play_bgm(bgm_enable_delay),
       .bgm_select(slv_reg0[2:0]),
       .speaker_out(speaker_out1),
       .ampSD(ampSD1)
	);
	
    sound_effect se1(
        .test(0),//test_se),
        .resetn(S_AXI_ARESETN),
        .clk(S_AXI_ACLK),
        .play_se(se_enable_delay),
        .se_select(slv_reg1[2:0]),
        .speaker_out(speaker_out2),
        .ampSD(ampSD2),
        .SE_on(SE_on)
    );
	// User logic ends
endmodule

module bgm(
    test,
    resetn,
    clk,
    play_bgm,
    bgm_select,
    speaker_out,
    ampSD
);
    input resetn, clk, play_bgm,test;
    input [2:0]bgm_select;
    output speaker_out, ampSD;
    reg [28:0] play_time;
    reg [2:0] note_select;
    reg play_note;
    reg [6:0] note_count;
    reg [3:0] volumn;
    wire done;
    always@(posedge clk)
    begin
        if(!resetn)
        begin
            play_time <= 0;
            note_select <= 0;
            play_note <= 0;
            note_count <= 0;
            volumn <= 0;
        end
        else
        begin
        case(bgm_select)
        
        0://////////////reset
        begin
            if(play_bgm)
            begin
                note_select <= 0;
                play_note <= 0;
                play_time <= 0;
                note_count <= 0;
                volumn <= 0;
            end
        end
            1:
            begin
                if(play_bgm)////when play_song is high agian, replay
                begin
                    note_select <= 0;
                    play_note <= 0;
                    play_time <= 0;
                    note_count <= 1;
                    volumn <= 0;
                end
                else if(note_count == 1 && done == 1)///start play
                begin
                    note_select <= 1;
                    play_time <= 1000; //10ms
                    play_note <= 1;
                    note_count <= 2;
                    volumn <= 5;
                end
                else if(note_count == 2 && done == 1)
                begin
                    note_select <= 7;
                    play_time <= 1000; //10ms
                    play_note <= 1;
                    note_count <= 3;
                    volumn <= 5;
                end
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 4;
                    play_time <= 1000; //10ms
                    play_note <= 1;
                    note_count <= 4;
                    volumn <= 5;
                end
                else if(note_count == 4 && done == 1)
                begin
                    note_select <= 5;
                    play_time <= 1000; //10ms
                    play_note <= 1;
                    note_count <= 5;
                    volumn <= 5;
                end
                else if(note_count == 5 && done == 1)////gap after 1 iteration is done
                begin
                    note_select <= 0;
                    play_time <= 1000; //10ms
                    play_note <= 1;
                    note_count <= 1;
                    volumn <= 5;
                end////////////////////////////////////end and replay
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    volumn <= volumn;
                end
            end
            2:
            begin
                if(play_bgm)////when play_song is high agian, replay
                begin
                    note_select <= 1;
                    play_note <= 1;
                    play_time <= 100;
                    note_count <= 1;
                    volumn <= 0;
                end
                else if(note_count == 1 && done == 1)///start play, guoge
                begin
                    note_select <= 5;//?
                    play_time <= 50000000; //500ms
                    volumn <= 5;
                    play_note <= 1;
                    note_count <= 2;
                end
                else if(note_count == 2 && done == 1)
                begin
                    note_select <= 1;//?
                    play_time <= 100000000; //250ms
                    volumn <= 5;
                    play_note <= 1;
                    note_count <= 3;
                end
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 4;
                end
                else if(note_count == 4 && done == 1)
                    begin
                    note_select <= 1;//?
                    play_time <= 50000000; //250ms
                    volumn <= 5;
                    play_note <= 1;
                    note_count <= 5;
                end
                else if(note_count == 5 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 30000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 6;
                end
                else if(note_count == 6 && done == 1)
                begin
                    note_select <= 1;//?
                    play_time <= 50000000; //250ms
                    volumn <= 5;
                    play_note <= 1;
                    note_count <= 7;
                end
                else if(note_count == 7 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 30000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 8;
                end
                else if(note_count == 8 && done == 1)
                begin
                    note_select <= 1;//?
                    play_time <= 50000000; //250ms
                    volumn <= 5;
                    play_note <= 1;
                    note_count <= 9;
                end////////////////////////////////////end and replay
else if(note_count == 9 && done == 1)
begin
note_select <= 5;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 10;
end
else if(note_count == 10 && done == 1)
begin
note_select <= 6;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 11;
end
else if(note_count == 11 && done == 1)
begin
note_select <= 7;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 12;
end
else if(note_count == 12 && done == 1)
begin
note_select <= 1;//?
play_time <= 80000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 13;
end
else if(note_count == 13 && done == 1)
begin
note_select <= 1;
play_time <= 50000000; //250ms
volumn <= 0;
play_note <= 1;
note_count <= 14;
end
else if(note_count == 14 && done == 1)
begin
note_select <= 1;//?
play_time <= 100000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 15;
end
else if(note_count == 15 && done == 1)
begin
note_select <= 1;
play_time <= 80000000; //250ms
volumn <= 0;
play_note <= 1;
note_count <= 16;
end
else if(note_count == 16 && done == 1)
begin
note_select <= 3;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 17;
end
else if(note_count == 17 && done == 1)
begin
note_select <= 1;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 18;
end
else if(note_count == 18 && done == 1)
begin
note_select <= 2;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 19;
end
else if(note_count == 19 && done == 1)
begin
note_select <= 3;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 20;
end
else if(note_count == 20 && done == 1)
begin
note_select <= 5;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 21;
end
else if(note_count == 21 && done == 1)
begin
note_select <= 5;
play_time <= 3000000; //250ms
volumn <= 0;
play_note <= 1;
note_count <= 22;
end
else if(note_count == 22 && done == 1)
begin
note_select <= 5;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 23;
end
else if(note_count == 23 && done == 1)
begin
note_select <= 1;
play_time <= 30000000; //250ms
volumn <= 0;
play_note <= 1;
note_count <= 24;
end
else if(note_count == 24 && done == 1)
begin
note_select <= 3;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 25;
end
else if(note_count == 25 && done == 1)
begin
note_select <= 3;
play_time <= 30000000; //250ms
volumn <= 0;
play_note <= 1;
note_count <= 26;
end
else if(note_count == 26 && done == 1)
begin
note_select <= 3;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 27;
end
else if(note_count == 27 && done == 1)
begin
note_select <= 1;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 28;
end
else if(note_count == 28 && done == 1)
begin
note_select <= 3;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 29;
end
else if(note_count == 29 && done == 1)
begin
note_select <= 5;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 30;
end
else if(note_count == 30 && done == 1)
begin
note_select <= 3;//?
play_time <= 50000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 31;
end
else if(note_count == 31 && done == 1)
begin
note_select <= 2;//?
play_time <= 100000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 32;
end
else if(note_count == 32 && done == 1)
begin
note_select <= 2;
play_time <= 20000000; //250ms
volumn <= 0;
play_note <= 1;
note_count <= 33;
end 
else if(note_count == 33 && done == 1)
begin
note_select <= 2;//?
play_time <= 120000000; //250ms
volumn <= 5;
play_note <= 1;
note_count <= 34;
end                               
else if(note_count == 34 && done == 1)
begin
note_select <= 2;
play_time <= 200000000; //250ms
volumn <= 0;
play_note <= 1;
note_count <= 1;
end                
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    volumn <= volumn;
                end
            end
            3://///tinkle star
            begin
                if(play_bgm)////when play_song is high agian, replay
                begin
                    note_select <= 1;
                    play_note <= 1;
                    play_time <= 100;
                    note_count <= 1;
                    volumn <= 0;
                end
                else if(note_count == 1 && done ==1)///start play
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 2;
                end
                else if(note_count == 2 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 3;
                end
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 4;
                end
                else if(note_count == 4 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 5;
                end
                else if(note_count == 5 && done == 1)
                begin
                    note_select <= 5;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 6;
                end
                else if(note_count == 6 && done == 1)///
                begin
                    note_select <= 5;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 7;
                end
                else if(note_count == 7 && done == 1)
                    begin
                    note_select <= 5;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 8;
                end
                else if(note_count == 8 && done == 1)///
                begin
                    note_select <= 5;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 9;
                end
                else if(note_count == 9 && done == 1)
                begin
                    note_select <= 6;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 10;
                end
                else if(note_count == 10 && done == 1)
                begin
                    note_select <= 6;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 11;
                end
                else if(note_count == 11 && done == 1)
                begin
                    note_select <= 6;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 12;
                end
                else if(note_count == 12 && done == 1)
                begin
                    note_select <= 6;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 13;
                end
                else if(note_count == 13 && done == 1)
                begin
                    note_select <= 5;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 14;
                end
                else if(note_count == 14 && done == 1)
                begin
                    note_select <= 5;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 15;
                end/////////////////////////////////////////////////
                else if(note_count == 15 && done == 1)
                begin
                    note_select <= 4;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 16;
                end
                else if(note_count == 16 && done == 1)
                begin
                    note_select <= 4;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 17;
                end
                else if(note_count == 17 && done == 1)
                begin
                    note_select <= 4;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 18;
                end
                else if(note_count == 18 && done == 1)
                begin
                    note_select <= 4;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 19;
                end
                else if(note_count == 19 && done == 1)
                begin
                    note_select <= 3;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 20;
                end
                else if(note_count == 20 && done == 1)
                begin
                    note_select <= 3;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 21;
                end
                else if(note_count == 21 && done == 1)
                begin
                    note_select <= 3;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 22;
                end
                else if(note_count == 22 && done == 1)
                begin
                    note_select <= 3;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 23;
                end
                else if(note_count == 23 && done == 1)
                begin
                    note_select <= 2;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 24;
                end
                else if(note_count == 24 && done == 1)
                begin
                    note_select <= 2;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 25;
                end
                else if(note_count == 25 && done == 1)
                begin
                    note_select <= 2;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 26;
                end
                else if(note_count == 26 && done == 1)
                begin
                    note_select <= 2;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 27;
                end
                else if(note_count == 27 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 1;
                    play_note <= 1;
                    note_count <= 28;
                end
                else if(note_count == 28 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 150000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    note_count <= 1;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    volumn <= volumn;
                end
            end
//            3:
//            4:
//            5:
//            6:
//            7:
            default:
            begin
                play_time <= 0;
                note_select <= 0;
                play_note <= 0;
                note_count <= 0;
                volumn <= 0;
            end
        endcase
        end
    end
    
    note_play note_play1(
        .volumn(volumn),
        .test(test),
        .resetn(resetn),
        .play(play_note),
        .note(note_select),///////////////sound_ch & note is the same singal
        .play_time(play_time),
        .clk(clk),
        .speaker_out(speaker_out),
        .ampSD(ampSD),
        .done(done)
    );
endmodule

module sound_effect(
    test,
    resetn,
    clk,
    play_se,
    se_select,
    speaker_out,
    ampSD,
    SE_on
);
    input resetn, clk, play_se,test;
    input [2:0]se_select;
    output speaker_out, ampSD;
    output reg SE_on;
    reg [28:0] play_time;
    reg [2:0] note_select;
    reg play_note;
    reg [6:0] note_count;
    reg [3:0] volumn;
    wire done;
    always@(posedge clk)
    begin
        if(!resetn)
        begin
            play_time <= 0;
            note_select <= 0;
            play_note <= 0;
            note_count <= 0;
            SE_on <= 0;
            volumn <= 0;
        end
        else
        begin
        case(se_select)
//            0:

            1:
            begin
                if(play_se)////when play_song is high agian, replay
                begin
                    note_select <= 0;
                    play_note <= 0;
                    volumn <= 0;
                    play_time <= 0;
                    note_count <= 1;
                    SE_on <= 1;
                end
                else if(note_count == 1)///start play
                begin
                    note_select <= 7;
                    play_time <= 1000; //10us
                    volumn <= 5;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 2;
                end
                else if(note_count == 2 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 1000; //10us
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 3;
                end             
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 1000; //10us
                    volumn <= 5;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 4;
                end////////////////////////////////////end play
                else if(note_count == 4 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 0; //250ms
                    volumn <= 5;
                    play_note <= 0;
                    SE_on <= 0;
                    note_count <= 0;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    volumn <= volumn;
                    note_count <= note_count;
                    note_select <= note_select;
                    SE_on <= SE_on;
                end
            end
            2:
            begin
                if(play_se)////when play_song is high agian, replay
                begin
                    note_select <= 0;
                    play_note <= 0;
                    play_time <= 0;
                    note_count <= 1;
                    volumn <= 0;
                    SE_on <= 1;
                end
                else if(note_count == 1 && done == 1)///start play
                begin
                    note_select <= 7;
                    play_time <= 10000000; //10us
                    volumn <= 7;
                    play_note <= 1;
                    note_count <= 2;
                    SE_on <= 1;
                end
                else if(note_count == 2 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 10000000; //10us
                    volumn <= 5;
                    play_note <= 1;
                    note_count <= 3;
                    SE_on <= 1;
                end
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 5000000; //10us
                    volumn <= 7;
                    play_note <= 1;
                    note_count <= 4;
                    SE_on <= 1;
                end////////////////////////////////////end play
                else if(note_count == 4 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 0; //250ms
                    play_note <= 0;
                    SE_on <= 0;
                    note_count <= 0;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    volumn <= volumn;
                end
            end
            3:
            begin
                if(play_se)////when play_song is high agian, replay
                begin
                    note_select <= 0;
                    play_note <= 1;
                    play_time <= 100;
                    note_count <= 1;
                    SE_on <= 1;
                end
                else if(note_count == 1)///start play
                begin
                    note_select <= 6;
                    play_time <= 10000000; //10us
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 2;
                end
                else if(note_count == 2 && done == 1)
                begin
                    note_select <= 2;
                    play_time <= 10000000; //10us
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 3;
                end////////////////////////////////////end play
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 0; //250ms
                    play_note <= 0;
                    SE_on <= 0;
                    note_count <= 0;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    SE_on <= SE_on;
                end
            end
            4:
            begin
                if(play_se)////when play_song is high agian, replay
                begin
                    note_select <= 0;
                    play_note <= 1;
                    play_time <= 100;
                    note_count <= 1;
                    SE_on <= 1;
                end
                else if(note_count == 1)///start play
                begin
                    note_select <= 5;
                    play_time <= 100000000; //10us
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 2;
                end
                else if(note_count == 2 && done == 1)
                begin
                    note_select <= 3;
                    play_time <= 10000000; //10us
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 3;
                end////////////////////////////////////end play
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 0; //250ms
                    play_note <= 0;
                    SE_on <= 0;
                    note_count <= 0;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    SE_on <= SE_on;
                end
            end
            5:
            begin
                if(play_se)////when play_song is high agian, replay
                begin
                    note_select <= 0;
                    play_note <= 0;
                    play_time <= 0;
                    note_count <= 1;
                    SE_on <= 1;
                    volumn <= 0;
                end
                else if(note_count == 1)///start play
                begin
                    note_select <= 5;
                    play_time <= 100000000; //10us
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 2;
                end////////////////////////////////////end play
                else if(note_count == 2 && done == 1)
                begin
                    note_select <= 0;
                    play_time <= 0; //250ms
                    play_note <= 0;
                    SE_on <= 0;
                    note_count <= 0;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    SE_on <= SE_on;
                end
            end                
            6://duo ra mi fa suo la xi
            begin
                if(play_se)////when play_song is high agian, replay
                begin
                    note_select <= 1;
                    play_note <= 1;
                    play_time <= 100;
                    note_count <= 1;
                    SE_on <= 1;
                    volumn <= 0;
                end
                else if(note_count == 1)///start play
                begin
                    note_select <= 1;
                    play_time <= 100000000; //500ms
                    volumn <= 2;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 2;
                end
                else if(note_count == 2 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 100000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 3;
                end
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 2;
                    play_time <= 100000000; //250ms
                    volumn <= 2;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 4;
                end
                else if(note_count == 4 && done == 1)///
                begin
                    note_select <= 2;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 5;
                end
                else if(note_count == 5 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 6;
                end
                else if(note_count == 6 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 7;
                end
                else if(note_count == 7 && done == 1)
                    begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 8;
                end
                else if(note_count == 8 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 9;
                end
                else if(note_count == 9 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 10;
                end
                else if(note_count == 10 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 11;
                end
                else if(note_count == 11 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 12;
                end
                else if(note_count == 12 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 13;
                end
                else if(note_count == 13 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 14;
                end    
                else if(note_count == 14 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 15;
                end////////////////////////////////////end play
                else if(note_count == 15 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 0; //250ms
                    volumn <= 0;
                    play_note <= 0;
                    SE_on <= 0;
                    note_count <= 0;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    SE_on <= SE_on;
                    volumn <= volumn;
                end
            end
                        7://duo ra mi fa suo la xi
            begin
                if(play_se)////when play_song is high agian, replay
                begin
                    note_select <= 1;
                    play_note <= 1;
                    play_time <= 100;
                    note_count <= 1;
                    SE_on <= 1;
                    volumn <= 0;
                end
                else if(note_count == 1)///start play
                begin
                    note_select <= 1;
                    play_time <= 100000000; //500ms
                    volumn <= 2;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 2;
                end
                else if(note_count == 2 && done == 1)///
                begin
                    note_select <= 7;
                    play_time <= 50000000; //500ms
                    volumn <= 2;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 3;
                end
                else if(note_count == 3 && done == 1)
                begin
                    note_select <= 2;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 4;
                end
                else if(note_count == 4 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 2;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 5;
                end
                else if(note_count == 5 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 6;
                end
                else if(note_count == 6 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 7;
                end
                else if(note_count == 7 && done == 1)
                    begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 8;
                end
                else if(note_count == 8 && done == 1)///
                begin
                    note_select <= 1;
                    play_time <= 50000000; //500ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 9;
                end
                else if(note_count == 9 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 10;
                end
                else if(note_count == 10 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 11;
                end
                else if(note_count == 11 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 12;
                end
                else if(note_count == 12 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 13;
                end
                else if(note_count == 13 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 100000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 14;
                end    
                else if(note_count == 14 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 50000000; //250ms
                    volumn <= 0;
                    play_note <= 1;
                    SE_on <= 1;
                    note_count <= 15;
                end////////////////////////////////////end play
                else if(note_count == 15 && done == 1)
                begin
                    note_select <= 1;
                    play_time <= 0; //250ms
                    volumn <= 0;
                    play_note <= 0;
                    SE_on <= 0;
                    note_count <= 0;
                end
                else////when not done
                begin
                    play_note <= 0;
                    play_time <= play_time;
                    note_count <= note_count;
                    note_select <= note_select;
                    SE_on <= SE_on;
                end
            end                                                                            
/*            6:
            7:
            */
            default:
            begin
                play_time <= 0;
                note_select <= 0;
                play_note <= 0;
                SE_on <= 0;
                note_count <= 0;
            end
        endcase
        end
    end
    
    note_play note_play1(
        .volumn(volumn),
        .test(test),
        .resetn(resetn),
        .play(play_note),
        .note(note_select),///////////////sound_ch & note is the same singal
        .play_time(play_time),
        .clk(clk),
        .speaker_out(speaker_out),
        .ampSD(ampSD),
        .done(done)
    );
endmodule

////////////////////////////////////my note_play mudule//////
module note_play(
    volumn,
    test,
    resetn,
    play,
    clk,//100MHz
    note,
    play_time,
    speaker_out,
    ampSD,
    done    
);
    output speaker_out;
    input clk,resetn,test;//
    input [2:0] note;
    input [28:0] play_time;
    reg [18:0] clkdivider;
    output reg done;
    //note frequency link
    //http://www.phy.mtu.edu/~suits/notefreqs.html
    //define note frequency
    //reg [2:0] note;//8 different notes
    always @(note)
        if(test == 0)
        begin
        case(note)
            0 : clkdivider <= 0;
            1 : clkdivider <= 191113; //100000000/262/2; //C4
            2 : clkdivider <= 170262; //100000000/294/2; //D4
            3 : clkdivider <= 151686; //100000000/330/2; //E4
            4 : clkdivider <= 143173; //100000000/349/2; //F4
            5 : clkdivider <= 127553; //100000000/392/2; //G4
            6 : clkdivider <= 113636; //100000000/440/2; //A4
            7 : clkdivider <= 101420; //100000000/494/2; //B4
            default: clkdivider = 0;
        endcase
        end
        else
        begin
        case(note)
            0 : clkdivider <= 0;
            1 : clkdivider <= 191; //100000000/262/2; //C4
            2 : clkdivider <= 170; //100000000/294/2; //D4
            3 : clkdivider <= 151; //100000000/330/2; //E4
            4 : clkdivider <= 143; //100000000/349/2; //F4
            5 : clkdivider <= 127; //100000000/392/2; //G4
            6 : clkdivider <= 113; //100000000/440/2; //A4
            7 : clkdivider <= 101; //100000000/494/2; //B4
        default: clkdivider = 0;
        endcase
        end
    /////////count down using 100MHz clk
    /////////creating different freq of each note
    reg [18:0] counter;
    always@(posedge clk)
    begin
        if(!resetn)
            counter <= 0;
        else
        begin
            if(counter==0)
                counter <= clkdivider;
            else if(done == 1)
                counter <= 0;
            else
                counter <= counter-1;
        end     
    end 
    
    ////////alternating the speaker_out to generate sound
    ////////frequency based on which note to play
    reg speaker_wave;
    output reg ampSD;
    always@(posedge clk)
    begin
        if(!resetn)
        begin
            speaker_wave <= 0;
            ampSD <= 0;
        end
        else
        begin
            /////when notes_timer = 0, stop playing
            if(notes_timer == 0)
            begin
                speaker_wave <= 0;
                ampSD <= 0;
            end
            else if(counter==1 && notes_timer!=0)////when counter counts to 1
            begin
                speaker_wave <= ~speaker_wave;

                    ampSD <= 1;/////////////////
            end
            else////when counter is still counting
            begin
                speaker_wave <= speaker_wave;
                ampSD <= ampSD; 
            end
        end        
    end
    
    input play;///when write to reg[0], play is on
//    reg [28:0] notes_select;///define how long series of notes are played
    reg [28:0] notes_timer;///define how long one note is played

    //////////////play note//////
    always@(posedge clk or posedge play)
    begin
        if(!resetn)
        begin
            notes_timer <= 0;
            done <= 1;
        end
        else 
        begin
            if(play)
            begin
                notes_timer <= play_time;
                done <= 0;
            end
            else if(notes_timer > 0)
            begin
                notes_timer <= notes_timer - 1;
                done <= 0;
            end
            else if(notes_timer == 0 && !play)
            begin
                notes_timer <= notes_timer;
                done <= 1;
            end
            else
            begin
                notes_timer <= notes_timer;
                done <= done;
            end
        end
    end
///////
wire [7:0] samples;
wire [10:0] sample_size;
assign samples = clkdivider[18:11];
assign sample_size[10:0] = 11'b11111111111;
reg [10:0]sample_counter;
reg [7:0] sample_count;
always @(posedge clk) 
    if(!resetn || counter == 1)
        sample_counter <= 0;
        //sample_count <= 0;
    else
        sample_counter <= sample_counter + 1'b1;  // free-running counter
        //sample_count <= sample_count + 1;

always @(posedge clk)
    if(!resetn)
        sample_count <= 0;
    else if(sample_counter == 11'b11111111111)
        sample_count <= sample_count + 1;
    else if(counter==1)
        sample_count <= 0;
    else 
        sample_count <= sample_count;
        
wire [7:0]reverse_sample_count;
assign reverse_sample_count = samples - sample_count;
//wire [7:0] half_samples;
//assign half_samples[7:0] = {0,samples[7:1]};      
wire PWM;
assign PWM = (sample_count <= reverse_sample_count)?(sample_count>=sample_counter[10:3]):(reverse_sample_count>=sample_counter[10:3]);
/*
always@(*)
if(sample_count <= reverse_sample_count)
    PWM <= (sample_count>=sample_counter[10:3]);
else
    PWM <= 1;    
*/    
/////////////wolumn control
    input [3:0] volumn;
/*    reg [3:0] cnt;
    always @(posedge clk) 
        if(!resetn)
            cnt <= 0;
        else
            cnt <= cnt + 1'b1;  // free-running counter
    
    wire PWM_out;
    assign PWM_out = (volumn>cnt);  // comparator
*/
    assign speaker_out = speaker_wave & PWM;
    //assign speaker_out = speaker_wave;
endmodule

