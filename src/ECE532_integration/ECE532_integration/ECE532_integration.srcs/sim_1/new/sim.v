`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/14 16:25:17
// Design Name: 
// Module Name: sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(

    );
    
    reg sys_clk;
    reg reset;
    // Instantiate DUT
    design_1_wrapper dut
     (.sys_clock(sys_clk), // system clock
     .reset(reset), // active high
     .UART_rxd(0)
     ); // sum output
    always #5 sys_clk = ~sys_clk;
    initial
    begin
     sys_clk = 1'b0;
     reset = 1'b0;
     #45
     reset = 1'b1;
    end
    
endmodule