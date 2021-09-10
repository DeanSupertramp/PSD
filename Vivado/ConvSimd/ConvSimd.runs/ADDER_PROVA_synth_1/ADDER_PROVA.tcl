# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/Matteo/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-9156-DESKTOP-NDG2QTT/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.cache/wt [current_project]
set_property parent.project_path C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA.xci

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.runs/ADDER_PROVA_synth_1 -new_name ADDER_PROVA -ip [get_ips ADDER_PROVA]]

if { $cached_ip eq {} } {

synth_design -top ADDER_PROVA -part xc7a100tcsg324-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix ADDER_PROVA_ ADDER_PROVA.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ADDER_PROVA_stub.v
 lappend ipCachedFiles ADDER_PROVA_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ADDER_PROVA_stub.vhdl
 lappend ipCachedFiles ADDER_PROVA_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ADDER_PROVA_sim_netlist.v
 lappend ipCachedFiles ADDER_PROVA_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ADDER_PROVA_sim_netlist.vhdl
 lappend ipCachedFiles ADDER_PROVA_sim_netlist.vhdl

 config_ip_cache -add -dcp ADDER_PROVA.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips ADDER_PROVA]
}

rename_ref -prefix_all ADDER_PROVA_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef ADDER_PROVA.dcp
create_report "ADDER_PROVA_synth_1_synth_report_utilization_0" "report_utilization -file ADDER_PROVA_utilization_synth.rpt -pb ADDER_PROVA_utilization_synth.pb"

if { [catch {
  file copy -force C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.runs/ADDER_PROVA_synth_1/ADDER_PROVA.dcp c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.runs/ADDER_PROVA_synth_1/ADDER_PROVA.dcp c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.runs/ADDER_PROVA_synth_1/ADDER_PROVA_stub.v c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.runs/ADDER_PROVA_synth_1/ADDER_PROVA_stub.vhdl c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.runs/ADDER_PROVA_synth_1/ADDER_PROVA_sim_netlist.v c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.runs/ADDER_PROVA_synth_1/ADDER_PROVA_sim_netlist.vhdl c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.ip_user_files/ip/ADDER_PROVA]} {
  catch { 
    file copy -force c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_stub.v C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.ip_user_files/ip/ADDER_PROVA
  }
}

if {[file isdir C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.ip_user_files/ip/ADDER_PROVA]} {
  catch { 
    file copy -force c:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.srcs/sources_1/ip/ADDER_PROVA/ADDER_PROVA_stub.vhdl C:/Users/Matteo/Desktop/Sistemi_Digitali/ConvSimd/ConvSimd.ip_user_files/ip/ADDER_PROVA
  }
}
