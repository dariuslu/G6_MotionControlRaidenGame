//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
//Date        : Thu Apr 13 14:26:34 2017
//Host        : DESKTOP-6BFN3QO running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (BTNC,
    DDR2_addr,
    DDR2_ba,
    DDR2_cas_n,
    DDR2_ck_n,
    DDR2_ck_p,
    DDR2_cke,
    DDR2_cs_n,
    DDR2_dm,
    DDR2_dq,
    DDR2_dqs_n,
    DDR2_dqs_p,
    DDR2_odt,
    DDR2_ras_n,
    DDR2_we_n,
    LED,
    OV7670_D,
    OV7670_HREF,
    OV7670_PCLK,
    OV7670_SIOC,
    OV7670_SIOD,
    OV7670_VSYNC,
    OV7670_XCLK,
    SW,
    UART_rxd,
    UART_txd,
    ampSD,
    pwdn,
    reset,
    reset_1,
    speaker_out,
    sys_clock,
    tft_hsync,
    tft_vga_b,
    tft_vga_g,
    tft_vga_r,
    tft_vsync);
  input BTNC;
  output [12:0]DDR2_addr;
  output [2:0]DDR2_ba;
  output DDR2_cas_n;
  output [0:0]DDR2_ck_n;
  output [0:0]DDR2_ck_p;
  output [0:0]DDR2_cke;
  output [0:0]DDR2_cs_n;
  output [1:0]DDR2_dm;
  inout [15:0]DDR2_dq;
  inout [1:0]DDR2_dqs_n;
  inout [1:0]DDR2_dqs_p;
  output [0:0]DDR2_odt;
  output DDR2_ras_n;
  output DDR2_we_n;
  output [3:0]LED;
  input [7:0]OV7670_D;
  input OV7670_HREF;
  input OV7670_PCLK;
  output OV7670_SIOC;
  inout OV7670_SIOD;
  input OV7670_VSYNC;
  output OV7670_XCLK;
  input [15:0]SW;
  input UART_rxd;
  output UART_txd;
  output ampSD;
  output pwdn;
  input reset;
  output reset_1;
  output speaker_out;
  input sys_clock;
  output tft_hsync;
  output [5:0]tft_vga_b;
  output [5:0]tft_vga_g;
  output [5:0]tft_vga_r;
  output tft_vsync;

  wire BTNC;
  wire [12:0]DDR2_addr;
  wire [2:0]DDR2_ba;
  wire DDR2_cas_n;
  wire [0:0]DDR2_ck_n;
  wire [0:0]DDR2_ck_p;
  wire [0:0]DDR2_cke;
  wire [0:0]DDR2_cs_n;
  wire [1:0]DDR2_dm;
  wire [15:0]DDR2_dq;
  wire [1:0]DDR2_dqs_n;
  wire [1:0]DDR2_dqs_p;
  wire [0:0]DDR2_odt;
  wire DDR2_ras_n;
  wire DDR2_we_n;
  wire [3:0]LED;
  wire [7:0]OV7670_D;
  wire OV7670_HREF;
  wire OV7670_PCLK;
  wire OV7670_SIOC;
  wire OV7670_SIOD;
  wire OV7670_VSYNC;
  wire OV7670_XCLK;
  wire [15:0]SW;
  wire UART_rxd;
  wire UART_txd;
  wire ampSD;
  wire pwdn;
  wire reset;
  wire reset_1;
  wire speaker_out;
  wire sys_clock;
  wire tft_hsync;
  wire [5:0]tft_vga_b;
  wire [5:0]tft_vga_g;
  wire [5:0]tft_vga_r;
  wire tft_vsync;

  design_1 design_1_i
       (.BTNC(BTNC),
        .DDR2_addr(DDR2_addr),
        .DDR2_ba(DDR2_ba),
        .DDR2_cas_n(DDR2_cas_n),
        .DDR2_ck_n(DDR2_ck_n),
        .DDR2_ck_p(DDR2_ck_p),
        .DDR2_cke(DDR2_cke),
        .DDR2_cs_n(DDR2_cs_n),
        .DDR2_dm(DDR2_dm),
        .DDR2_dq(DDR2_dq),
        .DDR2_dqs_n(DDR2_dqs_n),
        .DDR2_dqs_p(DDR2_dqs_p),
        .DDR2_odt(DDR2_odt),
        .DDR2_ras_n(DDR2_ras_n),
        .DDR2_we_n(DDR2_we_n),
        .LED(LED),
        .OV7670_D(OV7670_D),
        .OV7670_HREF(OV7670_HREF),
        .OV7670_PCLK(OV7670_PCLK),
        .OV7670_SIOC(OV7670_SIOC),
        .OV7670_SIOD(OV7670_SIOD),
        .OV7670_VSYNC(OV7670_VSYNC),
        .OV7670_XCLK(OV7670_XCLK),
        .SW(SW),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd),
        .ampSD(ampSD),
        .pwdn(pwdn),
        .reset(reset),
        .reset_1(reset_1),
        .speaker_out(speaker_out),
        .sys_clock(sys_clock),
        .tft_hsync(tft_hsync),
        .tft_vga_b(tft_vga_b),
        .tft_vga_g(tft_vga_g),
        .tft_vga_r(tft_vga_r),
        .tft_vsync(tft_vsync));
endmodule
