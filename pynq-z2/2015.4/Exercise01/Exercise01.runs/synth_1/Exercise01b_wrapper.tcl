# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg400-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.cache/wt [current_project]
set_property parent.project_path /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
add_files /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/Exercise01b.bd
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_processing_system7_0_0/Exercise01b_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_axi_gpio_0_0/Exercise01b_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_axi_gpio_0_0/Exercise01b_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_axi_gpio_0_0/Exercise01b_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_rst_processing_system7_0_100M_2/Exercise01b_rst_processing_system7_0_100M_2_board.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_rst_processing_system7_0_100M_2/Exercise01b_rst_processing_system7_0_100M_2.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_rst_processing_system7_0_100M_2/Exercise01b_rst_processing_system7_0_100M_2_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_auto_pc_0/Exercise01b_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/Exercise01b_ooc.xdc]
set_property is_locked true [get_files /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/Exercise01b.bd]

read_verilog -library xil_defaultlib /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/hdl/Exercise01b_wrapper.v
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top Exercise01b_wrapper -part xc7z020clg400-1
write_checkpoint -noxdef Exercise01b_wrapper.dcp
catch { report_utilization -file Exercise01b_wrapper_utilization_synth.rpt -pb Exercise01b_wrapper_utilization_synth.pb }
