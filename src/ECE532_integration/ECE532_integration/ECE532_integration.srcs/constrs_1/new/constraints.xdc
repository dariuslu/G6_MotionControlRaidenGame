## Clock signal
set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { sys_clock }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {sys_clock}];
## Reset (CPU_RESET)
set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports { reset }];
#set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports reset]; #SW0 reset
##USB-RS232 Interface
set_property -dict { PACKAGE_PIN C4 IOSTANDARD LVCMOS33 } [get_ports { UART_rxd }];
set_property -dict { PACKAGE_PIN D4 IOSTANDARD LVCMOS33 } [get_ports { UART_txd }];

##audio
set_property -dict { PACKAGE_PIN A11 IOSTANDARD LVCMOS33 } [get_ports { speaker_out }];
set_property -dict { PACKAGE_PIN D12 IOSTANDARD LVCMOS33 } [get_ports { ampSD }];

#VGA Connector
set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[0] }]; #IO_L8N_T1_AD14N_35 Sch=vga_r[0]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[1] }]; #IO_L7N_T1_AD6N_35 Sch=vga_r[1]
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[2] }]; #IO_L1N_T0_AD4N_35 Sch=vga_r[2]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_r[3] }]; #IO_L8P_T1_AD14P_35 Sch=vga_r[3]

set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[0] }]; #IO_L1P_T0_AD4P_35 Sch=vga_g[0]
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[1] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=vga_g[1]
set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[2] }]; #IO_L2N_T0_AD12N_35 Sch=vga_g[2]
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_g[3] }]; #IO_L3P_T0_DQS_AD5P_35 Sch=vga_g[3]

set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[0] }]; #IO_L2P_T0_AD12P_35 Sch=vga_b[0]
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[1] }]; #IO_L4N_T0_35 Sch=vga_b[1]
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[2] }]; #IO_L6N_T0_VREF_35 Sch=vga_b[2]
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { tft_vga_b[3] }]; #IO_L4P_T0_35 Sch=vga_b[3]

set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { tft_hsync }]; #IO_L4P_T0_15 Sch=vga_hs
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { tft_vsync }]; #IO_L3N_T0_DQS_AD1N_15 Sch=vga_vs




##Pmod Header JA (Camera)

#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { pwdn }]; #IO_L20N_T3_A19_15 Sch=ja[1]
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[1] }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[3] }]; #IO_L21P_T3_DQS_15 Sch=ja[3]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[5] }]; #IO_L18N_T2_A23_15 Sch=ja[4]
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { reset_1 }]; #IO_L16N_T2_A27_15 Sch=ja[7]
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[0] }]; #IO_L16P_T2_A28_15 Sch=ja[8]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[2] }]; #IO_L22N_T3_A16_15 Sch=ja[9]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[4] }]; #IO_L22P_T3_A17_15 Sch=ja[10]


##Pmod Header JB (Camera)

#set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[7] }]; #IO_L1P_T0_AD0P_15 Sch=jb[1]
#set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { OV7670_PCLK }]; #IO_L14N_T2_SRCC_15 Sch=jb[2]
#set_property  CLOCK_DEDICATED_ROUTE FALSE [get_nets { OV7670_PCLK }];

#set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { OV7670_VSYNC }]; #IO_L13N_T2_MRCC_15 Sch=jb[3]
#set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { OV7670_SIOC }]; #IO_L15P_T2_DQS_15 Sch=jb[4]
#set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { OV7670_D[6] }]; #IO_L11N_T1_SRCC_15 Sch=jb[7]
#set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { OV7670_XCLK }]; #IO_L5P_T0_AD9P_15 Sch=jb[8]
#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { OV7670_HREF }]; #IO_0_15 Sch=jb[9]
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33  PULLUP TRUE } [get_ports { OV7670_SIOD }]; #IO_L13P_T2_MRCC_15 Sch=jb[10]


##Buttons

set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { BTNC }]; #IO_L9P_T1_DQS_14 Sch=btnc

##Swtiches

set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports SW[0]]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports SW[1]]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports SW[2]]
set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports SW[3]]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports SW[4]]
set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports SW[5]]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports SW[6]]
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports SW[7]]
#set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS33} [get_ports SW[8]]
#set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports SW[9]]
#set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports SW[10]]
#set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS33} [get_ports SW[11]]
#set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports SW[12]]
#set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports SW[13]]
#set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports SW[14]]
#set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports SW[15]]







## Clock signal
#set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clock_rtl]
#create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clock_rtl]

# SW0 bound to reset_rtl
#set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports reset_rtl]
# SW1 bound to reset_rtl_0
#set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports reset_rtl_0]


## LEDs

set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {LED[0]}]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {LED[1]}]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {LED[2]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {LED[3]}]




##Pmod Headers


##Pmod Header JA

set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports reset_1]
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[1]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[3]}]
set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[5]}]
set_property -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS33} [get_ports pwdn]
set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[0]}]
set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[2]}]
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[4]}]


##Pmod Header JB

set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[7]}]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports OV7670_PCLK]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets OV7670_PCLK]

set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports OV7670_VSYNC]
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports OV7670_SIOC]
set_property -dict {PACKAGE_PIN E16 IOSTANDARD LVCMOS33} [get_ports {OV7670_D[6]}]
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports OV7670_XCLK]
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports OV7670_HREF]
set_property PACKAGE_PIN H16 [get_ports OV7670_SIOD]
set_property IOSTANDARD LVCMOS33 [get_ports OV7670_SIOD]
set_property PULLUP true [get_ports OV7670_SIOD]
