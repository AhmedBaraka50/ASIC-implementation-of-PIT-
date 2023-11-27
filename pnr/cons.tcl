################################################################################
#
# Design name:  route_end
#
# Created by icc2 write_sdc on Tue Nov 21 15:59:50 2023
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: func
# Corner: slow
# Scenario: func_slow

# /home/ICer/Baraka/PIT/syn/cons.tcl, line 89; \
#   /home/ICer/Baraka/PIT/syn/cons.tcl, line 90; \
#   /home/ICer/Baraka/PIT/syn/cons.tcl, line 90
create_clock -name clk_i -period 5 -waveform {0 2.5} [get_ports {wb_clk_i}]
set_propagated_clock [get_clocks {clk_i}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[15]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[14]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[13]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[12]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[11]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[10]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[9]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[8]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[7]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[6]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[5]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[4]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[3]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[2]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[1]}]
set_load -pin_load 0.8 [get_ports {wb_dat_o[0]}]
set_load -pin_load 0.8 [get_ports {wb_ack_o}]
set_load -pin_load 0.8 [get_ports {pit_o}]
set_load -pin_load 0.8 [get_ports {pit_irq_o}]
set_load -pin_load 0.8 [get_ports {cnt_flag_o}]
set_load -pin_load 0.8 [get_ports {cnt_sync_o}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 10
set_operating_conditions -analysis_type on_chip_variation -max ss0p75v125c -min \
    ff1p16vn40c -max_library saed32hvt_ss0p75v125c -min_library \
    saed32lvt_ff1p16vn40c
# Set latency for io paths.
# -origin user
set_clock_latency -min 0.0764648 [get_clocks {clk_i}]
# -origin user
set_clock_latency -max 0.339318 [get_clocks {clk_i}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {wb_clk_i}]
set_clock_uncertainty 0 [get_clocks {clk_i}]
set_clock_transition 0 [get_clocks {clk_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 13
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_clk_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 15
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_rst_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 17
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {arst_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 19
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_adr_i[2]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 21
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_adr_i[1]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 23
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_adr_i[0]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 25
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[15]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 27
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[14]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 29
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[13]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 31
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[12]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 33
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[11]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 35
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[10]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 37
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[9]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 39
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[8]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 41
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[7]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 43
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[6]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 45
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[5]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 47
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[4]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 49
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[3]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 51
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[2]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 53
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[1]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 55
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_dat_i[0]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 57
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_we_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 59
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_stb_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 61
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_cyc_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 63
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_sel_i[1]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 65
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {wb_sel_i[0]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 67
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
    {ext_sync_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 124
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[15]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 125
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[14]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 126
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[13]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 127
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[12]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 128
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[11]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 129
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[10]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 130
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[9]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 131
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[8]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 132
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[7]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 133
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[6]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 134
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[5]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 135
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[4]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 136
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[3]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 137
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[2]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 138
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[1]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 139
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_o[0]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 140
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_ack_o}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 96
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_clk_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 97
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_rst_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 98
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {arst_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 99
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_adr_i[2]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 100
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_adr_i[1]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 101
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_adr_i[0]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 102
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[15]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 103
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[14]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 104
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[13]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 105
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[12]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 106
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[11]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 107
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[10]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 108
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[9]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 109
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[8]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 110
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[7]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 111
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[6]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 112
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[5]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 113
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[4]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 114
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[3]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 115
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[2]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 116
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[1]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 117
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_dat_i[0]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 118
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_we_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 119
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_stb_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 120
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_cyc_i}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 121
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_sel_i[1]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 122
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {wb_sel_i[0]}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 141
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {pit_o}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 142
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {pit_irq_o}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 143
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {cnt_flag_o}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 144
set_output_delay -clock [get_clocks {clk_i}] 1 [get_ports {cnt_sync_o}]
# /home/ICer/Baraka/PIT/syn/cons.tcl, line 123
set_input_delay -clock [get_clocks {clk_i}] 1 [get_ports {ext_sync_i}]
