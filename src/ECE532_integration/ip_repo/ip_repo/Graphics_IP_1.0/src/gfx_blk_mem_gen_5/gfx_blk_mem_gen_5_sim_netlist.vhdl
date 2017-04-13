-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Wed Mar 29 15:12:22 2017
-- Host        : ZheWu running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/xilinx/Zhe/ip_repo/Graphics_IP_1.0/src/gfx_blk_mem_gen_5/gfx_blk_mem_gen_5_sim_netlist.vhdl
-- Design      : gfx_blk_mem_gen_5
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gfx_blk_mem_gen_5_blk_mem_gen_prim_wrapper_init is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gfx_blk_mem_gen_5_blk_mem_gen_prim_wrapper_init : entity is "blk_mem_gen_prim_wrapper_init";
end gfx_blk_mem_gen_5_blk_mem_gen_prim_wrapper_init;

architecture STRUCTURE of gfx_blk_mem_gen_5_blk_mem_gen_prim_wrapper_init is
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_85\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_86\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_87\ : STD_LOGIC;
  signal \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute CLOCK_DOMAINS : string;
  attribute CLOCK_DOMAINS of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\ : label is "COMMON";
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"00E0B61F00E0B61F00E0B61F00AB8B1800AB8B18001915040019150400EEF3FA",
      INIT_01 => X"00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_02 => X"00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_03 => X"0015060000997C1500997C1500E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_04 => X"00E0B61F00E0B61F00E0B61F00AB8B1800AB8B18001915040019150400EEF3FA",
      INIT_05 => X"00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_06 => X"00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_07 => X"0015060000997C1500997C1500E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_08 => X"00F2E09F00ECD17100ECD17100E4BE3700E4BE3700C19D1B00C19D1B00EEF3FA",
      INIT_09 => X"00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F3E3A800F3E3A800F2E09F",
      INIT_0A => X"00F3E3AB00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD",
      INIT_0B => X"006F200000D6B23400D6B23400ECD17300ECD17300F2E0A000F2E0A000F3E3AB",
      INIT_0C => X"00F2E09F00ECD17100ECD17100E4BE3700E4BE3700C19D1B00C19D1B00EEF3FA",
      INIT_0D => X"00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F3E3A800F3E3A800F2E09F",
      INIT_0E => X"00F3E3AB00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD00F4E4AD",
      INIT_0F => X"006F200000D6B23400D6B23400ECD17300ECD17300F2E0A000F2E0A000F3E3AB",
      INIT_10 => X"00FFFFFF00FCF7E700FCF7E700ECD17300ECD17300E0B61F00E0B61F00EEF3FA",
      INIT_11 => X"00FAF3DC00FAF4DE00FAF4DE00FBF5E000FBF5E000FCF8EC00FCF8EC00FFFFFF",
      INIT_12 => X"00FBF6E200FAF3DB00FAF3DB00FAF3DC00FAF3DC00FAF3DC00FAF3DC00FAF3DC",
      INIT_13 => X"00A9300000EACD6800EACD6800FCF8E900FCF8E900FFFFFE00FFFFFE00FBF6E2",
      INIT_14 => X"00FFFFFF00FCF7E700FCF7E700ECD17300ECD17300E0B61F00E0B61F00EEF3FA",
      INIT_15 => X"00FAF3DC00FAF4DE00FAF4DE00FBF5E000FBF5E000FCF8EC00FCF8EC00FFFFFF",
      INIT_16 => X"00FBF6E200FAF3DB00FAF3DB00FAF3DC00FAF3DC00FAF3DC00FAF3DC00FAF3DC",
      INIT_17 => X"00A9300000EACD6800EACD6800FCF8E900FCF8E900FFFFFE00FFFFFE00FBF6E2",
      INIT_18 => X"00F1DE9900FFFEFC00FFFEFC00F3E2A400F3E2A400E0B61F00E0B61F00EEF3FA",
      INIT_19 => X"00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E7C54C00E7C54C00F1DE99",
      INIT_1A => X"00DEB41F00D7AE1E00D7AE1E00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_1B => X"00A02E0000EFD98D00EFD98D00FFFEFC00FFFEFC00F0DB8F00F0DB8F00DEB41F",
      INIT_1C => X"00F1DE9900FFFEFC00FFFEFC00F3E2A400F3E2A400E0B61F00E0B61F00EEF3FA",
      INIT_1D => X"00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F00E7C54C00E7C54C00F1DE99",
      INIT_1E => X"00DEB41F00D7AE1E00D7AE1E00E0B61F00E0B61F00E0B61F00E0B61F00E0B61F",
      INIT_1F => X"00A02E0000EFD98D00EFD98D00FFFEFC00FFFEFC00F0DB8F00F0DB8F00DEB41F",
      INIT_20 => X"00E4BE3900F9F2D700F9F2D700F4E5AF00F4E5AF00E0B61F00E0B61F00EEF3FA",
      INIT_21 => X"00FEFCF900FEFDFB00FEFDFB00FFFFFE00FFFFFE00F3E3A800F3E3A800E4BE39",
      INIT_22 => X"00C7A11C00F4E8C000F4E8C000FAF4DE00FAF4DE00FDF9EF00FDF9EF00FEFCF9",
      INIT_23 => X"00A02E0000F1DD9800F1DD9800FAF3DC00FAF3DC00CEA71D00CEA71D00C7A11C",
      INIT_24 => X"00E4BE3900F9F2D700F9F2D700F4E5AF00F4E5AF00E0B61F00E0B61F00EEF3FA",
      INIT_25 => X"00FEFCF900FEFDFB00FEFDFB00FFFFFE00FFFFFE00F3E3A800F3E3A800E4BE39",
      INIT_26 => X"00C7A11C00F4E8C000F4E8C000FAF4DE00FAF4DE00FDF9EF00FDF9EF00FEFCF9",
      INIT_27 => X"00A02E0000F1DD9800F1DD9800FAF3DC00FAF3DC00CEA71D00CEA71D00C7A11C",
      INIT_28 => X"00DCB21F00F7EBC200F7EBC200F4E4AD00F4E4AD00E0B61F00E0B61F00EEF3FA",
      INIT_29 => X"00F9F4E100F9F4E100F9F4E100FFFEFC00FFFEFC00F6EBC400F6EBC400DCB21F",
      INIT_2A => X"00BD991A00F1E2AA00F1E2AA00FAF4DF00FAF4DF00FAF5E200FAF5E200F9F4E1",
      INIT_2B => X"00A02E0000EFD98B00EFD98B00F6EABE00F6EABE00C29D1B00C29D1B00BD991A",
      INIT_2C => X"00DCB21F00F7EBC200F7EBC200F4E4AD00F4E4AD00E0B61F00E0B61F00EEF3FA",
      INIT_2D => X"00F9F4E100F9F4E100F9F4E100FFFEFC00FFFEFC00F6EBC400F6EBC400DCB21F",
      INIT_2E => X"00BD991A00F1E2AA00F1E2AA00FAF4DF00FAF4DF00FAF5E200FAF5E200F9F4E1",
      INIT_2F => X"00A02E0000EFD98B00EFD98B00F6EABE00F6EABE00C29D1B00C29D1B00BD991A",
      INIT_30 => X"00D7AE1E00F5E7B600F5E7B600F2E0A200F2E0A200DCB21F00DCB21F00EEF3FA",
      INIT_31 => X"0055491F005F532A005F532A00FBF8EC00FBF8EC00FBF8EA00FBF8EA00D7AE1E",
      INIT_32 => X"00D0A91D004F400B004F400B006E5910006E59100069540F0069540F0055491F",
      INIT_33 => X"009C2C0000EED68100EED68100F5E7B600F5E7B600CCA51C00CCA51C00D0A91D",
      INIT_34 => X"00D7AE1E00F5E7B600F5E7B600F2E0A200F2E0A200DCB21F00DCB21F00EEF3FA",
      INIT_35 => X"0055491F005F532A005F532A00FBF8EC00FBF8EC00FBF8EA00FBF8EA00D7AE1E",
      INIT_36 => X"00D0A91D004F400B004F400B006E5910006E59100069540F0069540F0055491F",
      INIT_37 => X"009C2C0000EED68100EED68100F5E7B600F5E7B600CCA51C00CCA51C00D0A91D",
      INIT_38 => X"00CEA71D00F3E3A900F3E3A900F1DD9600F1DD9600CEA71D00CEA71D00EEF3FA",
      INIT_39 => X"00FCF8EF00FDFBF600FDFBF600FEFDF800FEFDF800FCF7E800FCF7E800CEA71D",
      INIT_3A => X"00C39E1B00D3AB1D00D3AB1D00D7AE1E00D7AE1E00F3E8C200F3E8C200FCF8EF",
      INIT_3B => X"008E270000EDD47C00EDD47C00F5E7B700F5E7B700BE9A1A00BE9A1A00C39E1B",
      INIT_3C => X"00CEA71D00F3E3A900F3E3A900F1DD9600F1DD9600CEA71D00CEA71D00EEF3FA",
      INIT_3D => X"00FCF8EF00FDFBF600FDFBF600FEFDF800FEFDF800FCF7E800FCF7E800CEA71D",
      INIT_3E => X"00C39E1B00D3AB1D00D3AB1D00D7AE1E00D7AE1E00F3E8C200F3E8C200FCF8EF",
      INIT_3F => X"008E270000EDD47C00EDD47C00F5E7B700F5E7B700BE9A1A00BE9A1A00C39E1B",
      INIT_40 => X"00C39E1B00F2E09F00F2E09F00EFD88800EFD88800BE9A1A00BE9A1A00EEF3FA",
      INIT_41 => X"00FEFDFA00FEFDF900FEFDF900FEFEFB00FEFEFB00FAF4DF00FAF4DF00C39E1B",
      INIT_42 => X"00B7941900C09C1B00C09C1B00CCA51C00CCA51C00F4E8BF00F4E8BF00FEFDFA",
      INIT_43 => X"007D220000ECD17100ECD17100F4E6B200F4E6B200B9961A00B9961A00B79419",
      INIT_44 => X"00C39E1B00F2E09F00F2E09F00EFD88800EFD88800BE9A1A00BE9A1A00EEF3FA",
      INIT_45 => X"00FEFDFA00FEFDF900FEFDF900FEFEFB00FEFEFB00FAF4DF00FAF4DF00C39E1B",
      INIT_46 => X"00B7941900C09C1B00C09C1B00CCA51C00CCA51C00F4E8BF00F4E8BF00FEFDFA",
      INIT_47 => X"007D220000ECD17100ECD17100F4E6B200F4E6B200B9961A00B9961A00B79419",
      INIT_48 => X"00B08F1900F0DB9200F0DB9200EDD47A00EDD47A00AB8B1800AB8B1800EEF3FA",
      INIT_49 => X"0069550F00735D1000735D1000EDE2B900EDE2B900F7F3E100F7F3E100B08F19",
      INIT_4A => X"00AC8B1800B08F1900B08F190092761400927614006A560F006A560F0069550F",
      INIT_4B => X"00691A0000E9CB5F00E9CB5F00F3E2A600F3E2A600AE8D1800AE8D1800AC8B18",
      INIT_4C => X"00B08F1900F0DB9200F0DB9200EDD47A00EDD47A00AB8B1800AB8B1800EEF3FA",
      INIT_4D => X"0069550F00735D1000735D1000EDE2B900EDE2B900F7F3E100F7F3E100B08F19",
      INIT_4E => X"00AC8B1800B08F1900B08F190092761400927614006A560F006A560F0069550F",
      INIT_4F => X"00691A0000E9CB5F00E9CB5F00F3E2A600F3E2A600AE8D1800AE8D1800AC8B18",
      INIT_50 => X"00997C1500EED78400EED78400EBCF6D00EBCF6D00977A1500977A1500EEF3FA",
      INIT_51 => X"00A28317003C3109003C310900E5D9AF00E5D9AF00F6F0DF00F6F0DF00997C15",
      INIT_52 => X"00997C15009D7F16009D7F16009E8016009E801600A2831700A2831700A28317",
      INIT_53 => X"0054140000E7C65100E7C65100F1DD9800F1DD9800997C1500997C1500997C15",
      INIT_54 => X"00997C1500EED78400EED78400EBCF6D00EBCF6D00977A1500977A1500EEF3FA",
      INIT_55 => X"00A28317003C3109003C310900E5D9AF00E5D9AF00F6F0DF00F6F0DF00997C15",
      INIT_56 => X"00997C15009D7F16009D7F16009E8016009E801600A2831700A2831700A28317",
      INIT_57 => X"0054140000E7C65100E7C65100F1DD9800F1DD9800997C1500997C1500997C15",
      INIT_58 => X"0094781500EDD47D00EDD47D00E9CA5C00E9CA5C00886E1300886E1300EEF3FA",
      INIT_59 => X"008D7214003A2F08003A2F0800E8E1C700E8E1C700DDD0A200DDD0A200947815",
      INIT_5A => X"00846B1300866D1300866D1300886E1300886E1300896F1300896F13008D7214",
      INIT_5B => X"00460F0000E7C65000E7C65000F3E2A400F3E2A400967A1500967A1500846B13",
      INIT_5C => X"0094781500EDD47D00EDD47D00E9CA5C00E9CA5C00886E1300886E1300EEF3FA",
      INIT_5D => X"008D7214003A2F08003A2F0800E8E1C700E8E1C700DDD0A200DDD0A200947815",
      INIT_5E => X"00846B1300866D1300866D1300886E1300886E1300896F1300896F13008D7214",
      INIT_5F => X"00460F0000E7C65000E7C65000F3E2A400F3E2A400967A1500967A1500846B13",
      INIT_60 => X"00C9A31C00EED78400EED78400E5C14300E5C143007F6712007F671200EEF3FA",
      INIT_61 => X"007660110078611100786111007962110079621100AE9D6400AE9D6400C9A31C",
      INIT_62 => X"0082691200786111007861110079621100796211007962110079621100766011",
      INIT_63 => X"00460F0000E9CA5E00E9CA5E00F9F1D400F9F1D400DAB11E00DAB11E00826912",
      INIT_64 => X"00C9A31C00EED78400EED78400E5C14300E5C143007F6712007F671200EEF3FA",
      INIT_65 => X"007660110078611100786111007962110079621100AE9D6400AE9D6400C9A31C",
      INIT_66 => X"0082691200786111007861110079621100796211007962110079621100766011",
      INIT_67 => X"00460F0000E9CA5E00E9CA5E00F9F1D400F9F1D400DAB11E00DAB11E00826912",
      INIT_68 => X"00F0DC9400EED78400EED78400DCB21F00DCB21F007D6612007D661200EEF3FA",
      INIT_69 => X"00EED68100EED68100EED68100EED68100EED68100EED78400EED78400F0DC94",
      INIT_6A => X"00EFD98B00EDD57F00EDD57F00EED68100EED68100EED68100EED68100EED681",
      INIT_6B => X"004A100000E3BD3500E3BD3500F7ECC500F7ECC500F5E8B900F5E8B900EFD98B",
      INIT_6C => X"00F0DC9400EED78400EED78400DCB21F00DCB21F007D6612007D661200EEF3FA",
      INIT_6D => X"00EED68100EED68100EED68100EED68100EED68100EED78400EED78400F0DC94",
      INIT_6E => X"00EFD98B00EDD57F00EDD57F00EED68100EED68100EED68100EED68100EED681",
      INIT_6F => X"004A100000E3BD3500E3BD3500F7ECC500F7ECC500F5E8B900F5E8B900EFD98B",
      INIT_70 => X"00E6C34800E1B72200E1B722009F8117009F8117005D4C0D005D4C0D00EEF3FA",
      INIT_71 => X"00E7C65100E7C65000E7C65000E7C65100E7C65100E7C65000E7C65000E6C348",
      INIT_72 => X"00E7C65300E7C54E00E7C54E00E7C65000E7C65000E7C65000E7C65000E7C651",
      INIT_73 => X"00350B0000A6871700A6871700E4BF3A00E4BF3A00E8C85700E8C85700E7C653",
      INIT_74 => X"00E6C34800E1B72200E1B722009F8117009F8117005D4C0D005D4C0D00EEF3FA",
      INIT_75 => X"00E7C65100E7C65000E7C65000E7C65100E7C65100E7C65000E7C65000E6C348",
      INIT_76 => X"00E7C65300E7C54E00E7C54E00E7C65000E7C65000E7C65000E7C65000E7C651",
      INIT_77 => X"00350B0000A6871700A6871700E4BF3A00E4BF3A00E8C85700E8C85700E7C653",
      INIT_78 => X"0062500E0064510E0064510E00382D0800382D08000404010004040100EEF3FA",
      INIT_79 => X"0058470C0058470C0058470C0058470C0058470C005A490C005A490C0062500E",
      INIT_7A => X"0058470C0058470C0058470C0058470C0058470C0058470C0058470C0058470C",
      INIT_7B => X"000301000044380A0044380A0064510E0064510E0058470C0058470C0058470C",
      INIT_7C => X"0062500E0064510E0064510E00382D0800382D08000404010004040100EEF3FA",
      INIT_7D => X"0058470C0058470C0058470C0058470C0058470C005A490C005A490C0062500E",
      INIT_7E => X"0058470C0058470C0058470C0058470C0058470C0058470C0058470C0058470C",
      INIT_7F => X"000301000044380A0044380A0064510E0064510E0058470C0058470C0058470C",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"11111",
      ADDRBWRADDR(15 downto 0) => B"0000000000000000",
      CASCADEINA => '0',
      CASCADEINB => '0',
      CASCADEOUTA => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\,
      DIADI(31 downto 0) => dina(31 downto 0),
      DIBDI(31 downto 0) => B"00000000000000000000000000000000",
      DIPADIP(3 downto 0) => B"0000",
      DIPBDIP(3 downto 0) => B"0000",
      DOADO(31 downto 0) => douta(31 downto 0),
      DOBDO(31 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\(31 downto 0),
      DOPADOP(3) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_85\,
      DOPADOP(2) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_86\,
      DOPADOP(1) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_87\,
      DOPADOP(0) => \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_88\,
      DOPBDOP(3 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => '1',
      ENBWREN => '0',
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\,
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7 downto 0) => B"00000000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gfx_blk_mem_gen_5_blk_mem_gen_prim_width is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gfx_blk_mem_gen_5_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end gfx_blk_mem_gen_5_blk_mem_gen_prim_width;

architecture STRUCTURE of gfx_blk_mem_gen_5_blk_mem_gen_prim_width is
begin
\prim_init.ram\: entity work.gfx_blk_mem_gen_5_blk_mem_gen_prim_wrapper_init
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      clka => clka,
      dina(31 downto 0) => dina(31 downto 0),
      douta(31 downto 0) => douta(31 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gfx_blk_mem_gen_5_blk_mem_gen_generic_cstr is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gfx_blk_mem_gen_5_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end gfx_blk_mem_gen_5_blk_mem_gen_generic_cstr;

architecture STRUCTURE of gfx_blk_mem_gen_5_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.gfx_blk_mem_gen_5_blk_mem_gen_prim_width
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      clka => clka,
      dina(31 downto 0) => dina(31 downto 0),
      douta(31 downto 0) => douta(31 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gfx_blk_mem_gen_5_blk_mem_gen_top is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gfx_blk_mem_gen_5_blk_mem_gen_top : entity is "blk_mem_gen_top";
end gfx_blk_mem_gen_5_blk_mem_gen_top;

architecture STRUCTURE of gfx_blk_mem_gen_5_blk_mem_gen_top is
begin
\valid.cstr\: entity work.gfx_blk_mem_gen_5_blk_mem_gen_generic_cstr
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      clka => clka,
      dina(31 downto 0) => dina(31 downto 0),
      douta(31 downto 0) => douta(31 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3_synth is
  port (
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wea : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3_synth : entity is "blk_mem_gen_v8_3_3_synth";
end gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3_synth;

architecture STRUCTURE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3_synth is
begin
\gnbram.gnativebmg.native_blk_mem_gen\: entity work.gfx_blk_mem_gen_5_blk_mem_gen_top
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      clka => clka,
      dina(31 downto 0) => dina(31 downto 0),
      douta(31 downto 0) => douta(31 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 is
  port (
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 31 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    eccpipece : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    rdaddrecc : out STD_LOGIC_VECTOR ( 9 downto 0 );
    sleep : in STD_LOGIC;
    deepsleep : in STD_LOGIC;
    shutdown : in STD_LOGIC;
    rsta_busy : out STD_LOGIC;
    rstb_busy : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_injectsbiterr : in STD_LOGIC;
    s_axi_injectdbiterr : in STD_LOGIC;
    s_axi_sbiterr : out STD_LOGIC;
    s_axi_dbiterr : out STD_LOGIC;
    s_axi_rdaddrecc : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 10;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 10;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "1";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "Estimated Power for IP     :     2.95215 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "gfx_blk_mem_gen_5.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "gfx_blk_mem_gen_5.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1024;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1024;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 32;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 32;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1024;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 1024;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 32;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is 32;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "artix7";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "blk_mem_gen_v8_3_3";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 : entity is "yes";
end gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3;

architecture STRUCTURE of gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3 is
  signal \<const0>\ : STD_LOGIC;
begin
  dbiterr <= \<const0>\;
  doutb(31) <= \<const0>\;
  doutb(30) <= \<const0>\;
  doutb(29) <= \<const0>\;
  doutb(28) <= \<const0>\;
  doutb(27) <= \<const0>\;
  doutb(26) <= \<const0>\;
  doutb(25) <= \<const0>\;
  doutb(24) <= \<const0>\;
  doutb(23) <= \<const0>\;
  doutb(22) <= \<const0>\;
  doutb(21) <= \<const0>\;
  doutb(20) <= \<const0>\;
  doutb(19) <= \<const0>\;
  doutb(18) <= \<const0>\;
  doutb(17) <= \<const0>\;
  doutb(16) <= \<const0>\;
  doutb(15) <= \<const0>\;
  doutb(14) <= \<const0>\;
  doutb(13) <= \<const0>\;
  doutb(12) <= \<const0>\;
  doutb(11) <= \<const0>\;
  doutb(10) <= \<const0>\;
  doutb(9) <= \<const0>\;
  doutb(8) <= \<const0>\;
  doutb(7) <= \<const0>\;
  doutb(6) <= \<const0>\;
  doutb(5) <= \<const0>\;
  doutb(4) <= \<const0>\;
  doutb(3) <= \<const0>\;
  doutb(2) <= \<const0>\;
  doutb(1) <= \<const0>\;
  doutb(0) <= \<const0>\;
  rdaddrecc(9) <= \<const0>\;
  rdaddrecc(8) <= \<const0>\;
  rdaddrecc(7) <= \<const0>\;
  rdaddrecc(6) <= \<const0>\;
  rdaddrecc(5) <= \<const0>\;
  rdaddrecc(4) <= \<const0>\;
  rdaddrecc(3) <= \<const0>\;
  rdaddrecc(2) <= \<const0>\;
  rdaddrecc(1) <= \<const0>\;
  rdaddrecc(0) <= \<const0>\;
  rsta_busy <= \<const0>\;
  rstb_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_dbiterr <= \<const0>\;
  s_axi_rdaddrecc(9) <= \<const0>\;
  s_axi_rdaddrecc(8) <= \<const0>\;
  s_axi_rdaddrecc(7) <= \<const0>\;
  s_axi_rdaddrecc(6) <= \<const0>\;
  s_axi_rdaddrecc(5) <= \<const0>\;
  s_axi_rdaddrecc(4) <= \<const0>\;
  s_axi_rdaddrecc(3) <= \<const0>\;
  s_axi_rdaddrecc(2) <= \<const0>\;
  s_axi_rdaddrecc(1) <= \<const0>\;
  s_axi_rdaddrecc(0) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_sbiterr <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
inst_blk_mem_gen: entity work.gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3_synth
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      clka => clka,
      dina(31 downto 0) => dina(31 downto 0),
      douta(31 downto 0) => douta(31 downto 0),
      wea(0) => wea(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gfx_blk_mem_gen_5 is
  port (
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 31 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of gfx_blk_mem_gen_5 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of gfx_blk_mem_gen_5 : entity is "gfx_blk_mem_gen_5,blk_mem_gen_v8_3_3,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of gfx_blk_mem_gen_5 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of gfx_blk_mem_gen_5 : entity is "blk_mem_gen_v8_3_3,Vivado 2016.2";
end gfx_blk_mem_gen_5;

architecture STRUCTURE of gfx_blk_mem_gen_5 is
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rsta_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rstb_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_doutb_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_rdaddrecc_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ADDRA_WIDTH : integer;
  attribute C_ADDRA_WIDTH of U0 : label is 10;
  attribute C_ADDRB_WIDTH : integer;
  attribute C_ADDRB_WIDTH of U0 : label is 10;
  attribute C_ALGORITHM : integer;
  attribute C_ALGORITHM of U0 : label is 1;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 4;
  attribute C_AXI_SLAVE_TYPE : integer;
  attribute C_AXI_SLAVE_TYPE of U0 : label is 0;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_BYTE_SIZE : integer;
  attribute C_BYTE_SIZE of U0 : label is 9;
  attribute C_COMMON_CLK : integer;
  attribute C_COMMON_CLK of U0 : label is 0;
  attribute C_COUNT_18K_BRAM : string;
  attribute C_COUNT_18K_BRAM of U0 : label is "0";
  attribute C_COUNT_36K_BRAM : string;
  attribute C_COUNT_36K_BRAM of U0 : label is "1";
  attribute C_CTRL_ECC_ALGO : string;
  attribute C_CTRL_ECC_ALGO of U0 : label is "NONE";
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of U0 : label is "0";
  attribute C_DISABLE_WARN_BHV_COLL : integer;
  attribute C_DISABLE_WARN_BHV_COLL of U0 : label is 0;
  attribute C_DISABLE_WARN_BHV_RANGE : integer;
  attribute C_DISABLE_WARN_BHV_RANGE of U0 : label is 0;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of U0 : label is "./";
  attribute C_ENABLE_32BIT_ADDRESS : integer;
  attribute C_ENABLE_32BIT_ADDRESS of U0 : label is 0;
  attribute C_EN_DEEPSLEEP_PIN : integer;
  attribute C_EN_DEEPSLEEP_PIN of U0 : label is 0;
  attribute C_EN_ECC_PIPE : integer;
  attribute C_EN_ECC_PIPE of U0 : label is 0;
  attribute C_EN_RDADDRA_CHG : integer;
  attribute C_EN_RDADDRA_CHG of U0 : label is 0;
  attribute C_EN_RDADDRB_CHG : integer;
  attribute C_EN_RDADDRB_CHG of U0 : label is 0;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_EN_SHUTDOWN_PIN : integer;
  attribute C_EN_SHUTDOWN_PIN of U0 : label is 0;
  attribute C_EN_SLEEP_PIN : integer;
  attribute C_EN_SLEEP_PIN of U0 : label is 0;
  attribute C_EST_POWER_SUMMARY : string;
  attribute C_EST_POWER_SUMMARY of U0 : label is "Estimated Power for IP     :     2.95215 mW";
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_ENA : integer;
  attribute C_HAS_ENA of U0 : label is 0;
  attribute C_HAS_ENB : integer;
  attribute C_HAS_ENB of U0 : label is 0;
  attribute C_HAS_INJECTERR : integer;
  attribute C_HAS_INJECTERR of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_A : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MEM_OUTPUT_REGS_B : integer;
  attribute C_HAS_MEM_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_A : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_MUX_OUTPUT_REGS_B : integer;
  attribute C_HAS_MUX_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_HAS_REGCEA : integer;
  attribute C_HAS_REGCEA of U0 : label is 0;
  attribute C_HAS_REGCEB : integer;
  attribute C_HAS_REGCEB of U0 : label is 0;
  attribute C_HAS_RSTA : integer;
  attribute C_HAS_RSTA of U0 : label is 0;
  attribute C_HAS_RSTB : integer;
  attribute C_HAS_RSTB of U0 : label is 0;
  attribute C_HAS_SOFTECC_INPUT_REGS_A : integer;
  attribute C_HAS_SOFTECC_INPUT_REGS_A of U0 : label is 0;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B : integer;
  attribute C_HAS_SOFTECC_OUTPUT_REGS_B of U0 : label is 0;
  attribute C_INITA_VAL : string;
  attribute C_INITA_VAL of U0 : label is "0";
  attribute C_INITB_VAL : string;
  attribute C_INITB_VAL of U0 : label is "0";
  attribute C_INIT_FILE : string;
  attribute C_INIT_FILE of U0 : label is "gfx_blk_mem_gen_5.mem";
  attribute C_INIT_FILE_NAME : string;
  attribute C_INIT_FILE_NAME of U0 : label is "gfx_blk_mem_gen_5.mif";
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_LOAD_INIT_FILE : integer;
  attribute C_LOAD_INIT_FILE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_MUX_PIPELINE_STAGES : integer;
  attribute C_MUX_PIPELINE_STAGES of U0 : label is 0;
  attribute C_PRIM_TYPE : integer;
  attribute C_PRIM_TYPE of U0 : label is 1;
  attribute C_READ_DEPTH_A : integer;
  attribute C_READ_DEPTH_A of U0 : label is 1024;
  attribute C_READ_DEPTH_B : integer;
  attribute C_READ_DEPTH_B of U0 : label is 1024;
  attribute C_READ_WIDTH_A : integer;
  attribute C_READ_WIDTH_A of U0 : label is 32;
  attribute C_READ_WIDTH_B : integer;
  attribute C_READ_WIDTH_B of U0 : label is 32;
  attribute C_RSTRAM_A : integer;
  attribute C_RSTRAM_A of U0 : label is 0;
  attribute C_RSTRAM_B : integer;
  attribute C_RSTRAM_B of U0 : label is 0;
  attribute C_RST_PRIORITY_A : string;
  attribute C_RST_PRIORITY_A of U0 : label is "CE";
  attribute C_RST_PRIORITY_B : string;
  attribute C_RST_PRIORITY_B of U0 : label is "CE";
  attribute C_SIM_COLLISION_CHECK : string;
  attribute C_SIM_COLLISION_CHECK of U0 : label is "ALL";
  attribute C_USE_BRAM_BLOCK : integer;
  attribute C_USE_BRAM_BLOCK of U0 : label is 0;
  attribute C_USE_BYTE_WEA : integer;
  attribute C_USE_BYTE_WEA of U0 : label is 0;
  attribute C_USE_BYTE_WEB : integer;
  attribute C_USE_BYTE_WEB of U0 : label is 0;
  attribute C_USE_DEFAULT_DATA : integer;
  attribute C_USE_DEFAULT_DATA of U0 : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_SOFTECC : integer;
  attribute C_USE_SOFTECC of U0 : label is 0;
  attribute C_USE_URAM : integer;
  attribute C_USE_URAM of U0 : label is 0;
  attribute C_WEA_WIDTH : integer;
  attribute C_WEA_WIDTH of U0 : label is 1;
  attribute C_WEB_WIDTH : integer;
  attribute C_WEB_WIDTH of U0 : label is 1;
  attribute C_WRITE_DEPTH_A : integer;
  attribute C_WRITE_DEPTH_A of U0 : label is 1024;
  attribute C_WRITE_DEPTH_B : integer;
  attribute C_WRITE_DEPTH_B of U0 : label is 1024;
  attribute C_WRITE_MODE_A : string;
  attribute C_WRITE_MODE_A of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_MODE_B : string;
  attribute C_WRITE_MODE_B of U0 : label is "WRITE_FIRST";
  attribute C_WRITE_WIDTH_A : integer;
  attribute C_WRITE_WIDTH_A of U0 : label is 32;
  attribute C_WRITE_WIDTH_B : integer;
  attribute C_WRITE_WIDTH_B of U0 : label is 32;
  attribute C_XDEVICEFAMILY : string;
  attribute C_XDEVICEFAMILY of U0 : label is "artix7";
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of U0 : label is "true";
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
begin
U0: entity work.gfx_blk_mem_gen_5_blk_mem_gen_v8_3_3
     port map (
      addra(9 downto 0) => addra(9 downto 0),
      addrb(9 downto 0) => B"0000000000",
      clka => clka,
      clkb => '0',
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      deepsleep => '0',
      dina(31 downto 0) => dina(31 downto 0),
      dinb(31 downto 0) => B"00000000000000000000000000000000",
      douta(31 downto 0) => douta(31 downto 0),
      doutb(31 downto 0) => NLW_U0_doutb_UNCONNECTED(31 downto 0),
      eccpipece => '0',
      ena => '0',
      enb => '0',
      injectdbiterr => '0',
      injectsbiterr => '0',
      rdaddrecc(9 downto 0) => NLW_U0_rdaddrecc_UNCONNECTED(9 downto 0),
      regcea => '0',
      regceb => '0',
      rsta => '0',
      rsta_busy => NLW_U0_rsta_busy_UNCONNECTED,
      rstb => '0',
      rstb_busy => NLW_U0_rstb_busy_UNCONNECTED,
      s_aclk => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid => '0',
      s_axi_bid(3 downto 0) => NLW_U0_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_dbiterr => NLW_U0_s_axi_dbiterr_UNCONNECTED,
      s_axi_injectdbiterr => '0',
      s_axi_injectsbiterr => '0',
      s_axi_rdaddrecc(9 downto 0) => NLW_U0_s_axi_rdaddrecc_UNCONNECTED(9 downto 0),
      s_axi_rdata(31 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(31 downto 0),
      s_axi_rid(3 downto 0) => NLW_U0_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_sbiterr => NLW_U0_s_axi_sbiterr_UNCONNECTED,
      s_axi_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(0) => '0',
      s_axi_wvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      shutdown => '0',
      sleep => '0',
      wea(0) => wea(0),
      web(0) => '0'
    );
end STRUCTURE;
