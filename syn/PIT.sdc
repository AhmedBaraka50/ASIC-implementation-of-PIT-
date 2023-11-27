###################################################################

# Created by write_sdc on Tue Nov 21 14:49:42 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_operating_conditions -max ss0p75v125c -max_library saed32hvt_ss0p75v125c\
                         -min ff1p16vn40c -min_library saed32lvt_ff1p16vn40c
set_wire_load_model -name 35000 -library saed32hvt_ss0p75v125c
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
wb_clk_i]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
wb_rst_i]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
arst_i]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_adr_i[2]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_adr_i[1]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_adr_i[0]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[15]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[14]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[13]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[12]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[11]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[10]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[9]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[8]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[7]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[6]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[5]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[4]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[3]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[2]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[1]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_dat_i[0]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
wb_we_i]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
wb_stb_i]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
wb_cyc_i]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_sel_i[1]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
{wb_sel_i[0]}]
set_driving_cell -lib_cell INVX4_LVT -library saed32lvt_ff1p16vn40c [get_ports \
ext_sync_i]
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
set_load -pin_load 0.8 [get_ports wb_ack_o]
set_load -pin_load 0.8 [get_ports pit_o]
set_load -pin_load 0.8 [get_ports pit_irq_o]
set_load -pin_load 0.8 [get_ports cnt_flag_o]
set_load -pin_load 0.8 [get_ports cnt_sync_o]
create_clock [get_ports wb_clk_i]  -name clk_i  -period 5  -waveform {0 2.5}
set_clock_latency 0  [get_clocks clk_i]
set_clock_uncertainty 0  [get_clocks clk_i]
set_clock_transition -max -rise 0 [get_clocks clk_i]
set_clock_transition -max -fall 0 [get_clocks clk_i]
set_clock_transition -min -rise 0 [get_clocks clk_i]
set_clock_transition -min -fall 0 [get_clocks clk_i]
set_input_delay -clock clk_i  1  [get_ports wb_clk_i]
set_input_delay -clock clk_i  1  [get_ports wb_rst_i]
set_input_delay -clock clk_i  1  [get_ports arst_i]
set_input_delay -clock clk_i  1  [get_ports {wb_adr_i[2]}]
set_input_delay -clock clk_i  1  [get_ports {wb_adr_i[1]}]
set_input_delay -clock clk_i  1  [get_ports {wb_adr_i[0]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[15]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[14]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[13]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[12]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[11]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[10]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[9]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[8]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[7]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[6]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[5]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[4]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[3]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[2]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[1]}]
set_input_delay -clock clk_i  1  [get_ports {wb_dat_i[0]}]
set_input_delay -clock clk_i  1  [get_ports wb_we_i]
set_input_delay -clock clk_i  1  [get_ports wb_stb_i]
set_input_delay -clock clk_i  1  [get_ports wb_cyc_i]
set_input_delay -clock clk_i  1  [get_ports {wb_sel_i[1]}]
set_input_delay -clock clk_i  1  [get_ports {wb_sel_i[0]}]
set_input_delay -clock clk_i  1  [get_ports ext_sync_i]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[15]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[14]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[13]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[12]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[11]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[10]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[9]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[8]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[7]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[6]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[5]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[4]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[3]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[2]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[1]}]
set_output_delay -clock clk_i  1  [get_ports {wb_dat_o[0]}]
set_output_delay -clock clk_i  1  [get_ports wb_ack_o]
set_output_delay -clock clk_i  1  [get_ports pit_o]
set_output_delay -clock clk_i  1  [get_ports pit_irq_o]
set_output_delay -clock clk_i  1  [get_ports cnt_flag_o]
set_output_delay -clock clk_i  1  [get_ports cnt_sync_o]
