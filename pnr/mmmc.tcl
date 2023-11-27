set map_file "/home/ICer/saed32nm_lib/ref/tech/saed32nm_tf_itf_tluplus.map"
set tlu_max_file "/home/ICer/library/tech/tluplus/saed32nm_1p9m_Cmax.tluplus"
set tlu_min_file "/home/ICer/library/tech/tluplus/saed32nm_1p9m_Cmin.tluplus"
set constraints_file "/home/ICer/Baraka/PIT/syn/cons.tcl" 

remove_corners -all
remove_modes -all 
remove_scenarios -all

create_corner slow 
create_corner fast 

read_parasitic_tech -tlup $tlu_max_file -layermap $map_file -name tlup_max 
read_parasitic_tech -tlup $tlu_min_file -layermap $map_file -name tlup_min

set_parasitics_parameters -early_spec tlup_min -late_spec tlup_min -corners {fast}  
set_parasitics_parameters -early_spec tlup_max -late_spec tlup_max -corners {slow}

create_mode func 
current_mode func 

create_scenario -mode func -corner fast -name func_fast 
create_scenario -mode func -corner slow -name func_slow

set_process_label saed32lvt_ff1p16vn40c -corner fast 
current_scenario func_fast 
source $constraints_file 

set_process_label saed32hvt_ss0p75v125c -corner slow 
current_scenario func_slow 
source $constraints_file 
