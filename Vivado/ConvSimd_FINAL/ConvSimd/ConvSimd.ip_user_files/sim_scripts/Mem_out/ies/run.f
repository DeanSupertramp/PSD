-makelib ies_lib/xil_defaultlib -sv \
  "D:/LUCIFER/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/LUCIFER/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../ConvSimd.srcs/sources_1/ip/Mem_out/Mem_out_sim_netlist.vhdl" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

