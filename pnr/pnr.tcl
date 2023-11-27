#open_block /home/ICer/Baraka/PIT/pnr/PIT:configration.design
set design PIT

sh rm -rf $design

#set sc_dir "/home/ICer/Desktop/NangateOpenCellLibrary_PDKv1_3_v2010_12"
#lappend search_path /home/ICer/Desktop/NangateOpenCellLibrary_PDKv1_3_v2010_12/lib/Front_End/Liberty/NLDM
lappend search_path /home/ICer/Baraka/PIT/rtl
lappend search_path /home/ICer/Baraka/PIT/syn
lappend search_path /home/ICer/saed32nm_lib/ref/DBs

set link_library   "* saed32hvt_ss0p75v125c.db saed32lvt_ff1p16vn40c.db" 
set target_library "saed32hvt_ss0p75v125c.db saed32lvt_ff1p16vn40c.db"

#set reference_lib "/home/ICer/saed32nm_lib/ref/CLIBs/saed32_hvt.ndm" 
set reference_lib [join " /home/ICer/saed32nm_lib/ref/CLIBs/saed32_hvt.ndm /home/ICer/saed32nm_lib/ref/CLIBs/saed32_lvt.ndm "]

set tech_file "/home/ICer/saed32nm_lib/ref/tech/saed32nm_1p9m.tf"

create_lib PIT -technology $tech_file -ref_libs $reference_lib

		
set tlupmax "/home/ICer/library/tech/tluplus/saed32nm_1p9m_Cmax.tluplus"
set tlupmin "/home/ICer/library/tech/tluplus/saed32nm_1p9m_Cmin.tluplus"
set tech2itf "/home/ICer/saed32nm_lib/ref/tech/saed32nm_tf_itf_tluplus.map"

read_parasitic_tech -tlup "$tlupmax $tlupmin"  -layermap $tech2itf
 
read_verilog PIT.v 

source /home/ICer/Baraka/PIT/syn/cons.tcl

save_block -as configration 
save_lib
###### floor plan 
set_ignored_layers -min_routing_layer M1 -max_routing_layer M7

set_attribute [get_layers M1] routing_direction horizontal
set_attribute [get_layers M2] routing_direction vertical
set_attribute [get_layers M3] routing_direction horizontal
set_attribute [get_layers M4] routing_direction vertical
set_attribute [get_layers M5] routing_direction horizontal
set_attribute [get_layers M6] routing_direction vertical
set_attribute [get_layers M7] routing_direction horizontal
set_attribute [get_layers M8] routing_direction vertical
set_attribute [get_layers M9] routing_direction horizontal
set_attribute [get_layers MRDL] routing_direction vertical 
initialize_floorplan -core_utilization 0.4 -core_offset {5.016  6.08} 

place_pins -port [get_ports *]

save_block -as floorplan 
###### power plan 
create_net -power  VDD 
create_net -ground VSS

set power  "VDD"
set ground  "VSS" 

set_attribute -objects [get_nets VDD] -name net_type -value power 
set_attribute -objects [get_nets VSS] -name net_type -value ground

connect_pg_net -net VDD [get_pins -physical_context */VDD]
connect_pg_net -net VSS [get_pins -physical_context */VSS]

remove_pg_via_master_rules -all 
remove_pg_patterns -all 
remove_pg_strategies -all 
remove_pg_strategy_via -all 


create_pg_std_cell_conn_pattern std_pattern_1 -layers {M1} -rail_width {0.3 0.3} 

set_pg_strategy M1_rail_power -core -pattern {{name: std_pattern_1} {nets: VDD}} 
set_pg_strategy M1_rail_grong -core -pattern {{name: std_pattern_1} {nets: VSS}} 


compile_pg -strategies M1_rail_power -ignore_drc
compile_pg -strategies M1_rail_grong -ignore_drc

save_block -as powerplan 

#vertical mesh
create_pg_mesh_pattern Top_Mesh_Vertical -layers  {{vertical_layer: M8} {width: 0.1} {spacing: interleaving} {pitch: 4} {offset: 0.5} {trim : true} } 

set_pg_strategy VDD_VSS_Top_Mesh_Vertical \
		-core \
		-pattern  { {name: Top_Mesh_Vertical} {nets:{VDD VSS}} } \
		-extension { {{stop: design | boundary_and_generate_pin}} }

compile_pg -strategies {VDD_VSS_Top_Mesh_Vertical} -show_phantom

#horizontal mesh
create_pg_mesh_pattern Top_Mesh_horizontal -layers  {{vertical_layer: M9} {width: 0.1} {spacing: interleaving} {pitch: 4} {offset: 0.5} {trim : true} } 

set_pg_strategy VDD_VSS_Top_Mesh_horizontal \
		-core \
		-pattern  { {name: Top_Mesh_horizontal} {nets:{VDD VSS}} } \
		-extension { {{stop: design | boundary_and_generate_pin}} }

compile_pg -strategies {VDD_VSS_Top_Mesh_horizontal} -show_phantom


save_block -as power_mesh

#ring creation
create_pg_ring_pattern \
		ring_pattern \
		-horizontal_layer M9  -vertical_layer M8 \
		-horizontal_width 1   -vertical_width 1 \
		-horizontal_spacing 3 -vertical_spacing 3
		
set_pg_strategy RING -core -pattern {{ name: ring_pattern} { nets: "VDD VSS" }}
compile_pg -strategies RING
#set_app_options -list {plan.pgroute.honor signal route drc true}

check_pg_connectivity -nets "VDD VSS"
check_pg_drc
check_pg_missing_vias

save_block -as power_ring
###### placement
set_app_options -name time.disable_recovery_removal_checks -value false
set_app_options -name time.disable_case_analysis -value false
set_app_options -name place.coarse.continue_on_missing_scandef -value true

#Place Optimization

source /home/ICer/Baraka/PIT/pnr/mmmc.tcl

merge_clock_gates

set_app_options -name place.coarse.fix_hard_macros -value true
set_app_options -name plan.place.auto_generate_blockages -value false
set_app_options -name place.coarse.cong_restruct -value on
#create placement -timing driven -buffering_aware_timing_driven -effort high
##set_app_options -name place opt.flow.optimize_icgs -value true
set_app_options -name place_opt.initial_drc.global_route_based -value 1
set_app_options -name place_opt.flow.do_path_opt -value true
#set_app_options -name place_opt.flow.enable_multibit_banking -value true
set_app_options -name place.legalize.optimize_orientations -value true
set_app_options -name place.legalize.optimize_pin_access_using_cell_spacing -value true
set_app_options -name opt.buffering.enable_mv_rebuffering -value true
set_app_options -name opt.buffering.enable_rebuffering -value true
place_opt

#set_app_options -name limit legality checks -value true
#legalize | placement
check_legality

save_block -as placement
###### CTS 
check_legality -verbose 
check_clock_trees

set_app_options -name cts.compile.enable_cell_relocation -value all
set_app_options -name cts.compile.size_pre_existing_cell_to_cts_references -value true

set_clock_tree_options -clocks [all_clocks] -target_skew 0.2
#set_clock_latency 0.8 [get_clocks clk_i]

set_lib_cell_purpose -include cts {saed32hvt_ss0p75v125c/INV* saed32hvt_ss0p75v125c/TNBUFF*}

#set_clock_uncertainty 0.1 [all_clocks]

create_routing_rule CLK_SPACING -spacings {M5 0.2 M6 0.2 M7 0.2}
set_clock_routing_rules -rules CLK_SPACING -min_routing_layer M5 -max_routing_layer M7

report_clock_settings

source /home/ICer/Baraka/PIT/pnr/mmmc.tcl

compute_clock_latency
save_block -as cts_setup
 
clock_opt -from build_clock -to build_clock
compute_clock_latency
save_block -as cts_mid

clock_opt -from route_clock -to route_clock

compute_clock_latency
clock_opt -from final_opto -to final_opto

report_clock_qor
report_qor 

save_block -as cts_final
###### routing
check_routability 

route_group -all_clock_nets -max_detail_route_iterations 10

set_app_option -name route.global.timing_driven -value true
set_app_option -name route.global.timing_driven_effort_level -value high

route_global -effort_level medium 
save_block -as route_stage_1 

set_app_option -name route.track.timing_driven -value true
route_track 

set_app_option -name route.detail.timing_driven -value true 
set_app_option -name route.common.rc_driven_setup_effort_level -value high 
save_block -as route_stage_2

route_detail -max_number_iterations 1 
save_block -as DR_iter_0

route_detail -max_number_iterations 1 
save_block -as DR_iter_1

route_detail -max_number_iterations 1 
save_block -as DR_iter_2

route_detail -max_number_iterations 1 
save_block -as DR_iter_3

route_detail -max_number_iterations 1 
save_block -as DR_iter_4

route_detail -max_number_iterations 1 
save_block -as DR_iter_5

route_detail -max_number_iterations 1 
save_block -as DR_iter_6

route_detail -max_number_iterations 1 
save_block -as DR_iter_7

route_detail -max_number_iterations 1 
save_block -as DR_iter_8

route_detail -max_number_iterations 1 
save_block -as DR_iter_9

remove_redundant_shapes -report_changed_nets true 
optimize_routability -route 
optimize_routes -max_detail_route_iterations 5 

save_block -as route_end
###### dumb & check
write_verilog netlist.v
write_sdc -output pnr.sdc

check_routes 
check_lvs -max_errors 0

report_congestion 
report_timing -delay_type max -corners slow
report_timing -delay_type min -corners fast
report_constraints -all_violators
###### write_parasitics 
write_parasitics -format spef -output para 
###### ECO
#open_block /home/ICer/Baraka/PIT/pnr/PIT:route_end.design
source "/home/ICer/Baraka/PIT/Prime_Time/write_changes.tcl"
place_eco_cells -legalize_mode allow_move_other_cells -eco_changed_cells -legalize_only

route_eco 
####################
uniquify -force
write_verilog netlist.v
write_sdc -output pnr.sdc
write_parasitics -format spef -output para 
