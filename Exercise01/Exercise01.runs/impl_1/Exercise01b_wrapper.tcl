proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7z020clg400-1
  set_property board_part tul.com.tw:pynq-z2:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.cache/wt [current_project]
  set_property parent.project_path /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.xpr [current_project]
  set_property ip_repo_paths /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.cache/ip [current_project]
  set_property ip_output_repo /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.cache/ip [current_project]
  add_files -quiet /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.runs/synth_1/Exercise01b_wrapper.dcp
  read_xdc -ref Exercise01b_processing_system7_0_0 -cells inst /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_processing_system7_0_0/Exercise01b_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_processing_system7_0_0/Exercise01b_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref Exercise01b_axi_gpio_0_0 -cells U0 /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_axi_gpio_0_0/Exercise01b_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_axi_gpio_0_0/Exercise01b_axi_gpio_0_0_board.xdc]
  read_xdc -ref Exercise01b_axi_gpio_0_0 -cells U0 /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_axi_gpio_0_0/Exercise01b_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_axi_gpio_0_0/Exercise01b_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref Exercise01b_rst_processing_system7_0_100M_2 /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_rst_processing_system7_0_100M_2/Exercise01b_rst_processing_system7_0_100M_2_board.xdc
  set_property processing_order EARLY [get_files /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_rst_processing_system7_0_100M_2/Exercise01b_rst_processing_system7_0_100M_2_board.xdc]
  read_xdc -ref Exercise01b_rst_processing_system7_0_100M_2 /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_rst_processing_system7_0_100M_2/Exercise01b_rst_processing_system7_0_100M_2.xdc
  set_property processing_order EARLY [get_files /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/Exercise01/Exercise01.srcs/sources_1/bd/Exercise01b/ip/Exercise01b_rst_processing_system7_0_100M_2/Exercise01b_rst_processing_system7_0_100M_2.xdc]
  link_design -top Exercise01b_wrapper -part xc7z020clg400-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force Exercise01b_wrapper_opt.dcp
  report_drc -file Exercise01b_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file Exercise01b_wrapper.hwdef}
  place_design 
  write_checkpoint -force Exercise01b_wrapper_placed.dcp
  report_io -file Exercise01b_wrapper_io_placed.rpt
  report_utilization -file Exercise01b_wrapper_utilization_placed.rpt -pb Exercise01b_wrapper_utilization_placed.pb
  report_control_sets -verbose -file Exercise01b_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Exercise01b_wrapper_routed.dcp
  report_drc -file Exercise01b_wrapper_drc_routed.rpt -pb Exercise01b_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Exercise01b_wrapper_timing_summary_routed.rpt -rpx Exercise01b_wrapper_timing_summary_routed.rpx
  report_power -file Exercise01b_wrapper_power_routed.rpt -pb Exercise01b_wrapper_power_summary_routed.pb
  report_route_status -file Exercise01b_wrapper_route_status.rpt -pb Exercise01b_wrapper_route_status.pb
  report_clock_utilization -file Exercise01b_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Exercise01b_wrapper.mmi }
  write_bitstream -force Exercise01b_wrapper.bit 
  catch { write_sysdef -hwdef Exercise01b_wrapper.hwdef -bitfile Exercise01b_wrapper.bit -meminfo Exercise01b_wrapper.mmi -file Exercise01b_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

