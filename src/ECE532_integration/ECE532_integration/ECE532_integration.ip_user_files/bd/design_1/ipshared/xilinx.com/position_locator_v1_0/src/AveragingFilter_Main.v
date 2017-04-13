`timescale 1ns / 1ps



module AveragingFilter_Main(
    input clk,  // 100MHz
    input reset,    // active high
    input [31:0] tolerance_config,
    input [31:0] tolerance_config2,
    // FIFO Signals
    input [16:0] data_in,
    input empty,
    output read,
    // Signals to be written to AXI registers
    output reg [15:0] x_out,
    output reg [14:0] y_out,
    output reg [15:0] x_out2,
    output reg [14:0] y_out2,
    output new_data_available
    );

    wire [3:0] RED_MAX = tolerance_config[23:20];
    wire [3:0] RED_MIN = tolerance_config[19:16];
    wire [3:0] GREEN_MAX = tolerance_config[15:12];
    wire [3:0] GREEN_MIN = tolerance_config[11:8];
    wire [3:0] BLUE_MAX = tolerance_config[7:4];
    wire [3:0] BLUE_MIN = tolerance_config[3:0];
    
    wire [3:0] RED_MAX2 = tolerance_config2[23:20];
    wire [3:0] RED_MIN2 = tolerance_config2[19:16];
    wire [3:0] GREEN_MAX2 = tolerance_config2[15:12];
    wire [3:0] GREEN_MIN2 = tolerance_config2[11:8];
    wire [3:0] BLUE_MAX2 = tolerance_config2[7:4];
    wire [3:0] BLUE_MIN2 = tolerance_config2[3:0];
    
    parameter MAX_X = 640;
    parameter MAX_Y = 480;

    
    wire [16:0] VSYNC_CODE = 17'h10000;    

    reg [16:0] current_pixel;
    
    reg [9:0] current_x;
    reg [8:0] current_y;
    reg [31:0] accumulated_x;
    reg [31:0] accumulated_y;
    reg [23:0] number_of_points_counted;
    
     reg [31:0] accumulated_x2;
     reg [31:0] accumulated_y2;
     reg [23:0] number_of_points_counted2;

    parameter WAITING = 0, COMPUTING = 1, CREATING_OUTPUT = 2, RESETING =  3, OUTPUT_READY = 4;
    reg [2:0] current_state, next_state;
    
    reg [31:0] division_count;   
    parameter PIPELINE_STAGES = 26; 
    wire divider_data_valid_x, divider_data_valid_y;
    wire divider_data_valid_x2, divider_data_valid_y2;
    
    // State Transisition
    always @(posedge clk) begin
        if (reset) begin
            current_state <= WAITING;
        end else begin
            current_state <= next_state;
        end
    end
    
    // Next State Logic
    always @(*) begin
        case(current_state)
            WAITING: begin
                if (~empty) begin
                    next_state = COMPUTING;
                end else begin
                    next_state = WAITING;
                end
            end
            COMPUTING: begin
                if (current_pixel == VSYNC_CODE) begin
                    next_state = CREATING_OUTPUT;
                end else if (~empty) begin
                    next_state = COMPUTING;
                end else begin
                    next_state = WAITING;
                end
            end
            CREATING_OUTPUT: begin
                if ( (division_count >= PIPELINE_STAGES) && divider_data_valid_x && divider_data_valid_y && divider_data_valid_x2 && divider_data_valid_y2) begin
                    next_state = OUTPUT_READY;  
                end else begin
                    next_state = CREATING_OUTPUT;
                end
            end
            OUTPUT_READY: begin
                next_state = RESETING;
            end
            RESETING: begin
                next_state = WAITING;
            end
            default: begin
                next_state = RESETING;
            end
        endcase
    end
    
    // Output Parameters controlling datapath
    wire reset_all = (current_state == RESETING) || reset;
    wire enable_increment = (current_state == COMPUTING);
    wire enable_accumulation = (current_state == COMPUTING);
    wire enable_output = (current_state == CREATING_OUTPUT);
    // Signal to FIFO
    assign read = (next_state == COMPUTING); 
    assign new_data_available = (current_state == OUTPUT_READY);
    

    
// DATAPATH ----------------------------------------------------------    
    
    // Current Pixel Reegister
    always @(posedge clk) begin
        if (reset_all) begin
            current_pixel <= 0;
        end else if (read) begin
            current_pixel <= data_in;    // get next pixel from FIFO
        end
    end
 
    always @(posedge clk) begin
        if (reset_all) begin
            current_x <= 0;
            current_y <= 0;
        end else if (enable_increment) begin
            if (current_x >= (MAX_X-1)) begin
                current_x <= 0;
                current_y <= current_y + 1;
            end else begin
                current_x <= current_x + 1;
            end
        end
    end
    
    
    // Check Tolerance Values
    wire [3:0] current_pixel_red = current_pixel[11:8];
    wire [3:0] current_pixel_green = current_pixel[7:4]; 
    wire [3:0] current_pixel_blue = current_pixel[3:0];
    wire is_within_range =  (current_pixel_red <= RED_MAX)      && (current_pixel_red >= RED_MIN) && 
                            (current_pixel_green <= GREEN_MAX)  && (current_pixel_green >= GREEN_MIN) && 
                            (current_pixel_blue <= BLUE_MAX)    && (current_pixel_blue >= BLUE_MIN);
                            
    wire is_within_range2 =  (current_pixel_red <= RED_MAX2)      && (current_pixel_red >= RED_MIN2) && 
                             (current_pixel_green <= GREEN_MAX2)  && (current_pixel_green >= GREEN_MIN2) && 
                             (current_pixel_blue <= BLUE_MAX2)    && (current_pixel_blue >= BLUE_MIN2);
                            
    // If the pixel is in range, accumulate the (x,y) position

    always @(posedge clk) begin
        if (reset_all) begin
            accumulated_x <= 0;
            accumulated_y <= 0;
            number_of_points_counted <= 0;
            accumulated_x2 <= 0;
            accumulated_y2 <= 0;
            number_of_points_counted2 <= 0;
        end else if (enable_accumulation) begin
            if(is_within_range) begin
                accumulated_x <= accumulated_x + current_x;
                accumulated_y <= accumulated_y + current_y;
                number_of_points_counted <= number_of_points_counted + 1;
            end
            if(is_within_range2) begin
                accumulated_x2 <= accumulated_x2 + current_x;
                accumulated_y2 <= accumulated_y2 + current_y;
                number_of_points_counted2 <= number_of_points_counted2 + 1;
            end
        end
    end

    
    wire [31+8:0] divider_x_out;
    div_gen_0 divider_x(
         .s_axis_divisor_tdata({number_of_points_counted}),
         .s_axis_divisor_tready(),      // the ready signals are not checked and assumed to be okay
         .s_axis_divisor_tvalid(1'b1),
         .s_axis_dividend_tdata({accumulated_x}),
         .s_axis_dividend_tready(),
         .s_axis_dividend_tvalid(1'b1),
         .aclk(clk),
         .m_axis_dout_tdata(divider_x_out),
         .m_axis_dout_tvalid(divider_data_valid_x)  // the data is assumed to be valid after PIPELINE_STAGES, not checked
     );
     wire [31+8:0] divider_y_out;
     div_gen_0 divider_y(
         .s_axis_divisor_tdata({number_of_points_counted}),
         .s_axis_divisor_tready(),      // the ready signals are not checked and assumed to be okay
         .s_axis_divisor_tvalid(1'b1),
         .s_axis_dividend_tdata({accumulated_y}),
         .s_axis_dividend_tready(),
         .s_axis_dividend_tvalid(1'b1),
         .aclk(clk),
         .m_axis_dout_tdata(divider_y_out),
         .m_axis_dout_tvalid(divider_data_valid_y)  // the data is assumed to be valid after PIPELINE_STAGES, not checked
     );
     
     wire [31+8:0] divider_x_out2;
     div_gen_0 divider_x2(
          .s_axis_divisor_tdata({number_of_points_counted2}),
          .s_axis_divisor_tready(),      // the ready signals are not checked and assumed to be okay
          .s_axis_divisor_tvalid(1'b1),
          .s_axis_dividend_tdata({accumulated_x2}),
          .s_axis_dividend_tready(),
          .s_axis_dividend_tvalid(1'b1),
          .aclk(clk),
          .m_axis_dout_tdata(divider_x_out2),
          .m_axis_dout_tvalid(divider_data_valid_x2)  // the data is assumed to be valid after PIPELINE_STAGES, not checked
      );
      wire [31+8:0] divider_y_out2;
      div_gen_0 divider_y2(
          .s_axis_divisor_tdata({number_of_points_counted2}),
          .s_axis_divisor_tready(),      // the ready signals are not checked and assumed to be okay
          .s_axis_divisor_tvalid(1'b1),
          .s_axis_dividend_tdata({accumulated_y2}),
          .s_axis_dividend_tready(),
          .s_axis_dividend_tvalid(1'b1),
          .aclk(clk),
          .m_axis_dout_tdata(divider_y_out2),
          .m_axis_dout_tvalid(divider_data_valid_y2)  // the data is assumed to be valid after PIPELINE_STAGES, not checked
      );
         
    // Create Output Values
    always @(posedge clk) begin
        if (reset_all) begin
            x_out <= 0;
            y_out <= 0;
            x_out2 <= 0;
            y_out2 <= 0;
        end else if (enable_output && (division_count >= PIPELINE_STAGES)) begin
            if (number_of_points_counted != 0 || number_of_points_counted2 != 0) begin
                if(number_of_points_counted != 0) begin
                    x_out <= divider_x_out[15:0]; 
                    y_out <= divider_y_out[14:0];
                end
                if(number_of_points_counted2 != 0) begin
                    x_out2 <= divider_x_out2[15:0]; 
                    y_out2 <= divider_y_out2[14:0];
                end
            end else begin
                
                x_out <= 16'hffff;
                y_out <= 15'h7fff;
                x_out2 <= 16'hffff;
                y_out2 <= 15'h7fff;
            end
        end
    end
    
    

    

    always @(posedge clk) begin
        if (reset_all) begin
            division_count <= 0;
        end else if (enable_output) begin
            division_count <= division_count+1;
        end
    end
    
endmodule
