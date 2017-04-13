-makelib ies/xil_defaultlib -sv \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \
-endlib
-makelib ies/xpm \
  "D:/xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_1 \
  "../../../ipstatic/fifo_generator_v13_1_1/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies/fifo_generator_v13_1_1 \
  "../../../ipstatic/fifo_generator_v13_1_1/hdl/fifo_generator_v13_1_rfs.vhd" \
-endlib
-makelib ies/fifo_generator_v13_1_1 \
  "../../../ipstatic/fifo_generator_v13_1_1/hdl/fifo_generator_v13_1_rfs.v" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../Graphics_IP_1.0/src/fifo_generator_0/sim/fifo_generator_0.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

