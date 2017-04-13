
`timescale 1 ns / 1 ps

	module position_locator_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
		
		// Ports to Camera Asynchronus FIFO
		input wire FIFO_empty,
		input wire [16:0] FIFO_data,
		output wire FIFO_read,
		output wire [10:0] X_output,
		output wire [9:0] Y_output,
		output wire [10:0] X_output2,
        output wire [9:0] Y_output2,
		output wire xy_valid,
		
		//input button_down,
		//output temp,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
	
	wire [C_S00_AXI_DATA_WIDTH-1:0] LOCATION_OUTPUT;
	wire [C_S00_AXI_DATA_WIDTH-1:0] LOCATION_OUTPUT2;
	wire [C_S00_AXI_DATA_WIDTH-1:0] COLOUR_TOLERANCE_CONFIGURATION;
	wire is_new_data;
	
// Instantiation of Axi Bus Interface S00_AXI
	position_locator_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) position_locator_v1_0_S00_AXI_inst (
	    .to_slv_reg0(LOCATION_OUTPUT),
	    .to_slv_reg2(LOCATION_OUTPUT2),
	    .from_slv_reg1(COLOUR_TOLERANCE_CONFIGURATION),
	    //.button_down(button_down),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here
	
	// Implement Averaging Filter
	AveragingFilter_Main AvgFilter(
	    .clk(s00_axi_aclk),
	    .reset(~s00_axi_aresetn),
	    .tolerance_config(COLOUR_TOLERANCE_CONFIGURATION),
	    .tolerance_config2(32'hFA8080),
        // FIFO Signals
        .data_in(FIFO_data),
        .empty(FIFO_empty),
        .read(FIFO_read),
        // Signals to be written to AXI registers
        .x_out(LOCATION_OUTPUT[15:0]),
        .y_out(LOCATION_OUTPUT[30:16]),
        .x_out2(LOCATION_OUTPUT2[15:0]),
        .y_out2(LOCATION_OUTPUT2[30:16]),
        .new_data_available(LOCATION_OUTPUT[31])
    );
    assign X_output = LOCATION_OUTPUT[15:5];
    assign Y_output = LOCATION_OUTPUT[30:21];
    assign X_output2 = LOCATION_OUTPUT2[15:5];
    assign Y_output2 = LOCATION_OUTPUT2[30:21];
    assign xy_valid = LOCATION_OUTPUT[31];
    assign LOCATION_OUTPUT2[31] = LOCATION_OUTPUT[31];
	// User logic ends

	endmodule
