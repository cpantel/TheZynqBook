############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
open_project exercise04c
set_top nco
add_files ../../../../../../PlanDeEstudios2018/ZYNQ/sources/hls_nco/nco.cpp
add_files -tb ../../../../../../PlanDeEstudios2018/ZYNQ/sources/hls_nco/nco_tb.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 10 -name default
source "./exercise04c/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
