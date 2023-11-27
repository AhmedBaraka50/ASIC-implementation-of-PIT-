lappend search_path /home/ICer/Baraka/PIT/rtl
lappend search_path /home/ICer/saed32nm_lib/ref/DBs
lappend search_path /home/ICer/Baraka/PIT/syn


set SSTF "saed32hvt_ss0p75v125c.db"
set FFTF "saed32lvt_ff1p16vn40c.db"


set link_library   [list * $SSTF $FFTF]
set target_library [list   $SSTF $FFTF]

#remove_design -all 
set netlist_file "/home/ICer/Baraka/PIT/pnr/netlist.v"
set parasitics_file "/home/ICer/Baraka/PIT/pnr/para.tlup_max_125.spef"
set constraints_file "/home/ICer/Baraka/PIT/pnr/pnr.sdc"

set report_default_significant_digits 3 ;

read_verilog $netlist_file
current_design pit_top
link 

read_parasitics $parasitics_file 

source -echo $constraints_file 
#set_propagated_clock [all_clocks]

set timing_save_pin_arrival_and_slack true 
set power_enable_analysis true 
set power_enable_em_analysis true 
set si_enable_analysis true 

update_timing 
update_power
check_noise 
update_noise 

report_constraints -all_violators
report_analysis_coverage
report_cell_em_violation
report_noise
report_si_bottleneck -cost_type delta_delay
report_si_noise_analysis
report_global_timing
report_clock 
report_timing -delay_type max 
report_timing -delay_type min 

save_session before_ECO_fixing 
####### ECO Fixing 
#fix_eco_power -methods {remove_buffer}
 
fix_eco_drc -type max_transition -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods insert_inverter_pair 
fix_eco_drc -type max_capacitance -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods insert_inverter_pair 
fix_eco_drc -type max_fanout -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods size_cell 
#fix_eco_drc -type noise -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods insert_inverter_pair 
#fix_eco_drc -type delta_delay -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods size_cell 
#fix_eco_drc -type cell_em -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods insert_inverter_pair 

fix_eco_timing -type setup -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods size_cell
fix_eco_timing -type hold  -cell_type combinational -buffer_list {INVX1_LVT INVX2_LVT INVX4_LVT INVX1_HVT INVX2_HVT INVX4_HVT} -methods insert_inverter_pair

write_changes -format icc2tcl -output write_changes.tcl

update_timing 
update_power
check_noise 
update_noise 

report_constraints -all_violators
report_analysis_coverage
report_cell_em_violation
report_noise
report_si_bottleneck -cost_type delta_delay
report_si_noise_analysis
report_global_timing
report_clock 
report_timing -delay_type max 
report_timing -delay_type min 

save_session after_ECO_fixing 

##################
remove_design -all 

set netlist_file "/home/ICer/Baraka/PIT/pnr/netlist.v"
read_verilog $netlist_file

set parasitics_file "/home/ICer/Baraka/PIT/pnr/para.tlup_max_125.spef"
read_parasitics $parasitics_file 

set constraints_file "/home/ICer/Baraka/PIT/pnr/pnr.sdc"
source -echo $constraints_file 

current_design pit_top
link 
