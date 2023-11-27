define_design_lib WORK -path "work"

#lappend search_path /home/ICer/Desktop/NangateOpenCellLibrary_PDKv1_3_v2010_12/lib/Front_End/Liberty/NLDM
lappend search_path /home/ICer/Baraka/PIT/rtl
lappend search_path /home/ICer/saed32nm_lib/ref/DBs

#################   setting libraries   ################# 
#set SSTF "NangateOpenCellLibrary_ss0p95v125c.db"
#set FFTF "NangateOpenCellLibrary_ff1p25vn40c.db" 
set SSTF "saed32hvt_ss0p75v125c.db"
set FFTF "saed32lvt_ff1p16vn40c.db"


set link_library   [list * $SSTF $FFTF]
set target_library [list   $SSTF $FFTF]

analyze -format verilog {pit_count.v pit_prescale.v pit_regs.v pit_top.v pit_wb_bus.v}

elaborate pit_top

set current_design pit_top


### constraints 

create_clock -name "clk_i" -period 5 [get_ports wb_clk_i]

set_clock_latency     0     [get_clocks clk_i]
set_clock_uncertainty 0     [get_clocks clk_i]
set_clock_transition  0     [get_clocks clk_i]

set_input_delay  [expr 0.2 * 5] [all_inputs ] -clock  "clk_i"
set_output_delay [expr 0.2 * 5] [all_outputs] -clock  "clk_i"

#wire load model
set_wire_load_model -name 35000

#operating cond
set_operating_conditions -min "ff1p16vn40c" -min_library "saed32lvt_ff1p16vn40c" -max "ss0p75v125c" -max_library "saed32hvt_ss0p75v125c"
							  
#input transition
#////////////////////////////////////////////////////////////////////////////////////////////////////////////
#set_driving_cell  -lib_cell "AND2X1_HVT" -library "saed32hvt_ss0p75v125c" [all_inputs]
set_driving_cell  -lib_cell "INVX4_LVT" -library "saed32lvt_ff1p16vn40c" [all_inputs]


#output load
set_load 0.8 [all_outputs]

#set_max_fanout
#set_ideal_network [get_ports wb_clk_i]


##link 
link 

## uniquification
uniquify -force -dont_skip_empty_designs

#optimizations

#set_optimize_registers true
#set_flatten true -effort high

## compile
compile_ultra -retime -gate_clock

#optimize_netlist -area
#optimize_registers

## reports
report_timing -delay_type max
report_timing -delay_type min
report_area 
report_power
report_qor

#write design files 
#write_file -format verilog -hierarchy  -output PIT.v
write -hierarchy -format verilog -output PIT.v
write_sdc PIT.sdc
