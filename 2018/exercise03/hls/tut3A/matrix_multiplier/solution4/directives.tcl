############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_array_reshape -type complete -dim 2 "matrix_mult" a
set_directive_array_reshape -type complete -dim 1 "matrix_mult" b
set_directive_pipeline "matrix_mult"
