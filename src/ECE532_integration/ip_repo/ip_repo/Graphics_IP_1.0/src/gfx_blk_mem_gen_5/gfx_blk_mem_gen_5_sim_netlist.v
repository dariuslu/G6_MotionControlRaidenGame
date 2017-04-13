// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Wed Mar 29 15:12:22 2017
// Host        : ZheWu running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/xilinx/Zhe/ip_repo/Graphics_IP_1.0/src/gfx_blk_mem_gen_5/gfx_blk_mem_gen_5_sim_netlist.v
// Design      : gfx_blk_mem_gen_5
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gfx_blk_mem_gen_5,blk_mem_gen_v8_3_3,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_3_3,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module gfx_blk_mem_gen_5
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.95215 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "gfx_blk_mem_gen_5.mem" *) 
  (* C_INIT_FILE_NAME = "gfx_blk_mem_gen_5.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module gfx_blk_mem_gen_5_blk_mem_gen_generic_cstr
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;

  gfx_blk_mem_gen_5_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module gfx_blk_mem_gen_5_blk_mem_gen_prim_width
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;

  gfx_blk_mem_gen_5_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module gfx_blk_mem_gen_5_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_85 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_86 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_87 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* CLOCK_DOMAINS = "COMMON" *) 
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00E0B61F00E0B61F00E0B61F00AB8B1800AB8B18001915040019150400EEF3FA),
    .INIT_01(256'h00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_02(256'h00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_03(256'h0015060000997C1500997C1500E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_04(256'h00E0B61F00E0B61F00E0B61F00AB8B1800AB8B18001915040019150400EEF3FA),
    .INIT_05(256'h00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_06(256'h00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_07(256'h0015060000997C1500997C1500E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_08(256'h00F2E09F00ECD17100ECD17100E4BE3700E4BE3700C19D1B00C19D1B00EEF3FA),
    .INIT_09(256'h00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F3E3A800F3E3A800F2E09F),
    .INIT_0A(256'h00F3E3AB00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD),
    .INIT_0B(256'h006F200000D6B23400D6B23400ECD17300ECD17300F2E0A000F2E0A000F3E3AB),
    .INIT_0C(256'h00F2E09F00ECD17100ECD17100E4BE3700E4BE3700C19D1B00C19D1B00EEF3FA),
    .INIT_0D(256'h00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F3E3A800F3E3A800F2E09F),
    .INIT_0E(256'h00F3E3AB00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD),
    .INIT_0F(256'h006F200000D6B23400D6B23400ECD17300ECD17300F2E0A000F2E0A000F3E3AB),
    .INIT_10(256'h00FFFFFF00FCF7E700FCF7E700ECD17300ECD17300E0B61F00E0B61F00EEF3FA),
    .INIT_11(256'h00FAF3DC00FAF4DE00FAF4DE00FBF5E000FBF5E000FCF8EC00FCF8EC00FFFFFF),
    .INIT_12(256'h00FBF6E200FAF3DB00FAF3DB00FAF3DC00FAF3DC00FAF3DC00FAF3DC00FAF3DC),
    .INIT_13(256'h00A9300000EACD6800EACD6800FCF8E900FCF8E900FFFFFE00FFFFFE00FBF6E2),
    .INIT_14(256'h00FFFFFF00FCF7E700FCF7E700ECD17300ECD17300E0B61F00E0B61F00EEF3FA),
    .INIT_15(256'h00FAF3DC00FAF4DE00FAF4DE00FBF5E000FBF5E000FCF8EC00FCF8EC00FFFFFF),
    .INIT_16(256'h00FBF6E200FAF3DB00FAF3DB00FAF3DC00FAF3DC00FAF3DC00FAF3DC00FAF3DC),
    .INIT_17(256'h00A9300000EACD6800EACD6800FCF8E900FCF8E900FFFFFE00FFFFFE00FBF6E2),
    .INIT_18(256'h00F1DE9900FFFEFC00FFFEFC00F3E2A400F3E2A400E0B61F00E0B61F00EEF3FA),
    .INIT_19(256'h00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E7C54C00E7C54C00F1DE99),
    .INIT_1A(256'h00DEB41F00D7AE1E00D7AE1E00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_1B(256'h00A02E0000EFD98D00EFD98D00FFFEFC00FFFEFC00F0DB8F00F0DB8F00DEB41F),
    .INIT_1C(256'h00F1DE9900FFFEFC00FFFEFC00F3E2A400F3E2A400E0B61F00E0B61F00EEF3FA),
    .INIT_1D(256'h00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E7C54C00E7C54C00F1DE99),
    .INIT_1E(256'h00DEB41F00D7AE1E00D7AE1E00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F),
    .INIT_1F(256'h00A02E0000EFD98D00EFD98D00FFFEFC00FFFEFC00F0DB8F00F0DB8F00DEB41F),
    .INIT_20(256'h00E4BE3900F9F2D700F9F2D700F4E5AF00F4E5AF00E0B61F00E0B61F00EEF3FA),
    .INIT_21(256'h00FEFCF900FEFDFB00FEFDFB00FFFFFE00FFFFFE00F3E3A800F3E3A800E4BE39),
    .INIT_22(256'h00C7A11C00F4E8C000F4E8C000FAF4DE00FAF4DE00FDF9EF00FDF9EF00FEFCF9),
    .INIT_23(256'h00A02E0000F1DD9800F1DD9800FAF3DC00FAF3DC00CEA71D00CEA71D00C7A11C),
    .INIT_24(256'h00E4BE3900F9F2D700F9F2D700F4E5AF00F4E5AF00E0B61F00E0B61F00EEF3FA),
    .INIT_25(256'h00FEFCF900FEFDFB00FEFDFB00FFFFFE00FFFFFE00F3E3A800F3E3A800E4BE39),
    .INIT_26(256'h00C7A11C00F4E8C000F4E8C000FAF4DE00FAF4DE00FDF9EF00FDF9EF00FEFCF9),
    .INIT_27(256'h00A02E0000F1DD9800F1DD9800FAF3DC00FAF3DC00CEA71D00CEA71D00C7A11C),
    .INIT_28(256'h00DCB21F00F7EBC200F7EBC200F4E4AD00F4E4AD00E0B61F00E0B61F00EEF3FA),
    .INIT_29(256'h00F9F4E100F9F4E100F9F4E100FFFEFC00FFFEFC00F6EBC400F6EBC400DCB21F),
    .INIT_2A(256'h00BD991A00F1E2AA00F1E2AA00FAF4DF00FAF4DF00FAF5E200FAF5E200F9F4E1),
    .INIT_2B(256'h00A02E0000EFD98B00EFD98B00F6EABE00F6EABE00C29D1B00C29D1B00BD991A),
    .INIT_2C(256'h00DCB21F00F7EBC200F7EBC200F4E4AD00F4E4AD00E0B61F00E0B61F00EEF3FA),
    .INIT_2D(256'h00F9F4E100F9F4E100F9F4E100FFFEFC00FFFEFC00F6EBC400F6EBC400DCB21F),
    .INIT_2E(256'h00BD991A00F1E2AA00F1E2AA00FAF4DF00FAF4DF00FAF5E200FAF5E200F9F4E1),
    .INIT_2F(256'h00A02E0000EFD98B00EFD98B00F6EABE00F6EABE00C29D1B00C29D1B00BD991A),
    .INIT_30(256'h00D7AE1E00F5E7B600F5E7B600F2E0A200F2E0A200DCB21F00DCB21F00EEF3FA),
    .INIT_31(256'h0055491F005F532A005F532A00FBF8EC00FBF8EC00FBF8EA00FBF8EA00D7AE1E),
    .INIT_32(256'h00D0A91D004F400B004F400B006E5910006E59100069540F0069540F0055491F),
    .INIT_33(256'h009C2C0000EED68100EED68100F5E7B600F5E7B600CCA51C00CCA51C00D0A91D),
    .INIT_34(256'h00D7AE1E00F5E7B600F5E7B600F2E0A200F2E0A200DCB21F00DCB21F00EEF3FA),
    .INIT_35(256'h0055491F005F532A005F532A00FBF8EC00FBF8EC00FBF8EA00FBF8EA00D7AE1E),
    .INIT_36(256'h00D0A91D004F400B004F400B006E5910006E59100069540F0069540F0055491F),
    .INIT_37(256'h009C2C0000EED68100EED68100F5E7B600F5E7B600CCA51C00CCA51C00D0A91D),
    .INIT_38(256'h00CEA71D00F3E3A900F3E3A900F1DD9600F1DD9600CEA71D00CEA71D00EEF3FA),
    .INIT_39(256'h00FCF8EF00FDFBF600FDFBF600FEFDF800FEFDF800FCF7E800FCF7E800CEA71D),
    .INIT_3A(256'h00C39E1B00D3AB1D00D3AB1D00D7AE1E00D7AE1E00F3E8C200F3E8C200FCF8EF),
    .INIT_3B(256'h008E270000EDD47C00EDD47C00F5E7B700F5E7B700BE9A1A00BE9A1A00C39E1B),
    .INIT_3C(256'h00CEA71D00F3E3A900F3E3A900F1DD9600F1DD9600CEA71D00CEA71D00EEF3FA),
    .INIT_3D(256'h00FCF8EF00FDFBF600FDFBF600FEFDF800FEFDF800FCF7E800FCF7E800CEA71D),
    .INIT_3E(256'h00C39E1B00D3AB1D00D3AB1D00D7AE1E00D7AE1E00F3E8C200F3E8C200FCF8EF),
    .INIT_3F(256'h008E270000EDD47C00EDD47C00F5E7B700F5E7B700BE9A1A00BE9A1A00C39E1B),
    .INIT_40(256'h00C39E1B00F2E09F00F2E09F00EFD88800EFD88800BE9A1A00BE9A1A00EEF3FA),
    .INIT_41(256'h00FEFDFA00FEFDF900FEFDF900FEFEFB00FEFEFB00FAF4DF00FAF4DF00C39E1B),
    .INIT_42(256'h00B7941900C09C1B00C09C1B00CCA51C00CCA51C00F4E8BF00F4E8BF00FEFDFA),
    .INIT_43(256'h007D220000ECD17100ECD17100F4E6B200F4E6B200B9961A00B9961A00B79419),
    .INIT_44(256'h00C39E1B00F2E09F00F2E09F00EFD88800EFD88800BE9A1A00BE9A1A00EEF3FA),
    .INIT_45(256'h00FEFDFA00FEFDF900FEFDF900FEFEFB00FEFEFB00FAF4DF00FAF4DF00C39E1B),
    .INIT_46(256'h00B7941900C09C1B00C09C1B00CCA51C00CCA51C00F4E8BF00F4E8BF00FEFDFA),
    .INIT_47(256'h007D220000ECD17100ECD17100F4E6B200F4E6B200B9961A00B9961A00B79419),
    .INIT_48(256'h00B08F1900F0DB9200F0DB9200EDD47A00EDD47A00AB8B1800AB8B1800EEF3FA),
    .INIT_49(256'h0069550F00735D1000735D1000EDE2B900EDE2B900F7F3E100F7F3E100B08F19),
    .INIT_4A(256'h00AC8B1800B08F1900B08F190092761400927614006A560F006A560F0069550F),
    .INIT_4B(256'h00691A0000E9CB5F00E9CB5F00F3E2A600F3E2A600AE8D1800AE8D1800AC8B18),
    .INIT_4C(256'h00B08F1900F0DB9200F0DB9200EDD47A00EDD47A00AB8B1800AB8B1800EEF3FA),
    .INIT_4D(256'h0069550F00735D1000735D1000EDE2B900EDE2B900F7F3E100F7F3E100B08F19),
    .INIT_4E(256'h00AC8B1800B08F1900B08F190092761400927614006A560F006A560F0069550F),
    .INIT_4F(256'h00691A0000E9CB5F00E9CB5F00F3E2A600F3E2A600AE8D1800AE8D1800AC8B18),
    .INIT_50(256'h00997C1500EED78400EED78400EBCF6D00EBCF6D00977A1500977A1500EEF3FA),
    .INIT_51(256'h00A28317003C3109003C310900E5D9AF00E5D9AF00F6F0DF00F6F0DF00997C15),
    .INIT_52(256'h00997C15009D7F16009D7F16009E8016009E801600A2831700A2831700A28317),
    .INIT_53(256'h0054140000E7C65100E7C65100F1DD9800F1DD9800997C1500997C1500997C15),
    .INIT_54(256'h00997C1500EED78400EED78400EBCF6D00EBCF6D00977A1500977A1500EEF3FA),
    .INIT_55(256'h00A28317003C3109003C310900E5D9AF00E5D9AF00F6F0DF00F6F0DF00997C15),
    .INIT_56(256'h00997C15009D7F16009D7F16009E8016009E801600A2831700A2831700A28317),
    .INIT_57(256'h0054140000E7C65100E7C65100F1DD9800F1DD9800997C1500997C1500997C15),
    .INIT_58(256'h0094781500EDD47D00EDD47D00E9CA5C00E9CA5C00886E1300886E1300EEF3FA),
    .INIT_59(256'h008D7214003A2F08003A2F0800E8E1C700E8E1C700DDD0A200DDD0A200947815),
    .INIT_5A(256'h00846B1300866D1300866D1300886E1300886E1300896F1300896F13008D7214),
    .INIT_5B(256'h00460F0000E7C65000E7C65000F3E2A400F3E2A400967A1500967A1500846B13),
    .INIT_5C(256'h0094781500EDD47D00EDD47D00E9CA5C00E9CA5C00886E1300886E1300EEF3FA),
    .INIT_5D(256'h008D7214003A2F08003A2F0800E8E1C700E8E1C700DDD0A200DDD0A200947815),
    .INIT_5E(256'h00846B1300866D1300866D1300886E1300886E1300896F1300896F13008D7214),
    .INIT_5F(256'h00460F0000E7C65000E7C65000F3E2A400F3E2A400967A1500967A1500846B13),
    .INIT_60(256'h00C9A31C00EED78400EED78400E5C14300E5C143007F6712007F671200EEF3FA),
    .INIT_61(256'h007660110078611100786111007962110079621100AE9D6400AE9D6400C9A31C),
    .INIT_62(256'h0082691200786111007861110079621100796211007962110079621100766011),
    .INIT_63(256'h00460F0000E9CA5E00E9CA5E00F9F1D400F9F1D400DAB11E00DAB11E00826912),
    .INIT_64(256'h00C9A31C00EED78400EED78400E5C14300E5C143007F6712007F671200EEF3FA),
    .INIT_65(256'h007660110078611100786111007962110079621100AE9D6400AE9D6400C9A31C),
    .INIT_66(256'h0082691200786111007861110079621100796211007962110079621100766011),
    .INIT_67(256'h00460F0000E9CA5E00E9CA5E00F9F1D400F9F1D400DAB11E00DAB11E00826912),
    .INIT_68(256'h00F0DC9400EED78400EED78400DCB21F00DCB21F007D6612007D661200EEF3FA),
    .INIT_69(256'h00EED68100EED68100EED68100EED68100EED68100EED78400EED78400F0DC94),
    .INIT_6A(256'h00EFD98B00EDD57F00EDD57F00EED68100EED68100EED68100EED68100EED681),
    .INIT_6B(256'h004A100000E3BD3500E3BD3500F7ECC500F7ECC500F5E8B900F5E8B900EFD98B),
    .INIT_6C(256'h00F0DC9400EED78400EED78400DCB21F00DCB21F007D6612007D661200EEF3FA),
    .INIT_6D(256'h00EED68100EED68100EED68100EED68100EED68100EED78400EED78400F0DC94),
    .INIT_6E(256'h00EFD98B00EDD57F00EDD57F00EED68100EED68100EED68100EED68100EED681),
    .INIT_6F(256'h004A100000E3BD3500E3BD3500F7ECC500F7ECC500F5E8B900F5E8B900EFD98B),
    .INIT_70(256'h00E6C34800E1B72200E1B722009F8117009F8117005D4C0D005D4C0D00EEF3FA),
    .INIT_71(256'h00E7C65100E7C65000E7C65000E7C65100E7C65100E7C65000E7C65000E6C348),
    .INIT_72(256'h00E7C65300E7C54E00E7C54E00E7C65000E7C65000E7C65000E7C65000E7C651),
    .INIT_73(256'h00350B0000A6871700A6871700E4BF3A00E4BF3A00E8C85700E8C85700E7C653),
    .INIT_74(256'h00E6C34800E1B72200E1B722009F8117009F8117005D4C0D005D4C0D00EEF3FA),
    .INIT_75(256'h00E7C65100E7C65000E7C65000E7C65100E7C65100E7C65000E7C65000E6C348),
    .INIT_76(256'h00E7C65300E7C54E00E7C54E00E7C65000E7C65000E7C65000E7C65000E7C651),
    .INIT_77(256'h00350B0000A6871700A6871700E4BF3A00E4BF3A00E8C85700E8C85700E7C653),
    .INIT_78(256'h0062500E0064510E0064510E00382D0800382D08000404010004040100EEF3FA),
    .INIT_79(256'h0058470C0058470C0058470C0058470C0058470C005A490C005A490C0062500E),
    .INIT_7A(256'h0058470C0058470C0058470C0058470C0058470C0058470C0058470C0058470C),
    .INIT_7B(256'h000301000044380A0044380A0064510E0064510E0058470C0058470C0058470C),
    .INIT_7C(256'h0062500E0064510E0064510E00382D0800382D08000404010004040100EEF3FA),
    .INIT_7D(256'h0058470C0058470C0058470C0058470C0058470C005A490C005A490C0062500E),
    .INIT_7E(256'h0058470C0058470C0058470C0058470C0058470C0058470C0058470C0058470C),
    .INIT_7F(256'h000301000044380A0044380A0064510E0064510E0058470C0058470C0058470C),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI(dina),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(douta),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_85 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_86 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_87 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module gfx_blk_mem_gen_5_blk_mem_gen_top
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;

  gfx_blk_mem_gen_5_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "10" *) (* C_ADDRB_WIDTH = "10" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "1" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.95215 mW" *) 
(* C_FAMILY = "artix7" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "0" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "gfx_blk_mem_gen_5.mem" *) 
(* C_INIT_FILE_NAME = "gfx_blk_mem_gen_5.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "0" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1024" *) (* C_READ_DEPTH_B = "1024" *) (* C_READ_WIDTH_A = "32" *) 
(* C_READ_WIDTH_B = "32" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "1" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "1024" *) (* C_WRITE_DEPTH_B = "1024" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_3_3" *) (* downgradeipidentifiedwarnings = "yes" *) 
module gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [9:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [9:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [9:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [9:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_3_3_synth" *) 
module gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3_synth
   (douta,
    clka,
    addra,
    dina,
    wea);
  output [31:0]douta;
  input clka;
  input [9:0]addra;
  input [31:0]dina;
  input [0:0]wea;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire [0:0]wea;

  gfx_blk_mem_gen_5_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .dina(dina),
        .douta(douta),
        .wea(wea));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
