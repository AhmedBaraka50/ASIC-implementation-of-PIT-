// IC Compiler II Verilog Writer
// Generated on 11/21/2023 at 15:59:50
// Library Name: PIT
// Block Name: route_end
// User Label: 
// Write Command: write_verilog netlist.v
module SNPS_CLOCK_GATE_HIGH_pit_count_COUNT_SIZE16_0_0 ( CLK , EN , ENCLK , 
    TE ) ;
input  CLK ;
input  EN ;
output ENCLK ;
input  TE ;

CGLPPRX8_LVT latch ( .CLK ( CLK ) , .EN ( EN ) , .SE ( TE ) , 
    .GCLK ( ENCLK ) ) ;
endmodule


module SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_0_0 ( CLK , EN , ENCLK , TE ) ;
input  CLK ;
input  EN ;
output ENCLK ;
input  TE ;

CGLPPRX8_LVT latch ( .CLK ( CLK ) , .EN ( EN ) , .SE ( TE ) , 
    .GCLK ( ENCLK ) ) ;
endmodule


module SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_2_0 ( CLK , EN , ENCLK , TE ) ;
input  CLK ;
input  EN ;
output ENCLK ;
input  TE ;

CGLPPRX2_LVT latch ( .CLK ( cts0 ) , .EN ( EN ) , .SE ( TE ) , 
    .GCLK ( ENCLK ) ) ;
NBUFFX8_LVT cto_buf_629 ( .A ( CLK ) , .Y ( cts0 ) ) ;
endmodule


module SNPS_CLOCK_GATE_HIGH_pit_wb_bus_0_16_0_0_0 ( CLK , EN , ENCLK , TE ) ;
input  CLK ;
input  EN ;
output ENCLK ;
input  TE ;

CGLPPRX2_LVT latch ( .CLK ( cts0 ) , .EN ( EN ) , .SE ( TE ) , 
    .GCLK ( ENCLK ) ) ;
NBUFFX32_LVT cto_buf_628 ( .A ( CLK ) , .Y ( cts0 ) ) ;
endmodule


module pit_top ( wb_dat_o , wb_ack_o , wb_clk_i , wb_rst_i , arst_i , 
    wb_adr_i , wb_dat_i , wb_we_i , wb_stb_i , wb_cyc_i , wb_sel_i , pit_o , 
    pit_irq_o , cnt_flag_o , cnt_sync_o , ext_sync_i ) ;
output [15:0] wb_dat_o ;
output wb_ack_o ;
input  wb_clk_i ;
input  wb_rst_i ;
input  arst_i ;
input  [2:0] wb_adr_i ;
input  [15:0] wb_dat_i ;
input  wb_we_i ;
input  wb_stb_i ;
input  wb_cyc_i ;
input  [1:0] wb_sel_i ;
output pit_o ;
output pit_irq_o ;
output cnt_flag_o ;
output cnt_sync_o ;
input  ext_sync_i ;

wire [15:0] cnt_n ;
wire [15:0] mod_value ;
wire [3:0] pit_pre_scl ;
wire [2:0] \wishbone/address ;
wire [14:0] \prescale/cnt_n ;

SNPS_CLOCK_GATE_HIGH_pit_wb_bus_0_16_0_0_0 \wishbone/clk_gate_addr_latch_reg ( 
    .CLK ( ctsbuf_net_32 ) , .EN ( \wishbone/module_sel ) , 
    .ENCLK ( \wishbone/net2006 ) , .TE ( 1'b0 ) ) ;
SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_2_0 \regs/clk_gate_pit_slave_reg ( 
    .CLK ( ctsbuf_net_32 ) , .EN ( copt_net_16 ) , .ENCLK ( \regs/net1989 ) , 
    .TE ( 1'b0 ) ) ;
SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_0_0 \regs/clk_gate_mod_value_reg ( 
    .CLK ( ctsbuf_net_32 ) , .EN ( \regs/N80 ) , .ENCLK ( \regs/net1978 ) , 
    .TE ( 1'b0 ) ) ;
SNPS_CLOCK_GATE_HIGH_pit_count_COUNT_SIZE16_0_0 \counter/clk_gate_cnt_n_reg ( 
    .CLK ( ctsbuf_net_32 ) , .EN ( \counter/N25 ) , 
    .ENCLK ( \counter/net1960 ) , .TE ( 1'b0 ) ) ;
DFFX1_HVT \wishbone/addr_latch_reg[0] ( .D ( wb_adr_i[0] ) , 
    .CLK ( \wishbone/net2006 ) , .Q ( \wishbone/address [0] ) ) ;
DFFX1_HVT \wishbone/addr_latch_reg[1] ( .D ( wb_adr_i[1] ) , 
    .CLK ( \wishbone/net2006 ) , .Q ( \wishbone/address [1] ) ) ;
DFFX1_HVT \wishbone/addr_latch_reg[2] ( .D ( wb_adr_i[2] ) , 
    .CLK ( \wishbone/net2006 ) , .Q ( \wishbone/address [2] ) ) ;
DFFARX1_HVT \wishbone/bus_wait_state_reg ( .D ( \wishbone/N26 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_403 ) , 
    .Q ( \wishbone/bus_wait_state ) , .QN ( n319 ) ) ;
DFFARX1_HVT \regs/pit_flg_clr_reg ( .D ( n122 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_405 ) , .Q ( pit_flg_clr ) , .QN ( n320 ) ) ;
DFFARX1_HVT \regs/pit_ien_reg ( .D ( n342 ) , .CLK ( \regs/net1989 ) , 
    .RSTB ( copt_net_74 ) , .Q ( pit_ien ) ) ;
DFFARX1_HVT \regs/mod_value_reg[0] ( .D ( \regs/N72 ) , 
    .CLK ( \regs/net1978 ) , .RSTB ( copt_net_405 ) , .Q ( mod_value[0] ) , 
    .QN ( n318 ) ) ;
DFFARX1_LVT \regs/mod_value_reg[2] ( .D ( n341 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[2] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[3] ( .D ( \regs/N75 ) , 
    .CLK ( \regs/net1978 ) , .RSTB ( copt_net_429 ) , .Q ( mod_value[3] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[4] ( .D ( \regs/N76 ) , 
    .CLK ( \regs/net1978 ) , .RSTB ( copt_net_429 ) , .Q ( mod_value[4] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[5] ( .D ( \regs/N77 ) , 
    .CLK ( \regs/net1978 ) , .RSTB ( copt_net_429 ) , .Q ( mod_value[5] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[6] ( .D ( \regs/N78 ) , 
    .CLK ( \regs/net1978 ) , .RSTB ( copt_net_429 ) , .Q ( mod_value[6] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[7] ( .D ( \regs/N79 ) , 
    .CLK ( \regs/net1978 ) , .RSTB ( copt_net_429 ) , .Q ( mod_value[7] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[8] ( .D ( n350 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[8] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[9] ( .D ( n349 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[9] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[10] ( .D ( n348 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[10] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[11] ( .D ( n347 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[11] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[12] ( .D ( n346 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[12] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[13] ( .D ( n345 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[13] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[14] ( .D ( n344 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_461 ) , .Q ( mod_value[14] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[15] ( .D ( n343 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_461 ) , .Q ( mod_value[15] ) ) ;
DFFARX1_HVT \prescale/cnt_n_reg[2] ( .D ( n338 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_402 ) , .Q ( \prescale/cnt_n [2] ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[3] ( .D ( copt_net_149 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_530 ) , 
    .Q ( \prescale/cnt_n [3] ) , .QN ( n317 ) ) ;
DFFARX1_HVT \prescale/cnt_n_reg[5] ( .D ( n337 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_67 ) , .Q ( \prescale/cnt_n [5] ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[6] ( .D ( copt_net_146 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_429 ) , 
    .Q ( \prescale/cnt_n [6] ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[7] ( .D ( copt_net_144 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_429 ) , 
    .Q ( \prescale/cnt_n [7] ) , .QN ( n316 ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[9] ( .D ( n334 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_530 ) , .Q ( \prescale/cnt_n [9] ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[10] ( .D ( copt_net_165 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_530 ) , 
    .Q ( \prescale/cnt_n [10] ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[11] ( .D ( n332 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_530 ) , .Q ( \prescale/cnt_n [11] ) , .QN ( n315 ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[12] ( .D ( copt_net_167 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_530 ) , 
    .Q ( \prescale/cnt_n [12] ) ) ;
DFFARX1_HVT \prescale/cnt_n_reg[13] ( .D ( n330 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_65 ) , .Q ( \prescale/cnt_n [13] ) , .QN ( n313 ) ) ;
DFFARX1_HVT \prescale/cnt_n_reg[14] ( .D ( n329 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_66 ) , .Q ( \prescale/cnt_n [14] ) , .QN ( n314 ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[11] ( .D ( \counter/N37 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_400 ) , .Q ( cnt_n[11] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[10] ( .D ( copt_net_143 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_400 ) , .Q ( cnt_n[10] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[8] ( .D ( copt_net_458 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[8] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[2] ( .D ( \counter/N28 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[2] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[1] ( .D ( \counter/N27 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[1] ) ) ;
DFFASX1_LVT \counter/cnt_n_reg[0] ( .D ( \counter/N26 ) , 
    .CLK ( \counter/net1960 ) , .SETB ( copt_net_530 ) , .Q ( cnt_n[0] ) , 
    .QN ( n325 ) ) ;
DFFARX1_LVT \counter/cnt_flag_o_reg ( .D ( copt_net_139 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_flag_o ) , 
    .QN ( n326 ) ) ;
DFFARX1_HVT \regs/cnt_sync_o_reg ( .D ( \regs/N72 ) , .CLK ( \regs/net1989 ) , 
    .RSTB ( copt_net_405 ) , .Q ( cnt_sync_o ) , .QN ( n324 ) ) ;
DFFARX1_LVT \regs/pit_pre_reg[3] ( .D ( n347 ) , .CLK ( \regs/net1989 ) , 
    .RSTB ( copt_net_429 ) , .Q ( pit_pre_scl[3] ) , .QN ( n321 ) ) ;
DFFASX1_HVT \regs/pit_irq_o_reg ( .D ( n143 ) , .CLK ( ctsbuf_net_10 ) , 
    .SETB ( copt_net_530 ) , .QN ( pit_irq_o ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[9] ( .D ( \counter/N35 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[9] ) ) ;
DFFARX1_HVT \counter/pit_o_reg ( .D ( \counter/N50 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_404 ) , .Q ( pit_o ) ) ;
DFFARX1_HVT \counter/cnt_n_reg[15] ( .D ( \counter/N41 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[15] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[14] ( .D ( \counter/N40 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[14] ) ) ;
DFFARX1_HVT \counter/cnt_n_reg[13] ( .D ( \counter/N39 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_400 ) , .Q ( cnt_n[13] ) ) ;
DFFARX1_HVT \counter/cnt_n_reg[12] ( .D ( \counter/N38 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_400 ) , .Q ( cnt_n[12] ) ) ;
DFFARX1_LVT \regs/pit_pre_reg[0] ( .D ( n350 ) , .CLK ( \regs/net1989 ) , 
    .RSTB ( copt_net_461 ) , .Q ( pit_pre_scl[0] ) , .QN ( n322 ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[3] ( .D ( \counter/N29 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[3] ) ) ;
DFFARX1_LVT \regs/mod_value_reg[1] ( .D ( n342 ) , .CLK ( \regs/net1978 ) , 
    .RSTB ( copt_net_429 ) , .Q ( mod_value[1] ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[1] ( .D ( n339 ) , .CLK ( ctsbuf_net_10 ) , 
    .RSTB ( copt_net_530 ) , .Q ( \prescale/cnt_n [1] ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[8] ( .D ( copt_net_156 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_530 ) , 
    .Q ( \prescale/cnt_n [8] ) ) ;
DFFARX1_LVT \regs/pit_slave_reg ( .D ( n343 ) , .CLK ( \regs/net1989 ) , 
    .RSTB ( copt_net_461 ) , .Q ( pit_slave ) ) ;
DFFARX1_LVT \regs/pit_pre_reg[1] ( .D ( n349 ) , .CLK ( \regs/net1989 ) , 
    .RSTB ( copt_net_461 ) , .Q ( pit_pre_scl[1] ) , .QN ( n312 ) ) ;
DFFARX1_LVT \prescale/cnt_n_reg[4] ( .D ( copt_net_153 ) , 
    .CLK ( ctsbuf_net_10 ) , .RSTB ( copt_net_429 ) , 
    .Q ( \prescale/cnt_n [4] ) ) ;
DFFASX1_LVT \prescale/cnt_n_reg[0] ( .D ( n328 ) , .CLK ( ctsbuf_net_10 ) , 
    .SETB ( copt_net_530 ) , .Q ( \prescale/cnt_n [0] ) , .QN ( n311 ) ) ;
DFFARX1_LVT \regs/pit_pre_reg[2] ( .D ( n348 ) , .CLK ( \regs/net1989 ) , 
    .RSTB ( copt_net_461 ) , .Q ( pit_pre_scl[2] ) , .QN ( n323 ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[4] ( .D ( copt_net_78 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[4] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[6] ( .D ( \counter/N32 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[6] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[7] ( .D ( \counter/N33 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[7] ) ) ;
DFFARX1_LVT \counter/cnt_n_reg[5] ( .D ( copt_net_460 ) , 
    .CLK ( \counter/net1960 ) , .RSTB ( copt_net_530 ) , .Q ( cnt_n[5] ) ) ;
AND2X1_HVT U171 ( .A1 ( copt_net_385 ) , .A2 ( copt_net_33 ) , 
    .Y ( \counter/N33 ) ) ;
NAND2X0_LVT U172 ( .A1 ( copt_net_536 ) , .A2 ( mod_value[14] ) , 
    .Y ( n302 ) ) ;
AND2X1_LVT U173 ( .A1 ( copt_net_516 ) , .A2 ( copt_net_11 ) , .Y ( n206 ) ) ;
NAND2X1_HVT U174 ( .A1 ( pit_pre_scl[1] ) , .A2 ( ZBUF_3 ) , .Y ( n171 ) ) ;
INVX0_HVT U175 ( .A ( n257 ) , .Y ( n285 ) ) ;
INVX0_LVT HFSINV_5_8 ( .A ( n305 ) , .Y ( HFSNET_8 ) ) ;
INVX16_HVT U177 ( .A ( ZBUF_7 ) , .Y ( n231 ) ) ;
INVX1_HVT copt_d_inst_1183 ( .A ( copt_net_528 ) , .Y ( copt_net_527 ) ) ;
NAND3X1_HVT U179 ( .A1 ( pit_pre_scl[0] ) , .A2 ( n312 ) , .A3 ( n321 ) , 
    .Y ( n149 ) ) ;
OR2X1_LVT U180 ( .A1 ( pit_pre_scl[0] ) , .A2 ( n323 ) , .Y ( n166 ) ) ;
AND2X1_LVT U181 ( .A1 ( copt_net_487 ) , .A2 ( copt_net_37 ) , 
    .Y ( \counter/N32 ) ) ;
AND2X1_LVT U182 ( .A1 ( copt_net_511 ) , .A2 ( copt_net_41 ) , 
    .Y ( \counter/N31 ) ) ;
AND2X1_LVT U183 ( .A1 ( copt_net_521 ) , .A2 ( copt_net_46 ) , 
    .Y ( \counter/N30 ) ) ;
NAND3X0_LVT U184 ( .A1 ( pit_pre_scl[0] ) , .A2 ( ZBUF_1 ) , .A3 ( ZBUF_2 ) , 
    .Y ( n147 ) ) ;
AND2X1_LVT U185 ( .A1 ( copt_net_11 ) , .A2 ( copt_net_204 ) , .Y ( n198 ) ) ;
NAND2X0_LVT U186 ( .A1 ( copt_net_203 ) , .A2 ( n313 ) , .Y ( n176 ) ) ;
NAND2X0_HVT U187 ( .A1 ( n166 ) , .A2 ( n312 ) , .Y ( n152 ) ) ;
OA22X1_LVT U188 ( .A1 ( n312 ) , .A2 ( n185 ) , .A3 ( n323 ) , .A4 ( n149 ) , 
    .Y ( n150 ) ) ;
NAND2X1_HVT U189 ( .A1 ( copt_net_285 ) , .A2 ( copt_net_387 ) , .Y ( n308 ) ) ;
NAND2X0_HVT U190 ( .A1 ( ext_sync_i ) , .A2 ( copt_net_284 ) , .Y ( n145 ) ) ;
NAND2X1_HVT U191 ( .A1 ( copt_net_255 ) , .A2 ( n316 ) , .Y ( n153 ) ) ;
NAND3X0_LVT U192 ( .A1 ( copt_net_539 ) , .A2 ( copt_net_213 ) , 
    .A3 ( n297 ) , .Y ( n192 ) ) ;
AND2X1_LVT U193 ( .A1 ( copt_net_533 ) , .A2 ( copt_net_213 ) , .Y ( n225 ) ) ;
XOR2X1_LVT U194 ( .A1 ( copt_net_213 ) , .A2 ( n169 ) , .Y ( n175 ) ) ;
NOR3X0_LVT U195 ( .A1 ( copt_net_475 ) , .A2 ( copt_net_502 ) , 
    .A3 ( mod_value[14] ) , .Y ( n236 ) ) ;
HADDX1_LVT U196 ( .A0 ( copt_net_514 ) , .B0 ( cnt_n[3] ) , .C1 ( n278 ) , 
    .SO ( n281 ) ) ;
AO21X1_LVT U197 ( .A1 ( copt_net_494 ) , .A2 ( copt_net_450 ) , 
    .A3 ( wb_rst_i ) , .Y ( \regs/N80 ) ) ;
AND2X1_LVT U198 ( .A1 ( wb_ack_o ) , .A2 ( wb_we_i ) , .Y ( n310 ) ) ;
HADDX1_LVT U199 ( .A0 ( n260 ) , .B0 ( copt_net_311 ) , .C1 ( n287 ) , 
    .SO ( n261 ) ) ;
HADDX1_LVT U200 ( .A0 ( n262 ) , .B0 ( copt_net_425 ) , .C1 ( n260 ) , 
    .SO ( n263 ) ) ;
XOR2X1_LVT U201 ( .A1 ( n288 ) , .A2 ( copt_net_529 ) , .Y ( n289 ) ) ;
HADDX1_LVT U202 ( .A0 ( n287 ) , .B0 ( copt_net_518 ) , .C1 ( n288 ) , 
    .SO ( n259 ) ) ;
AND3X1_LVT U203 ( .A1 ( copt_net_524 ) , .A2 ( copt_net_505 ) , 
    .A3 ( HFSNET_5 ) , .Y ( \counter/N50 ) ) ;
AND3X1_HVT U204 ( .A1 ( \wishbone/module_sel ) , .A2 ( HFSNET_5 ) , 
    .A3 ( n319 ) , .Y ( \wishbone/N26 ) ) ;
NAND3X1_HVT U205 ( .A1 ( copt_net_534 ) , .A2 ( copt_net_101 ) , 
    .A3 ( HFSNET_5 ) , .Y ( n143 ) ) ;
AND2X1_HVT U206 ( .A1 ( wb_dat_i[3] ) , .A2 ( HFSNET_5 ) , .Y ( \regs/N75 ) ) ;
AND2X1_HVT U207 ( .A1 ( wb_dat_i[4] ) , .A2 ( HFSNET_5 ) , .Y ( \regs/N76 ) ) ;
AND2X1_HVT U208 ( .A1 ( wb_dat_i[6] ) , .A2 ( HFSNET_5 ) , .Y ( \regs/N78 ) ) ;
AND2X1_HVT U209 ( .A1 ( wb_dat_i[7] ) , .A2 ( HFSNET_5 ) , .Y ( \regs/N79 ) ) ;
AND2X1_HVT U210 ( .A1 ( wb_dat_i[12] ) , .A2 ( HFSNET_5 ) , .Y ( n346 ) ) ;
AND2X1_HVT U211 ( .A1 ( wb_dat_i[13] ) , .A2 ( HFSNET_5 ) , .Y ( n345 ) ) ;
AND2X1_HVT U212 ( .A1 ( wb_dat_i[14] ) , .A2 ( HFSNET_5 ) , .Y ( n344 ) ) ;
AND2X1_HVT U213 ( .A1 ( wb_dat_i[1] ) , .A2 ( HFSNET_5 ) , .Y ( n342 ) ) ;
AND2X1_HVT U214 ( .A1 ( wb_dat_i[15] ) , .A2 ( HFSNET_5 ) , .Y ( n343 ) ) ;
AND2X1_HVT U215 ( .A1 ( wb_dat_i[0] ) , .A2 ( HFSNET_5 ) , .Y ( \regs/N72 ) ) ;
AND2X1_HVT U216 ( .A1 ( wb_dat_i[8] ) , .A2 ( HFSNET_5 ) , .Y ( n350 ) ) ;
AND2X1_HVT U217 ( .A1 ( wb_dat_i[9] ) , .A2 ( HFSNET_5 ) , .Y ( n349 ) ) ;
AND2X1_HVT U218 ( .A1 ( wb_dat_i[10] ) , .A2 ( HFSNET_5 ) , .Y ( n348 ) ) ;
AND2X1_HVT U219 ( .A1 ( wb_dat_i[11] ) , .A2 ( HFSNET_5 ) , .Y ( n347 ) ) ;
AND2X1_HVT U220 ( .A1 ( wb_dat_i[2] ) , .A2 ( HFSNET_5 ) , .Y ( n341 ) ) ;
OR2X1_HVT U221 ( .A1 ( copt_net_203 ) , .A2 ( n322 ) , .Y ( n158 ) ) ;
AND3X4_LVT U222 ( .A1 ( n285 ) , .A2 ( copt_net_504 ) , .A3 ( copt_net_453 ) , 
    .Y ( n290 ) ) ;
AND2X1_HVT U223 ( .A1 ( copt_net_210 ) , .A2 ( copt_net_196 ) , .Y ( n213 ) ) ;
AND2X1_LVT U224 ( .A1 ( copt_net_261 ) , .A2 ( n225 ) , .Y ( n227 ) ) ;
OR2X1_HVT U225 ( .A1 ( copt_net_284 ) , .A2 ( copt_net_512 ) , .Y ( n146 ) ) ;
DELLN1X2_HVT copt_h_inst_668 ( .A ( arst_i ) , .Y ( copt_net_26 ) ) ;
AND2X1_HVT U227 ( .A1 ( \wishbone/module_sel ) , .A2 ( copt_net_133 ) , 
    .Y ( aps_rename_1_ ) ) ;
NAND2X0_LVT U228 ( .A1 ( copt_net_537 ) , .A2 ( copt_net_518 ) , .Y ( n301 ) ) ;
AND2X1_LVT U229 ( .A1 ( wb_stb_i ) , .A2 ( wb_cyc_i ) , 
    .Y ( \wishbone/module_sel ) ) ;
NBUFFX2_LVT copt_d_inst_1194 ( .A ( \prescale/cnt_n [5] ) , 
    .Y ( copt_net_538 ) ) ;
NAND2X0_HVT U231 ( .A1 ( copt_net_96 ) , .A2 ( n285 ) , .Y ( n286 ) ) ;
AND2X1_HVT U232 ( .A1 ( copt_net_185 ) , .A2 ( copt_net_54 ) , 
    .Y ( \counter/N27 ) ) ;
AND2X1_HVT U233 ( .A1 ( copt_net_179 ) , .A2 ( n283 ) , .Y ( \counter/N28 ) ) ;
AND2X1_HVT U234 ( .A1 ( copt_net_179 ) , .A2 ( copt_net_239 ) , 
    .Y ( \counter/N29 ) ) ;
AND2X1_LVT U235 ( .A1 ( n290 ) , .A2 ( copt_net_141 ) , .Y ( \counter/N38 ) ) ;
AND2X1_LVT U236 ( .A1 ( n290 ) , .A2 ( copt_net_162 ) , .Y ( \counter/N39 ) ) ;
AND2X1_LVT U237 ( .A1 ( copt_net_334 ) , .A2 ( copt_net_117 ) , 
    .Y ( \counter/N40 ) ) ;
AND2X1_LVT U238 ( .A1 ( n290 ) , .A2 ( n289 ) , .Y ( \counter/N41 ) ) ;
NAND2X0_HVT U239 ( .A1 ( copt_net_287 ) , .A2 ( copt_net_276 ) , .Y ( n228 ) ) ;
INVX1_HVT HFSINV_249_39 ( .A ( n166 ) , .Y ( HFSNET_39 ) ) ;
INVX0_HVT U241 ( .A ( n178 ) , .Y ( n179 ) ) ;
NBUFFX2_LVT copt_d_inst_1189 ( .A ( \prescale/cnt_n [2] ) , 
    .Y ( copt_net_533 ) ) ;
XOR2X1_LVT U243 ( .A1 ( copt_net_447 ) , .A2 ( copt_net_170 ) , .Y ( n336 ) ) ;
AND2X1_HVT U244 ( .A1 ( wb_dat_i[5] ) , .A2 ( HFSNET_5 ) , .Y ( \regs/N77 ) ) ;
NOR2X0_HVT U245 ( .A1 ( copt_net_15 ) , .A2 ( copt_net_18 ) , .Y ( n300 ) ) ;
NOR2X2_LVT U246 ( .A1 ( copt_net_104 ) , .A2 ( copt_net_526 ) , .Y ( n305 ) ) ;
AO21X1_LVT U247 ( .A1 ( copt_net_494 ) , .A2 ( copt_net_433 ) , 
    .A3 ( wb_rst_i ) , .Y ( \regs/N62 ) ) ;
NAND2X2_LVT U248 ( .A1 ( n146 ) , .A2 ( n145 ) , .Y ( n297 ) ) ;
NAND2X1_HVT U249 ( .A1 ( n321 ) , .A2 ( n147 ) , .Y ( n148 ) ) ;
XOR2X1_LVT U250 ( .A1 ( copt_net_317 ) , .A2 ( n148 ) , .Y ( n162 ) ) ;
OR3X1_LVT U251 ( .A1 ( pit_pre_scl[2] ) , .A2 ( pit_pre_scl[0] ) , 
    .A3 ( pit_pre_scl[3] ) , .Y ( n185 ) ) ;
XOR2X1_LVT U252 ( .A1 ( copt_net_533 ) , .A2 ( n150 ) , .Y ( n157 ) ) ;
OR3X1_LVT U253 ( .A1 ( pit_pre_scl[2] ) , .A2 ( pit_pre_scl[3] ) , 
    .A3 ( n322 ) , .Y ( n168 ) ) ;
NAND3X1_HVT U254 ( .A1 ( ZBUF_2 ) , .A2 ( n316 ) , .A3 ( n168 ) , 
    .Y ( n151 ) ) ;
AO21X1_LVT U255 ( .A1 ( ZBUF_4 ) , .A2 ( n151 ) , .A3 ( copt_net_224 ) , 
    .Y ( n156 ) ) ;
NAND3X1_HVT U256 ( .A1 ( copt_net_229 ) , .A2 ( copt_net_223 ) , 
    .A3 ( copt_net_226 ) , .Y ( n154 ) ) ;
AOI22X1_LVT U257 ( .A1 ( \prescale/cnt_n [14] ) , .A2 ( n154 ) , 
    .A3 ( \prescale/cnt_n [13] ) , .A4 ( n153 ) , .Y ( n155 ) ) ;
NAND3X0_LVT U258 ( .A1 ( n175 ) , .A2 ( n157 ) , .A3 ( n155 ) , .Y ( n161 ) ) ;
NAND3X0_LVT U259 ( .A1 ( copt_net_229 ) , .A2 ( n158 ) , .A3 ( n314 ) , 
    .Y ( n159 ) ) ;
OA21X1_LVT U260 ( .A1 ( copt_net_218 ) , .A2 ( copt_net_255 ) , .A3 ( n159 ) , 
    .Y ( n160 ) ) ;
NOR4X1_LVT U261 ( .A1 ( copt_net_210 ) , .A2 ( n162 ) , .A3 ( n161 ) , 
    .A4 ( n160 ) , .Y ( n184 ) ) ;
XOR2X1_LVT U262 ( .A1 ( pit_pre_scl[0] ) , .A2 ( pit_pre_scl[1] ) , 
    .Y ( n163 ) ) ;
NAND2X0_LVT U263 ( .A1 ( ZBUF_3 ) , .A2 ( n163 ) , .Y ( n178 ) ) ;
AND2X1_LVT U264 ( .A1 ( n321 ) , .A2 ( n178 ) , .Y ( n164 ) ) ;
XOR2X1_LVT U265 ( .A1 ( copt_net_538 ) , .A2 ( n164 ) , .Y ( n183 ) ) ;
NAND2X1_HVT U266 ( .A1 ( ZBUF_2 ) , .A2 ( copt_net_224 ) , .Y ( n165 ) ) ;
OA22X1_LVT U267 ( .A1 ( pit_pre_scl[3] ) , .A2 ( n315 ) , .A3 ( n168 ) , 
    .A4 ( n165 ) , .Y ( n177 ) ) ;
NAND2X1_HVT U268 ( .A1 ( HFSNET_39 ) , .A2 ( n321 ) , .Y ( n167 ) ) ;
AO21X1_LVT U269 ( .A1 ( n168 ) , .A2 ( n167 ) , .A3 ( ZBUF_2 ) , .Y ( n169 ) ) ;
AOI22X1_LVT U270 ( .A1 ( copt_net_229 ) , .A2 ( n171 ) , .A3 ( HFSNET_39 ) , 
    .A4 ( copt_net_224 ) , .Y ( n173 ) ) ;
OA21X1_LVT U271 ( .A1 ( copt_net_255 ) , .A2 ( n171 ) , .A3 ( n321 ) , 
    .Y ( n172 ) ) ;
AO21X1_LVT U272 ( .A1 ( n173 ) , .A2 ( n172 ) , .A3 ( copt_net_22 ) , 
    .Y ( n174 ) ) ;
AND4X1_LVT U273 ( .A1 ( net_PTECO_HOLD_NET2_0 ) , .A2 ( n183 ) , 
    .A3 ( n181 ) , .A4 ( n156 ) , .Y ( n182 ) ) ;
NAND2X1_HVT U274 ( .A1 ( n321 ) , .A2 ( n179 ) , .Y ( n180 ) ) ;
XOR2X1_LVT U275 ( .A1 ( n180 ) , .A2 ( copt_net_295 ) , .Y ( n181 ) ) ;
AND4X1_LVT U276 ( .A1 ( n184 ) , .A2 ( n176 ) , .A3 ( n182 ) , .A4 ( n174 ) , 
    .Y ( n187 ) ) ;
OR2X1_LVT U277 ( .A1 ( pit_pre_scl[1] ) , .A2 ( n185 ) , .Y ( n230 ) ) ;
XOR2X1_LVT U278 ( .A1 ( copt_net_254 ) , .A2 ( ZBUF_6 ) , .Y ( n186 ) ) ;
NAND2X4_LVT U279 ( .A1 ( n187 ) , .A2 ( n186 ) , .Y ( n232 ) ) ;
AND2X1_LVT U280 ( .A1 ( copt_net_23 ) , .A2 ( copt_net_539 ) , .Y ( n193 ) ) ;
AND2X1_LVT U281 ( .A1 ( copt_net_189 ) , .A2 ( n193 ) , .Y ( n197 ) ) ;
AND2X1_LVT U282 ( .A1 ( n232 ) , .A2 ( copt_net_254 ) , .Y ( n202 ) ) ;
AND2X1_LVT U283 ( .A1 ( n202 ) , .A2 ( n227 ) , .Y ( n190 ) ) ;
AND2X1_LVT U284 ( .A1 ( n198 ) , .A2 ( copt_net_189 ) , .Y ( n189 ) ) ;
AND2X1_LVT U285 ( .A1 ( copt_net_8 ) , .A2 ( n189 ) , .Y ( n188 ) ) ;
XOR2X1_LVT U286 ( .A1 ( n197 ) , .A2 ( n188 ) , .Y ( n337 ) ) ;
AND2X1_LVT U287 ( .A1 ( copt_net_189 ) , .A2 ( copt_net_8 ) , .Y ( n194 ) ) ;
XOR2X1_LVT U288 ( .A1 ( n189 ) , .A2 ( n194 ) , .Y ( \prescale/N56 ) ) ;
AND2X1_LVT U289 ( .A1 ( copt_net_257 ) , .A2 ( copt_net_539 ) , .Y ( n220 ) ) ;
AND2X1_LVT U290 ( .A1 ( copt_net_352 ) , .A2 ( copt_net_123 ) , .Y ( n205 ) ) ;
AND2X1_LVT U291 ( .A1 ( n190 ) , .A2 ( copt_net_297 ) , .Y ( n199 ) ) ;
AND4X1_LVT U292 ( .A1 ( n199 ) , .A2 ( copt_net_23 ) , .A3 ( copt_net_203 ) , 
    .A4 ( copt_net_217 ) , .Y ( n222 ) ) ;
AND2X1_LVT U293 ( .A1 ( copt_net_353 ) , .A2 ( copt_net_540 ) , .Y ( n209 ) ) ;
XOR2X1_LVT U294 ( .A1 ( n205 ) , .A2 ( copt_net_176 ) , .Y ( \prescale/N60 ) ) ;
AND4X1_LVT U295 ( .A1 ( n206 ) , .A2 ( copt_net_431 ) , .A3 ( copt_net_257 ) , 
    .A4 ( copt_net_222 ) , .Y ( n212 ) ) ;
AND2X1_LVT U296 ( .A1 ( n297 ) , .A2 ( n212 ) , .Y ( n216 ) ) ;
AND2X1_LVT U297 ( .A1 ( copt_net_243 ) , .A2 ( copt_net_134 ) , .Y ( n191 ) ) ;
XOR2X1_LVT U298 ( .A1 ( copt_net_312 ) , .A2 ( n191 ) , .Y ( n331 ) ) ;
NAND2X1_HVT U299 ( .A1 ( copt_net_57 ) , .A2 ( copt_net_269 ) , .Y ( n328 ) ) ;
XOR2X1_LVT U300 ( .A1 ( n328 ) , .A2 ( copt_net_342 ) , .Y ( n339 ) ) ;
NAND3X0_LVT U301 ( .A1 ( copt_net_348 ) , .A2 ( copt_net_345 ) , 
    .A3 ( copt_net_98 ) , .Y ( n196 ) ) ;
NAND3X0_LVT U302 ( .A1 ( copt_net_539 ) , .A2 ( copt_net_296 ) , 
    .A3 ( copt_net_314 ) , .Y ( n195 ) ) ;
NAND3X0_LVT U303 ( .A1 ( copt_net_186 ) , .A2 ( copt_net_97 ) , 
    .A3 ( copt_net_331 ) , .Y ( n201 ) ) ;
NAND3X0_LVT U304 ( .A1 ( copt_net_539 ) , .A2 ( copt_net_217 ) , 
    .A3 ( copt_net_189 ) , .Y ( n200 ) ) ;
XOR2X1_LVT U305 ( .A1 ( n201 ) , .A2 ( copt_net_169 ) , .Y ( n335 ) ) ;
AND2X1_LVT U306 ( .A1 ( copt_net_194 ) , .A2 ( copt_net_539 ) , .Y ( n306 ) ) ;
NAND3X0_LVT U307 ( .A1 ( copt_net_56 ) , .A2 ( n306 ) , .A3 ( copt_net_338 ) , 
    .Y ( n204 ) ) ;
NAND3X0_LVT U308 ( .A1 ( copt_net_539 ) , .A2 ( copt_net_291 ) , 
    .A3 ( copt_net_193 ) , .Y ( n203 ) ) ;
XOR2X1_LVT U309 ( .A1 ( n204 ) , .A2 ( copt_net_236 ) , .Y ( n338 ) ) ;
AND2X4_LVT U310 ( .A1 ( n232 ) , .A2 ( copt_net_305 ) , .Y ( n210 ) ) ;
NAND3X0_LVT U311 ( .A1 ( copt_net_136 ) , .A2 ( copt_net_275 ) , 
    .A3 ( n205 ) , .Y ( n208 ) ) ;
NAND2X1_HVT U312 ( .A1 ( n206 ) , .A2 ( copt_net_355 ) , .Y ( n207 ) ) ;
XOR2X1_LVT U313 ( .A1 ( n208 ) , .A2 ( n207 ) , .Y ( n333 ) ) ;
NAND2X4_HVT U314 ( .A1 ( n209 ) , .A2 ( n220 ) , .Y ( n211 ) ) ;
NAND2X1_HVT U315 ( .A1 ( copt_net_114 ) , .A2 ( copt_net_355 ) , .Y ( n219 ) ) ;
XOR2X1_LVT U316 ( .A1 ( n211 ) , .A2 ( copt_net_527 ) , .Y ( n334 ) ) ;
NAND3X0_LVT U317 ( .A1 ( n222 ) , .A2 ( n213 ) , .A3 ( n212 ) , .Y ( n215 ) ) ;
NAND3X0_LVT U318 ( .A1 ( copt_net_539 ) , .A2 ( \prescale/cnt_n [13] ) , 
    .A3 ( n297 ) , .Y ( n214 ) ) ;
XOR2X2_LVT U319 ( .A1 ( n215 ) , .A2 ( n214 ) , .Y ( n330 ) ) ;
NAND4X0_LVT U320 ( .A1 ( n222 ) , .A2 ( copt_net_210 ) , .A3 ( n216 ) , 
    .A4 ( \prescale/cnt_n [13] ) , .Y ( n218 ) ) ;
NAND3X0_LVT U321 ( .A1 ( copt_net_539 ) , .A2 ( copt_net_22 ) , .A3 ( n297 ) , 
    .Y ( n217 ) ) ;
XOR2X2_LVT U322 ( .A1 ( n218 ) , .A2 ( n217 ) , .Y ( n329 ) ) ;
NAND4X0_LVT U323 ( .A1 ( copt_net_135 ) , .A2 ( copt_net_528 ) , 
    .A3 ( copt_net_347 ) , .A4 ( copt_net_516 ) , .Y ( n224 ) ) ;
NAND3X0_LVT U324 ( .A1 ( copt_net_539 ) , .A2 ( copt_net_222 ) , 
    .A3 ( copt_net_354 ) , .Y ( n223 ) ) ;
XOR2X1_LVT U325 ( .A1 ( n224 ) , .A2 ( copt_net_344 ) , .Y ( n332 ) ) ;
NBUFFX4_HVT copt_d_inst_1190 ( .A ( pit_ien ) , .Y ( copt_net_534 ) ) ;
INVX0_HVT U327 ( .A ( n225 ) , .Y ( n226 ) ) ;
AOI22X1_LVT U328 ( .A1 ( n227 ) , .A2 ( copt_net_254 ) , 
    .A3 ( copt_net_288 ) , .A4 ( n226 ) , .Y ( n229 ) ) ;
AND3X1_LVT U329 ( .A1 ( copt_net_115 ) , .A2 ( ZBUF_5 ) , .A3 ( n306 ) , 
    .Y ( \prescale/N55 ) ) ;
AND2X1_LVT U330 ( .A1 ( copt_net_11 ) , .A2 ( copt_net_500 ) , .Y ( n257 ) ) ;
NOR4X1_LVT U331 ( .A1 ( mod_value[10] ) , .A2 ( mod_value[11] ) , 
    .A3 ( mod_value[12] ) , .A4 ( mod_value[13] ) , .Y ( n235 ) ) ;
NOR4X1_LVT U332 ( .A1 ( mod_value[1] ) , .A2 ( mod_value[6] ) , 
    .A3 ( mod_value[7] ) , .A4 ( copt_net_510 ) , .Y ( n234 ) ) ;
NOR4X1_LVT U333 ( .A1 ( mod_value[3] ) , .A2 ( mod_value[2] ) , 
    .A3 ( mod_value[4] ) , .A4 ( mod_value[5] ) , .Y ( n233 ) ) ;
NAND4X0_LVT U334 ( .A1 ( n236 ) , .A2 ( n235 ) , .A3 ( n234 ) , .A4 ( n233 ) , 
    .Y ( n307 ) ) ;
XOR2X1_LVT U335 ( .A1 ( copt_net_199 ) , .A2 ( mod_value[14] ) , .Y ( n244 ) ) ;
XOR2X1_LVT U336 ( .A1 ( copt_net_520 ) , .A2 ( mod_value[1] ) , .Y ( n243 ) ) ;
XOR2X1_LVT U337 ( .A1 ( copt_net_474 ) , .A2 ( copt_net_529 ) , .Y ( n242 ) ) ;
XOR2X1_LVT U338 ( .A1 ( cnt_n[3] ) , .A2 ( mod_value[3] ) , .Y ( n240 ) ) ;
XOR2X1_LVT U339 ( .A1 ( cnt_n[2] ) , .A2 ( mod_value[2] ) , .Y ( n239 ) ) ;
XOR2X1_LVT U340 ( .A1 ( cnt_n[5] ) , .A2 ( mod_value[5] ) , .Y ( n238 ) ) ;
XOR2X1_LVT U341 ( .A1 ( cnt_n[4] ) , .A2 ( mod_value[4] ) , .Y ( n237 ) ) ;
OR4X1_LVT U342 ( .A1 ( n237 ) , .A2 ( n240 ) , .A3 ( n238 ) , .A4 ( n239 ) , 
    .Y ( n241 ) ) ;
NOR4X1_LVT U343 ( .A1 ( n247 ) , .A2 ( n248 ) , .A3 ( n244 ) , .A4 ( n241 ) , 
    .Y ( n256 ) ) ;
XOR2X1_LVT U344 ( .A1 ( copt_net_393 ) , .A2 ( mod_value[7] ) , .Y ( n248 ) ) ;
XOR2X1_LVT U345 ( .A1 ( copt_net_397 ) , .A2 ( mod_value[6] ) , .Y ( n247 ) ) ;
XOR2X1_LVT U346 ( .A1 ( copt_net_330 ) , .A2 ( copt_net_501 ) , .Y ( n246 ) ) ;
XOR2X1_LVT U347 ( .A1 ( copt_net_381 ) , .A2 ( copt_net_509 ) , .Y ( n245 ) ) ;
NOR4X1_LVT U348 ( .A1 ( n242 ) , .A2 ( copt_net_473 ) , .A3 ( n245 ) , 
    .A4 ( n246 ) , .Y ( n255 ) ) ;
XOR2X1_LVT U349 ( .A1 ( copt_net_327 ) , .A2 ( mod_value[11] ) , .Y ( n252 ) ) ;
XOR2X1_LVT U350 ( .A1 ( copt_net_282 ) , .A2 ( mod_value[10] ) , .Y ( n251 ) ) ;
XOR2X1_LVT U351 ( .A1 ( copt_net_232 ) , .A2 ( mod_value[13] ) , .Y ( n250 ) ) ;
XOR2X1_LVT U352 ( .A1 ( copt_net_362 ) , .A2 ( mod_value[12] ) , .Y ( n249 ) ) ;
NOR4X1_LVT U353 ( .A1 ( n249 ) , .A2 ( n251 ) , .A3 ( n252 ) , .A4 ( n250 ) , 
    .Y ( n254 ) ) ;
XOR2X1_LVT U354 ( .A1 ( copt_net_25 ) , .A2 ( copt_net_325 ) , .Y ( n253 ) ) ;
NAND4X0_LVT U355 ( .A1 ( n256 ) , .A2 ( n255 ) , .A3 ( n254 ) , .A4 ( n253 ) , 
    .Y ( n258 ) ) ;
AO21X2_LVT U356 ( .A1 ( copt_net_265 ) , .A2 ( n258 ) , .A3 ( n257 ) , 
    .Y ( n295 ) ) ;
HADDX1_LVT U357 ( .A0 ( n264 ) , .B0 ( copt_net_327 ) , .C1 ( n262 ) , 
    .SO ( n265 ) ) ;
AND2X1_LVT U358 ( .A1 ( copt_net_386 ) , .A2 ( copt_net_121 ) , 
    .Y ( \counter/N37 ) ) ;
HADDX1_LVT U359 ( .A0 ( n266 ) , .B0 ( copt_net_283 ) , .C1 ( n264 ) , 
    .SO ( n267 ) ) ;
AND2X1_LVT U360 ( .A1 ( copt_net_182 ) , .A2 ( copt_net_80 ) , 
    .Y ( \counter/N36 ) ) ;
HADDX1_LVT U361 ( .A0 ( n268 ) , .B0 ( copt_net_330 ) , .C1 ( n266 ) , 
    .SO ( n269 ) ) ;
AND2X1_LVT U362 ( .A1 ( copt_net_181 ) , .A2 ( copt_net_84 ) , 
    .Y ( \counter/N35 ) ) ;
HADDX1_LVT U363 ( .A0 ( n270 ) , .B0 ( copt_net_381 ) , .C1 ( n268 ) , 
    .SO ( n271 ) ) ;
AND2X1_LVT U364 ( .A1 ( copt_net_488 ) , .A2 ( copt_net_88 ) , 
    .Y ( \counter/N34 ) ) ;
HADDX1_LVT U365 ( .A0 ( n272 ) , .B0 ( copt_net_394 ) , .C1 ( n270 ) , 
    .SO ( n273 ) ) ;
HADDX1_LVT U366 ( .A0 ( n274 ) , .B0 ( copt_net_397 ) , .C1 ( n272 ) , 
    .SO ( n275 ) ) ;
HADDX1_LVT U367 ( .A0 ( n276 ) , .B0 ( cnt_n[5] ) , .C1 ( n274 ) , 
    .SO ( n277 ) ) ;
HADDX1_LVT U368 ( .A0 ( n278 ) , .B0 ( cnt_n[4] ) , .C1 ( n276 ) , 
    .SO ( n279 ) ) ;
HADDX1_HVT U369 ( .A0 ( n282 ) , .B0 ( cnt_n[2] ) , .C1 ( n280 ) , 
    .SO ( n283 ) ) ;
HADDX1_LVT U370 ( .A0 ( cnt_n[0] ) , .B0 ( cnt_n[1] ) , .C1 ( n282 ) , 
    .SO ( n284 ) ) ;
NAND4X0_LVT U371 ( .A1 ( copt_net_270 ) , .A2 ( n286 ) , 
    .A3 ( copt_net_265 ) , .A4 ( copt_net_389 ) , .Y ( \counter/N26 ) ) ;
NOR2X0_HVT U372 ( .A1 ( copt_net_477 ) , .A2 ( copt_net_522 ) , .Y ( n299 ) ) ;
AND2X4_LVT U373 ( .A1 ( copt_net_536 ) , .A2 ( copt_net_495 ) , .Y ( n309 ) ) ;
AND2X1_LVT U374 ( .A1 ( copt_net_450 ) , .A2 ( copt_net_60 ) , .Y ( n292 ) ) ;
NBUFFX2_LVT copt_d_inst_660 ( .A ( \wishbone/address [2] ) , 
    .Y ( copt_net_18 ) ) ;
AO22X1_LVT U376 ( .A1 ( copt_net_434 ) , .A2 ( n341 ) , .A3 ( n292 ) , 
    .A4 ( copt_net_17 ) , .Y ( n293 ) ) ;
AND2X1_LVT U377 ( .A1 ( copt_net_493 ) , .A2 ( n293 ) , .Y ( n122 ) ) ;
NAND2X1_HVT U378 ( .A1 ( copt_net_107 ) , .A2 ( copt_net_453 ) , .Y ( n294 ) ) ;
AND3X1_LVT U379 ( .A1 ( n294 ) , .A2 ( copt_net_337 ) , .A3 ( copt_net_233 ) , 
    .Y ( n125 ) ) ;
AND2X4_LVT U380 ( .A1 ( copt_net_537 ) , .A2 ( copt_net_522 ) , .Y ( n304 ) ) ;
AO222X1_LVT U381 ( .A1 ( mod_value[0] ) , .A2 ( n309 ) , .A3 ( cnt_sync_o ) , 
    .A4 ( copt_net_434 ) , .A5 ( n304 ) , .A6 ( copt_net_25 ) , 
    .Y ( wb_dat_o[0] ) ) ;
AO222X1_LVT U382 ( .A1 ( mod_value[1] ) , .A2 ( n309 ) , .A3 ( n304 ) , 
    .A4 ( copt_net_520 ) , .A5 ( copt_net_434 ) , .A6 ( copt_net_534 ) , 
    .Y ( wb_dat_o[1] ) ) ;
AO222X1_LVT U383 ( .A1 ( mod_value[2] ) , .A2 ( n309 ) , .A3 ( n304 ) , 
    .A4 ( cnt_n[2] ) , .A5 ( copt_net_434 ) , .A6 ( copt_net_101 ) , 
    .Y ( wb_dat_o[2] ) ) ;
AO22X1_LVT U384 ( .A1 ( mod_value[3] ) , .A2 ( n309 ) , .A3 ( cnt_n[3] ) , 
    .A4 ( n304 ) , .Y ( wb_dat_o[3] ) ) ;
AO22X1_LVT U385 ( .A1 ( mod_value[4] ) , .A2 ( n309 ) , .A3 ( cnt_n[4] ) , 
    .A4 ( n304 ) , .Y ( wb_dat_o[4] ) ) ;
AO22X1_LVT U386 ( .A1 ( mod_value[5] ) , .A2 ( n309 ) , .A3 ( cnt_n[5] ) , 
    .A4 ( n304 ) , .Y ( wb_dat_o[5] ) ) ;
AO22X1_LVT U387 ( .A1 ( mod_value[6] ) , .A2 ( n309 ) , .A3 ( copt_net_397 ) , 
    .A4 ( n304 ) , .Y ( wb_dat_o[6] ) ) ;
AO22X1_LVT U388 ( .A1 ( mod_value[7] ) , .A2 ( n309 ) , .A3 ( copt_net_394 ) , 
    .A4 ( n304 ) , .Y ( wb_dat_o[7] ) ) ;
AO222X1_LVT U389 ( .A1 ( pit_pre_scl[0] ) , .A2 ( copt_net_434 ) , 
    .A3 ( copt_net_381 ) , .A4 ( n304 ) , .A5 ( copt_net_510 ) , 
    .A6 ( n309 ) , .Y ( wb_dat_o[8] ) ) ;
AO222X1_LVT U390 ( .A1 ( pit_pre_scl[1] ) , .A2 ( copt_net_434 ) , 
    .A3 ( copt_net_330 ) , .A4 ( n304 ) , .A5 ( copt_net_501 ) , 
    .A6 ( n309 ) , .Y ( wb_dat_o[9] ) ) ;
AO222X1_LVT U391 ( .A1 ( ZBUF_0 ) , .A2 ( copt_net_434 ) , 
    .A3 ( copt_net_282 ) , .A4 ( n304 ) , .A5 ( mod_value[10] ) , 
    .A6 ( n309 ) , .Y ( wb_dat_o[10] ) ) ;
AO222X1_LVT U392 ( .A1 ( pit_pre_scl[3] ) , .A2 ( copt_net_434 ) , 
    .A3 ( copt_net_327 ) , .A4 ( n304 ) , .A5 ( mod_value[11] ) , 
    .A6 ( n309 ) , .Y ( wb_dat_o[11] ) ) ;
AO22X1_LVT U393 ( .A1 ( mod_value[12] ) , .A2 ( n309 ) , 
    .A3 ( copt_net_362 ) , .A4 ( n304 ) , .Y ( wb_dat_o[12] ) ) ;
AO22X1_LVT U394 ( .A1 ( mod_value[13] ) , .A2 ( n309 ) , 
    .A3 ( copt_net_232 ) , .A4 ( n304 ) , .Y ( wb_dat_o[13] ) ) ;
NAND3X0_LVT U395 ( .A1 ( HFSNET_8 ) , .A2 ( n302 ) , .A3 ( n301 ) , 
    .Y ( wb_dat_o[14] ) ) ;
AO222X1_LVT U396 ( .A1 ( copt_net_285 ) , .A2 ( copt_net_434 ) , 
    .A3 ( copt_net_529 ) , .A4 ( n304 ) , .A5 ( copt_net_474 ) , 
    .A6 ( n309 ) , .Y ( wb_dat_o[15] ) ) ;
NAND3X0_LVT U397 ( .A1 ( copt_net_500 ) , .A2 ( copt_net_265 ) , 
    .A3 ( n306 ) , .Y ( \counter/N25 ) ) ;
IBUFFX4_LVT cts_inv_366408 ( .A ( ctsbuf_net_21 ) , .Y ( ctsbuf_net_10 ) ) ;
NBUFFX2_LVT copt_d_inst_1191 ( .A ( n202 ) , .Y ( copt_net_535 ) ) ;
NBUFFX2_HVT ZBUF_inst_42 ( .A ( pit_pre_scl[1] ) , .Y ( ZBUF_2 ) ) ;
NBUFFX4_HVT HFSBUF_1615_f_5 ( .A ( HFSNET_6 ) , .Y ( HFSNET_5 ) ) ;
INVX0_HVT HFSINV_1891_6 ( .A ( wb_rst_i ) , .Y ( HFSNET_6 ) ) ;
IBUFFX2_LVT cts_inv_371413 ( .A ( ctsbuf_net_32 ) , .Y ( ctsbuf_net_21 ) ) ;
INVX32_LVT cts_inv_376418 ( .A ( ctsbuf_net_43 ) , .Y ( ctsbuf_net_32 ) ) ;
INVX32_LVT cts_inv_381423 ( .A ( wb_clk_i ) , .Y ( ctsbuf_net_43 ) ) ;
NBUFFX2_LVT copt_d_inst_1192 ( .A ( n299 ) , .Y ( copt_net_536 ) ) ;
INVX1_LVT copt_d_inst_649 ( .A ( n232 ) , .Y ( copt_net_7 ) ) ;
NBUFFX2_LVT copt_d_inst_650 ( .A ( n190 ) , .Y ( copt_net_8 ) ) ;
INVX1_HVT copt_d_inst_1193 ( .A ( copt_net_526 ) , .Y ( copt_net_537 ) ) ;
NBUFFX2_HVT copt_d_inst_1172 ( .A ( copt_net_317 ) , .Y ( copt_net_516 ) ) ;
INVX2_LVT copt_d_inst_653 ( .A ( copt_net_7 ) , .Y ( copt_net_11 ) ) ;
NBUFFX4_HVT copt_d_inst_1175 ( .A ( copt_net_385 ) , .Y ( copt_net_519 ) ) ;
NBUFFX2_LVT copt_d_inst_657 ( .A ( \wishbone/address [0] ) , 
    .Y ( copt_net_15 ) ) ;
INVX0_HVT copt_d_inst_658 ( .A ( copt_net_17 ) , .Y ( copt_net_16 ) ) ;
INVX0_LVT copt_d_inst_659 ( .A ( \regs/N62 ) , .Y ( copt_net_17 ) ) ;
DELLN3X2_LVT copt_h_inst_674 ( .A ( n273 ) , .Y ( copt_net_32 ) ) ;
NBUFFX2_LVT copt_d_inst_662 ( .A ( aps_rename_1_ ) , .Y ( wb_ack_o ) ) ;
NBUFFX8_LVT copt_d_inst_1195 ( .A ( copt_net_11 ) , .Y ( copt_net_539 ) ) ;
NBUFFX2_LVT copt_d_inst_664 ( .A ( \prescale/cnt_n [14] ) , 
    .Y ( copt_net_22 ) ) ;
NBUFFX2_HVT copt_d_inst_665 ( .A ( copt_net_538 ) , .Y ( copt_net_23 ) ) ;
NBUFFX4_HVT copt_d_inst_1185 ( .A ( cnt_n[15] ) , .Y ( copt_net_529 ) ) ;
DELLN1X2_LVT copt_d_inst_667 ( .A ( cnt_n[0] ) , .Y ( copt_net_25 ) ) ;
NBUFFX2_HVT copt_h_inst_675 ( .A ( copt_net_32 ) , .Y ( copt_net_33 ) ) ;
NBUFFX2_HVT copt_d_inst_1174 ( .A ( copt_net_199 ) , .Y ( copt_net_518 ) ) ;
DELLN3X2_LVT copt_h_inst_677 ( .A ( n275 ) , .Y ( copt_net_35 ) ) ;
NBUFFX2_HVT copt_h_inst_678 ( .A ( copt_net_35 ) , .Y ( copt_net_36 ) ) ;
NBUFFX2_HVT copt_h_inst_679 ( .A ( copt_net_479 ) , .Y ( copt_net_37 ) ) ;
NBUFFX2_LVT copt_d_inst_1196 ( .A ( n222 ) , .Y ( copt_net_540 ) ) ;
DELLN3X2_LVT copt_h_inst_681 ( .A ( n277 ) , .Y ( copt_net_39 ) ) ;
DELLN3X2_LVT copt_h_inst_682 ( .A ( copt_net_39 ) , .Y ( copt_net_40 ) ) ;
NBUFFX2_HVT copt_h_inst_683 ( .A ( copt_net_40 ) , .Y ( copt_net_41 ) ) ;
INVX8_HVT copt_d_inst_1186 ( .A ( copt_net_531 ) , .Y ( copt_net_530 ) ) ;
DELLN3X2_LVT copt_h_inst_685 ( .A ( n279 ) , .Y ( copt_net_43 ) ) ;
DELLN2X2_LVT copt_h_inst_686 ( .A ( copt_net_43 ) , .Y ( copt_net_44 ) ) ;
NBUFFX2_HVT copt_h_inst_687 ( .A ( copt_net_44 ) , .Y ( copt_net_45 ) ) ;
NBUFFX2_HVT copt_h_inst_688 ( .A ( copt_net_45 ) , .Y ( copt_net_46 ) ) ;
NBUFFX4_HVT copt_h_inst_689 ( .A ( n281 ) , .Y ( copt_net_47 ) ) ;
DELLN3X2_LVT copt_h_inst_690 ( .A ( copt_net_187 ) , .Y ( copt_net_48 ) ) ;
INVX1_HVT copt_d_inst_1182 ( .A ( n300 ) , .Y ( copt_net_526 ) ) ;
IBUFFX2_LVT copt_d_inst_1184 ( .A ( n219 ) , .Y ( copt_net_528 ) ) ;
NBUFFX2_HVT copt_h_inst_693 ( .A ( copt_net_426 ) , .Y ( copt_net_51 ) ) ;
NBUFFX2_HVT copt_h_inst_694 ( .A ( copt_net_463 ) , .Y ( copt_net_52 ) ) ;
NBUFFX2_HVT copt_h_inst_695 ( .A ( copt_net_52 ) , .Y ( copt_net_53 ) ) ;
NBUFFX2_HVT copt_h_inst_696 ( .A ( copt_net_53 ) , .Y ( copt_net_54 ) ) ;
NBUFFX4_HVT copt_h_inst_697 ( .A ( copt_net_535 ) , .Y ( copt_net_55 ) ) ;
NBUFFX4_HVT copt_h_inst_698 ( .A ( copt_net_535 ) , .Y ( copt_net_56 ) ) ;
NBUFFX4_HVT copt_h_inst_699 ( .A ( copt_net_55 ) , .Y ( copt_net_57 ) ) ;
DELLN3X2_LVT copt_d_inst_1176 ( .A ( cnt_n[1] ) , .Y ( copt_net_520 ) ) ;
INVX1_LVT copt_d_inst_1168 ( .A ( copt_net_513 ) , .Y ( copt_net_512 ) ) ;
DELLN3X2_LVT copt_h_inst_702 ( .A ( copt_net_61 ) , .Y ( copt_net_60 ) ) ;
NBUFFX2_HVT copt_h_inst_703 ( .A ( pit_flg_clr ) , .Y ( copt_net_61 ) ) ;
DELLN2X2_LVT copt_h_inst_704 ( .A ( n320 ) , .Y ( copt_net_62 ) ) ;
NBUFFX32_HVT copt_h_inst_705 ( .A ( copt_net_461 ) , .Y ( copt_net_63 ) ) ;
NBUFFX32_HVT copt_h_inst_706 ( .A ( copt_net_429 ) , .Y ( copt_net_64 ) ) ;
NBUFFX4_HVT copt_h_inst_707 ( .A ( copt_net_73 ) , .Y ( copt_net_65 ) ) ;
NBUFFX16_HVT copt_h_inst_708 ( .A ( copt_net_75 ) , .Y ( copt_net_66 ) ) ;
NBUFFX4_HVT copt_h_inst_709 ( .A ( copt_net_71 ) , .Y ( copt_net_67 ) ) ;
NBUFFX4_HVT copt_h_inst_710 ( .A ( copt_net_429 ) , .Y ( copt_net_68 ) ) ;
NBUFFX4_HVT copt_h_inst_711 ( .A ( copt_net_429 ) , .Y ( copt_net_69 ) ) ;
NBUFFX4_HVT copt_h_inst_712 ( .A ( copt_net_429 ) , .Y ( copt_net_70 ) ) ;
NBUFFX4_HVT copt_h_inst_713 ( .A ( copt_net_76 ) , .Y ( copt_net_71 ) ) ;
NBUFFX4_HVT copt_h_inst_714 ( .A ( copt_net_68 ) , .Y ( copt_net_72 ) ) ;
NBUFFX4_HVT copt_h_inst_715 ( .A ( copt_net_69 ) , .Y ( copt_net_73 ) ) ;
NBUFFX4_HVT copt_h_inst_716 ( .A ( copt_net_72 ) , .Y ( copt_net_74 ) ) ;
NBUFFX4_HVT copt_h_inst_717 ( .A ( copt_net_70 ) , .Y ( copt_net_75 ) ) ;
NBUFFX4_HVT copt_h_inst_718 ( .A ( copt_net_429 ) , .Y ( copt_net_76 ) ) ;
NBUFFX2_HVT ZBUF_inst_1197 ( .A ( pit_pre_scl[2] ) , .Y ( ZBUF_0 ) ) ;
DELLN2X2_LVT copt_h_inst_720 ( .A ( \counter/N30 ) , .Y ( copt_net_78 ) ) ;
NBUFFX4_HVT copt_h_inst_721 ( .A ( n267 ) , .Y ( copt_net_79 ) ) ;
NBUFFX2_HVT copt_h_inst_722 ( .A ( copt_net_132 ) , .Y ( copt_net_80 ) ) ;
NBUFFX2_HVT ZBUF_inst_1198 ( .A ( pit_pre_scl[2] ) , .Y ( ZBUF_1 ) ) ;
NBUFFX2_HVT copt_h_inst_724 ( .A ( n269 ) , .Y ( copt_net_82 ) ) ;
NBUFFX2_HVT copt_h_inst_725 ( .A ( copt_net_82 ) , .Y ( copt_net_83 ) ) ;
NBUFFX2_HVT copt_h_inst_726 ( .A ( copt_net_83 ) , .Y ( copt_net_84 ) ) ;
INVX2_HVT copt_d_inst_1187 ( .A ( copt_net_532 ) , .Y ( copt_net_531 ) ) ;
NBUFFX2_HVT copt_h_inst_728 ( .A ( n271 ) , .Y ( copt_net_86 ) ) ;
NBUFFX2_HVT copt_h_inst_729 ( .A ( copt_net_86 ) , .Y ( copt_net_87 ) ) ;
NBUFFX2_HVT copt_h_inst_730 ( .A ( copt_net_87 ) , .Y ( copt_net_88 ) ) ;
NBUFFX2_HVT ZBUF_inst_1199 ( .A ( pit_pre_scl[2] ) , .Y ( ZBUF_3 ) ) ;
INVX2_LVT copt_d_inst_1170 ( .A ( copt_net_515 ) , .Y ( copt_net_514 ) ) ;
INVX1_LVT copt_d_inst_1171 ( .A ( n280 ) , .Y ( copt_net_515 ) ) ;
NBUFFX2_LVT copt_d_inst_1177 ( .A ( copt_net_179 ) , .Y ( copt_net_521 ) ) ;
NBUFFX2_HVT copt_h_inst_735 ( .A ( n325 ) , .Y ( copt_net_93 ) ) ;
NBUFFX2_HVT copt_h_inst_736 ( .A ( copt_net_304 ) , .Y ( copt_net_94 ) ) ;
NBUFFX2_HVT copt_h_inst_737 ( .A ( copt_net_94 ) , .Y ( copt_net_95 ) ) ;
NBUFFX2_HVT copt_h_inst_738 ( .A ( copt_net_95 ) , .Y ( copt_net_96 ) ) ;
NBUFFX2_HVT copt_h_inst_739 ( .A ( n198 ) , .Y ( copt_net_97 ) ) ;
NBUFFX2_HVT copt_h_inst_740 ( .A ( n198 ) , .Y ( copt_net_98 ) ) ;
DELLN1X2_LVT copt_d_inst_1178 ( .A ( \wishbone/address [1] ) , 
    .Y ( copt_net_522 ) ) ;
IBUFFX4_LVT copt_d_inst_1179 ( .A ( copt_net_524 ) , .Y ( copt_net_523 ) ) ;
NBUFFX2_HVT copt_h_inst_743 ( .A ( copt_net_102 ) , .Y ( copt_net_101 ) ) ;
NBUFFX4_HVT copt_h_inst_744 ( .A ( copt_net_452 ) , .Y ( copt_net_102 ) ) ;
NBUFFX2_HVT copt_h_inst_745 ( .A ( \wishbone/address [1] ) , 
    .Y ( copt_net_103 ) ) ;
NBUFFX2_HVT copt_h_inst_746 ( .A ( copt_net_485 ) , .Y ( copt_net_104 ) ) ;
INVX1_LVT copt_d_inst_1180 ( .A ( copt_net_453 ) , .Y ( copt_net_524 ) ) ;
NBUFFX4_LVT copt_d_inst_1188 ( .A ( copt_net_26 ) , .Y ( copt_net_532 ) ) ;
NBUFFX2_HVT copt_h_inst_749 ( .A ( n326 ) , .Y ( copt_net_107 ) ) ;
NBUFFX2_HVT ZBUF_inst_1200 ( .A ( n152 ) , .Y ( ZBUF_4 ) ) ;
NBUFFX2_HVT ZBUF_inst_1201 ( .A ( n228 ) , .Y ( ZBUF_5 ) ) ;
NBUFFX2_HVT ZBUF_inst_1202 ( .A ( ZBUF_7 ) , .Y ( ZBUF_6 ) ) ;
NBUFFX4_HVT ZBUF_inst_1203 ( .A ( n230 ) , .Y ( ZBUF_7 ) ) ;
INVX1_LVT U_PTECO_HOLD_BUF2 ( .A ( net_PTECO_HOLD_NET1 ) , 
    .Y ( net_PTECO_HOLD_NET2 ) ) ;
NBUFFX4_HVT copt_h_inst_755 ( .A ( n210 ) , .Y ( copt_net_113 ) ) ;
NBUFFX4_HVT copt_h_inst_756 ( .A ( n210 ) , .Y ( copt_net_114 ) ) ;
NBUFFX2_HVT copt_h_inst_757 ( .A ( n229 ) , .Y ( copt_net_115 ) ) ;
NBUFFX2_HVT copt_h_inst_758 ( .A ( n259 ) , .Y ( copt_net_116 ) ) ;
NBUFFX2_HVT copt_h_inst_759 ( .A ( copt_net_116 ) , .Y ( copt_net_117 ) ) ;
INVX1_LVT U_PTECO_HOLD_BUF1 ( .A ( n177 ) , .Y ( net_PTECO_HOLD_NET1 ) ) ;
INVX1_LVT U_PTECO_HOLD_BUF2_0 ( .A ( net_PTECO_HOLD_NET1_1 ) , 
    .Y ( net_PTECO_HOLD_NET2_0 ) ) ;
DELLN3X2_LVT copt_h_inst_762 ( .A ( copt_net_481 ) , .Y ( copt_net_120 ) ) ;
NBUFFX2_HVT copt_h_inst_763 ( .A ( copt_net_120 ) , .Y ( copt_net_121 ) ) ;
INVX1_LVT U_PTECO_HOLD_BUF1_1 ( .A ( net_PTECO_HOLD_NET2 ) , 
    .Y ( net_PTECO_HOLD_NET1_1 ) ) ;
NBUFFX2_HVT copt_h_inst_765 ( .A ( n220 ) , .Y ( copt_net_123 ) ) ;
NBUFFX2_HVT copt_h_inst_766 ( .A ( n220 ) , .Y ( copt_net_124 ) ) ;
NBUFFX2_HVT copt_h_inst_770 ( .A ( copt_net_332 ) , .Y ( copt_net_128 ) ) ;
NBUFFX2_HVT copt_h_inst_771 ( .A ( copt_net_62 ) , .Y ( copt_net_129 ) ) ;
NBUFFX2_HVT copt_h_inst_773 ( .A ( n311 ) , .Y ( copt_net_131 ) ) ;
NBUFFX4_HVT copt_h_inst_774 ( .A ( copt_net_79 ) , .Y ( copt_net_132 ) ) ;
NBUFFX4_HVT copt_h_inst_775 ( .A ( copt_net_420 ) , .Y ( copt_net_133 ) ) ;
NBUFFX2_HVT copt_h_inst_776 ( .A ( copt_net_137 ) , .Y ( copt_net_134 ) ) ;
NBUFFX2_HVT copt_h_inst_777 ( .A ( copt_net_540 ) , .Y ( copt_net_135 ) ) ;
NBUFFX2_HVT copt_h_inst_778 ( .A ( copt_net_138 ) , .Y ( copt_net_136 ) ) ;
NBUFFX4_HVT copt_h_inst_779 ( .A ( copt_net_540 ) , .Y ( copt_net_137 ) ) ;
NBUFFX4_HVT copt_h_inst_780 ( .A ( copt_net_540 ) , .Y ( copt_net_138 ) ) ;
NBUFFX4_HVT copt_h_inst_781 ( .A ( n125 ) , .Y ( copt_net_139 ) ) ;
NBUFFX4_HVT copt_h_inst_783 ( .A ( n263 ) , .Y ( copt_net_141 ) ) ;
INVX0_LVT copt_d_inst_1169 ( .A ( n324 ) , .Y ( copt_net_513 ) ) ;
NBUFFX2_HVT copt_h_inst_785 ( .A ( \counter/N36 ) , .Y ( copt_net_143 ) ) ;
NBUFFX2_HVT copt_h_inst_786 ( .A ( n335 ) , .Y ( copt_net_144 ) ) ;
NBUFFX4_HVT copt_h_inst_788 ( .A ( n336 ) , .Y ( copt_net_146 ) ) ;
NBUFFX4_HVT copt_h_inst_789 ( .A ( n331 ) , .Y ( copt_net_147 ) ) ;
NBUFFX2_HVT copt_h_inst_791 ( .A ( copt_net_416 ) , .Y ( copt_net_149 ) ) ;
NBUFFX2_HVT copt_h_inst_794 ( .A ( \prescale/N56 ) , .Y ( copt_net_152 ) ) ;
NBUFFX2_HVT copt_h_inst_795 ( .A ( copt_net_152 ) , .Y ( copt_net_153 ) ) ;
NBUFFX2_HVT copt_h_inst_798 ( .A ( \prescale/N60 ) , .Y ( copt_net_156 ) ) ;
NBUFFX2_HVT copt_h_inst_799 ( .A ( copt_net_161 ) , .Y ( copt_net_157 ) ) ;
NBUFFX4_HVT copt_h_inst_800 ( .A ( n192 ) , .Y ( copt_net_158 ) ) ;
NBUFFX4_HVT copt_h_inst_801 ( .A ( copt_net_158 ) , .Y ( copt_net_159 ) ) ;
NBUFFX4_HVT copt_h_inst_802 ( .A ( copt_net_159 ) , .Y ( copt_net_160 ) ) ;
NBUFFX4_HVT copt_h_inst_803 ( .A ( copt_net_160 ) , .Y ( copt_net_161 ) ) ;
NBUFFX4_HVT copt_h_inst_804 ( .A ( n261 ) , .Y ( copt_net_162 ) ) ;
NBUFFX4_HVT copt_h_inst_806 ( .A ( n333 ) , .Y ( copt_net_164 ) ) ;
NBUFFX4_HVT copt_h_inst_807 ( .A ( copt_net_164 ) , .Y ( copt_net_165 ) ) ;
NBUFFX4_HVT copt_h_inst_808 ( .A ( copt_net_147 ) , .Y ( copt_net_166 ) ) ;
NBUFFX4_HVT copt_h_inst_809 ( .A ( copt_net_166 ) , .Y ( copt_net_167 ) ) ;
NBUFFX2_HVT copt_h_inst_811 ( .A ( n200 ) , .Y ( copt_net_169 ) ) ;
NBUFFX2_HVT copt_h_inst_812 ( .A ( copt_net_171 ) , .Y ( copt_net_170 ) ) ;
NBUFFX4_HVT copt_h_inst_813 ( .A ( copt_net_172 ) , .Y ( copt_net_171 ) ) ;
NBUFFX4_HVT copt_h_inst_814 ( .A ( copt_net_173 ) , .Y ( copt_net_172 ) ) ;
NBUFFX4_HVT copt_h_inst_815 ( .A ( n195 ) , .Y ( copt_net_173 ) ) ;
NBUFFX2_HVT copt_h_inst_817 ( .A ( n209 ) , .Y ( copt_net_175 ) ) ;
NBUFFX4_HVT copt_h_inst_818 ( .A ( copt_net_175 ) , .Y ( copt_net_176 ) ) ;
NBUFFX2_HVT copt_h_inst_819 ( .A ( copt_net_15 ) , .Y ( copt_net_177 ) ) ;
NBUFFX4_HVT copt_h_inst_821 ( .A ( n290 ) , .Y ( copt_net_179 ) ) ;
NBUFFX2_HVT copt_h_inst_823 ( .A ( copt_net_383 ) , .Y ( copt_net_181 ) ) ;
NBUFFX4_HVT copt_h_inst_824 ( .A ( copt_net_406 ) , .Y ( copt_net_182 ) ) ;
NBUFFX2_HVT copt_h_inst_825 ( .A ( copt_net_184 ) , .Y ( copt_net_183 ) ) ;
NBUFFX4_HVT copt_h_inst_826 ( .A ( n290 ) , .Y ( copt_net_184 ) ) ;
NBUFFX4_HVT copt_h_inst_827 ( .A ( copt_net_412 ) , .Y ( copt_net_185 ) ) ;
DELLN2X2_LVT copt_h_inst_828 ( .A ( n199 ) , .Y ( copt_net_186 ) ) ;
NBUFFX4_HVT copt_h_inst_829 ( .A ( copt_net_47 ) , .Y ( copt_net_187 ) ) ;
NBUFFX2_HVT copt_h_inst_830 ( .A ( n297 ) , .Y ( copt_net_188 ) ) ;
NBUFFX2_HVT copt_h_inst_831 ( .A ( n297 ) , .Y ( copt_net_189 ) ) ;
NBUFFX2_HVT copt_h_inst_832 ( .A ( n297 ) , .Y ( copt_net_190 ) ) ;
NBUFFX2_HVT copt_h_inst_833 ( .A ( copt_net_262 ) , .Y ( copt_net_191 ) ) ;
NBUFFX2_HVT copt_h_inst_834 ( .A ( n297 ) , .Y ( copt_net_192 ) ) ;
NBUFFX2_HVT copt_h_inst_835 ( .A ( copt_net_195 ) , .Y ( copt_net_193 ) ) ;
NBUFFX2_HVT copt_h_inst_836 ( .A ( n297 ) , .Y ( copt_net_194 ) ) ;
NBUFFX4_HVT copt_h_inst_837 ( .A ( n297 ) , .Y ( copt_net_195 ) ) ;
NBUFFX4_HVT copt_h_inst_838 ( .A ( n297 ) , .Y ( copt_net_196 ) ) ;
NBUFFX2_HVT copt_h_inst_839 ( .A ( cnt_n[14] ) , .Y ( copt_net_197 ) ) ;
NBUFFX2_HVT copt_h_inst_840 ( .A ( copt_net_320 ) , .Y ( copt_net_198 ) ) ;
NBUFFX2_HVT copt_h_inst_841 ( .A ( copt_net_198 ) , .Y ( copt_net_199 ) ) ;
NBUFFX2_HVT copt_h_inst_843 ( .A ( \prescale/cnt_n [4] ) , 
    .Y ( copt_net_201 ) ) ;
NBUFFX2_HVT copt_h_inst_844 ( .A ( copt_net_201 ) , .Y ( copt_net_202 ) ) ;
NBUFFX2_HVT copt_h_inst_845 ( .A ( copt_net_202 ) , .Y ( copt_net_203 ) ) ;
NBUFFX2_HVT copt_h_inst_846 ( .A ( copt_net_203 ) , .Y ( copt_net_204 ) ) ;
NBUFFX2_HVT copt_h_inst_847 ( .A ( copt_net_206 ) , .Y ( copt_net_205 ) ) ;
NBUFFX4_HVT copt_h_inst_848 ( .A ( copt_net_376 ) , .Y ( copt_net_206 ) ) ;
NBUFFX2_HVT copt_h_inst_849 ( .A ( \prescale/cnt_n [12] ) , 
    .Y ( copt_net_207 ) ) ;
NBUFFX2_HVT copt_h_inst_850 ( .A ( copt_net_207 ) , .Y ( copt_net_208 ) ) ;
NBUFFX2_HVT copt_h_inst_851 ( .A ( copt_net_208 ) , .Y ( copt_net_209 ) ) ;
NBUFFX2_HVT copt_h_inst_852 ( .A ( copt_net_209 ) , .Y ( copt_net_210 ) ) ;
NBUFFX2_HVT copt_h_inst_853 ( .A ( \prescale/cnt_n [1] ) , 
    .Y ( copt_net_211 ) ) ;
NBUFFX2_HVT copt_h_inst_854 ( .A ( copt_net_315 ) , .Y ( copt_net_212 ) ) ;
NBUFFX2_HVT copt_h_inst_855 ( .A ( copt_net_212 ) , .Y ( copt_net_213 ) ) ;
NBUFFX2_HVT copt_h_inst_856 ( .A ( \prescale/cnt_n [7] ) , 
    .Y ( copt_net_214 ) ) ;
NBUFFX2_HVT copt_h_inst_857 ( .A ( copt_net_309 ) , .Y ( copt_net_215 ) ) ;
NBUFFX2_HVT copt_h_inst_858 ( .A ( copt_net_215 ) , .Y ( copt_net_216 ) ) ;
NBUFFX2_HVT copt_h_inst_859 ( .A ( copt_net_216 ) , .Y ( copt_net_217 ) ) ;
NBUFFX2_HVT copt_h_inst_860 ( .A ( \prescale/cnt_n [7] ) , 
    .Y ( copt_net_218 ) ) ;
NBUFFX2_HVT copt_h_inst_861 ( .A ( \prescale/cnt_n [11] ) , 
    .Y ( copt_net_219 ) ) ;
NBUFFX2_HVT copt_h_inst_862 ( .A ( copt_net_278 ) , .Y ( copt_net_220 ) ) ;
NBUFFX2_HVT copt_h_inst_863 ( .A ( copt_net_220 ) , .Y ( copt_net_221 ) ) ;
NBUFFX2_HVT copt_h_inst_864 ( .A ( copt_net_221 ) , .Y ( copt_net_222 ) ) ;
NBUFFX2_HVT copt_h_inst_865 ( .A ( \prescale/cnt_n [11] ) , 
    .Y ( copt_net_223 ) ) ;
NBUFFX2_HVT copt_h_inst_866 ( .A ( copt_net_226 ) , .Y ( copt_net_224 ) ) ;
NBUFFX2_HVT copt_h_inst_867 ( .A ( copt_net_227 ) , .Y ( copt_net_225 ) ) ;
NBUFFX4_HVT copt_h_inst_868 ( .A ( copt_net_228 ) , .Y ( copt_net_226 ) ) ;
NBUFFX4_HVT copt_h_inst_869 ( .A ( n317 ) , .Y ( copt_net_227 ) ) ;
NBUFFX4_HVT copt_h_inst_870 ( .A ( n317 ) , .Y ( copt_net_228 ) ) ;
NBUFFX2_HVT copt_h_inst_871 ( .A ( \prescale/cnt_n [9] ) , 
    .Y ( copt_net_229 ) ) ;
NBUFFX2_HVT copt_h_inst_872 ( .A ( copt_net_229 ) , .Y ( copt_net_230 ) ) ;
NBUFFX2_HVT copt_h_inst_873 ( .A ( copt_net_229 ) , .Y ( copt_net_231 ) ) ;
NBUFFX4_HVT copt_h_inst_874 ( .A ( copt_net_471 ) , .Y ( copt_net_232 ) ) ;
NBUFFX2_HVT copt_h_inst_875 ( .A ( copt_net_235 ) , .Y ( copt_net_233 ) ) ;
NBUFFX4_HVT copt_h_inst_876 ( .A ( copt_net_128 ) , .Y ( copt_net_234 ) ) ;
NBUFFX4_HVT copt_h_inst_877 ( .A ( copt_net_234 ) , .Y ( copt_net_235 ) ) ;
NBUFFX4_HVT copt_h_inst_878 ( .A ( n203 ) , .Y ( copt_net_236 ) ) ;
NBUFFX4_HVT copt_h_inst_879 ( .A ( copt_net_48 ) , .Y ( copt_net_237 ) ) ;
NBUFFX4_HVT copt_h_inst_880 ( .A ( copt_net_237 ) , .Y ( copt_net_238 ) ) ;
NBUFFX4_HVT copt_h_inst_881 ( .A ( copt_net_238 ) , .Y ( copt_net_239 ) ) ;
DELLN1X2_LVT copt_h_inst_884 ( .A ( n216 ) , .Y ( copt_net_242 ) ) ;
NBUFFX4_HVT copt_h_inst_885 ( .A ( copt_net_242 ) , .Y ( copt_net_243 ) ) ;
NBUFFX2_HVT copt_h_inst_887 ( .A ( copt_net_248 ) , .Y ( copt_net_245 ) ) ;
NBUFFX4_HVT copt_h_inst_888 ( .A ( \prescale/cnt_n [10] ) , 
    .Y ( copt_net_246 ) ) ;
NBUFFX4_HVT copt_h_inst_889 ( .A ( copt_net_246 ) , .Y ( copt_net_247 ) ) ;
NBUFFX4_HVT copt_h_inst_890 ( .A ( copt_net_247 ) , .Y ( copt_net_248 ) ) ;
NBUFFX2_HVT copt_h_inst_894 ( .A ( \prescale/cnt_n [0] ) , 
    .Y ( copt_net_252 ) ) ;
NBUFFX2_HVT copt_h_inst_895 ( .A ( copt_net_340 ) , .Y ( copt_net_253 ) ) ;
NBUFFX2_HVT copt_h_inst_896 ( .A ( copt_net_253 ) , .Y ( copt_net_254 ) ) ;
NBUFFX2_HVT copt_h_inst_897 ( .A ( copt_net_258 ) , .Y ( copt_net_255 ) ) ;
NBUFFX2_HVT copt_h_inst_898 ( .A ( copt_net_255 ) , .Y ( copt_net_256 ) ) ;
NBUFFX2_HVT copt_h_inst_899 ( .A ( copt_net_377 ) , .Y ( copt_net_257 ) ) ;
NBUFFX4_HVT copt_h_inst_900 ( .A ( \prescale/cnt_n [8] ) , 
    .Y ( copt_net_258 ) ) ;
NBUFFX2_HVT copt_h_inst_901 ( .A ( \prescale/cnt_n [3] ) , 
    .Y ( copt_net_259 ) ) ;
NBUFFX2_HVT copt_h_inst_902 ( .A ( copt_net_259 ) , .Y ( copt_net_260 ) ) ;
NBUFFX2_HVT copt_h_inst_903 ( .A ( copt_net_260 ) , .Y ( copt_net_261 ) ) ;
NBUFFX4_HVT copt_h_inst_904 ( .A ( copt_net_188 ) , .Y ( copt_net_262 ) ) ;
NBUFFX2_HVT copt_h_inst_905 ( .A ( copt_net_232 ) , .Y ( copt_net_263 ) ) ;
NBUFFX4_HVT copt_h_inst_906 ( .A ( n307 ) , .Y ( copt_net_264 ) ) ;
NBUFFX2_HVT copt_h_inst_907 ( .A ( copt_net_301 ) , .Y ( copt_net_265 ) ) ;
NBUFFX4_HVT copt_h_inst_908 ( .A ( cnt_n[12] ) , .Y ( copt_net_266 ) ) ;
NBUFFX2_HVT copt_h_inst_909 ( .A ( copt_net_448 ) , .Y ( copt_net_267 ) ) ;
NBUFFX4_HVT copt_h_inst_910 ( .A ( copt_net_267 ) , .Y ( copt_net_268 ) ) ;
NBUFFX4_HVT copt_h_inst_911 ( .A ( copt_net_268 ) , .Y ( copt_net_269 ) ) ;
NBUFFX2_HVT copt_h_inst_912 ( .A ( copt_net_271 ) , .Y ( copt_net_270 ) ) ;
NBUFFX4_HVT copt_h_inst_913 ( .A ( copt_net_272 ) , .Y ( copt_net_271 ) ) ;
NBUFFX4_HVT copt_h_inst_914 ( .A ( copt_net_273 ) , .Y ( copt_net_272 ) ) ;
NBUFFX4_HVT copt_h_inst_915 ( .A ( copt_net_274 ) , .Y ( copt_net_273 ) ) ;
NBUFFX4_HVT copt_h_inst_916 ( .A ( copt_net_523 ) , .Y ( copt_net_274 ) ) ;
NBUFFX2_HVT copt_h_inst_917 ( .A ( copt_net_357 ) , .Y ( copt_net_275 ) ) ;
NBUFFX2_HVT copt_h_inst_918 ( .A ( copt_net_277 ) , .Y ( copt_net_276 ) ) ;
NBUFFX4_HVT copt_h_inst_919 ( .A ( copt_net_131 ) , .Y ( copt_net_277 ) ) ;
NBUFFX2_HVT copt_h_inst_920 ( .A ( copt_net_280 ) , .Y ( copt_net_278 ) ) ;
NBUFFX4_HVT copt_h_inst_921 ( .A ( copt_net_219 ) , .Y ( copt_net_279 ) ) ;
NBUFFX4_HVT copt_h_inst_922 ( .A ( copt_net_279 ) , .Y ( copt_net_280 ) ) ;
NBUFFX2_HVT copt_h_inst_923 ( .A ( copt_net_372 ) , .Y ( copt_net_281 ) ) ;
NBUFFX2_HVT copt_h_inst_924 ( .A ( copt_net_370 ) , .Y ( copt_net_282 ) ) ;
NBUFFX2_HVT copt_h_inst_925 ( .A ( copt_net_281 ) , .Y ( copt_net_283 ) ) ;
NBUFFX2_HVT copt_h_inst_926 ( .A ( copt_net_286 ) , .Y ( copt_net_284 ) ) ;
NBUFFX2_HVT copt_h_inst_927 ( .A ( copt_net_284 ) , .Y ( copt_net_285 ) ) ;
NBUFFX4_HVT copt_h_inst_928 ( .A ( pit_slave ) , .Y ( copt_net_286 ) ) ;
NBUFFX2_HVT copt_h_inst_929 ( .A ( copt_net_225 ) , .Y ( copt_net_287 ) ) ;
NBUFFX2_HVT copt_h_inst_930 ( .A ( copt_net_287 ) , .Y ( copt_net_288 ) ) ;
NBUFFX2_HVT copt_h_inst_931 ( .A ( copt_net_533 ) , .Y ( copt_net_289 ) ) ;
NBUFFX4_HVT copt_h_inst_932 ( .A ( copt_net_289 ) , .Y ( copt_net_290 ) ) ;
NBUFFX4_HVT copt_h_inst_933 ( .A ( copt_net_290 ) , .Y ( copt_net_291 ) ) ;
NBUFFX2_HVT copt_h_inst_934 ( .A ( \prescale/cnt_n [6] ) , 
    .Y ( copt_net_292 ) ) ;
NBUFFX2_HVT copt_h_inst_935 ( .A ( copt_net_292 ) , .Y ( copt_net_293 ) ) ;
NBUFFX2_HVT copt_h_inst_936 ( .A ( copt_net_293 ) , .Y ( copt_net_294 ) ) ;
NBUFFX2_HVT copt_h_inst_937 ( .A ( copt_net_294 ) , .Y ( copt_net_295 ) ) ;
NBUFFX2_HVT copt_h_inst_938 ( .A ( copt_net_295 ) , .Y ( copt_net_296 ) ) ;
NBUFFX2_HVT copt_h_inst_939 ( .A ( copt_net_503 ) , .Y ( copt_net_297 ) ) ;
NBUFFX4_HVT copt_h_inst_940 ( .A ( copt_net_264 ) , .Y ( copt_net_298 ) ) ;
NBUFFX4_HVT copt_h_inst_941 ( .A ( copt_net_298 ) , .Y ( copt_net_299 ) ) ;
NBUFFX2_HVT copt_h_inst_942 ( .A ( copt_net_299 ) , .Y ( copt_net_300 ) ) ;
NBUFFX4_HVT copt_h_inst_943 ( .A ( copt_net_300 ) , .Y ( copt_net_301 ) ) ;
NBUFFX4_HVT copt_h_inst_944 ( .A ( copt_net_93 ) , .Y ( copt_net_302 ) ) ;
NBUFFX4_HVT copt_h_inst_945 ( .A ( copt_net_302 ) , .Y ( copt_net_303 ) ) ;
NBUFFX4_HVT copt_h_inst_946 ( .A ( copt_net_303 ) , .Y ( copt_net_304 ) ) ;
NBUFFX2_HVT copt_h_inst_947 ( .A ( copt_net_231 ) , .Y ( copt_net_305 ) ) ;
NBUFFX2_HVT copt_h_inst_948 ( .A ( copt_net_214 ) , .Y ( copt_net_306 ) ) ;
NBUFFX4_HVT copt_h_inst_949 ( .A ( copt_net_306 ) , .Y ( copt_net_307 ) ) ;
NBUFFX4_HVT copt_h_inst_950 ( .A ( copt_net_307 ) , .Y ( copt_net_308 ) ) ;
NBUFFX4_HVT copt_h_inst_951 ( .A ( copt_net_308 ) , .Y ( copt_net_309 ) ) ;
NBUFFX4_HVT copt_h_inst_953 ( .A ( copt_net_418 ) , .Y ( copt_net_311 ) ) ;
DELLN1X2_LVT copt_h_inst_954 ( .A ( copt_net_313 ) , .Y ( copt_net_312 ) ) ;
NBUFFX4_HVT copt_h_inst_955 ( .A ( n213 ) , .Y ( copt_net_313 ) ) ;
NBUFFX4_HVT copt_h_inst_956 ( .A ( copt_net_189 ) , .Y ( copt_net_314 ) ) ;
NBUFFX2_HVT copt_h_inst_957 ( .A ( copt_net_211 ) , .Y ( copt_net_315 ) ) ;
DELLN1X2_LVT copt_h_inst_958 ( .A ( copt_net_362 ) , .Y ( copt_net_316 ) ) ;
NBUFFX2_HVT copt_h_inst_959 ( .A ( copt_net_245 ) , .Y ( copt_net_317 ) ) ;
NBUFFX4_HVT copt_h_inst_961 ( .A ( copt_net_197 ) , .Y ( copt_net_319 ) ) ;
NBUFFX4_HVT copt_h_inst_962 ( .A ( copt_net_321 ) , .Y ( copt_net_320 ) ) ;
NBUFFX4_HVT copt_h_inst_963 ( .A ( copt_net_319 ) , .Y ( copt_net_321 ) ) ;
NBUFFX2_HVT copt_h_inst_964 ( .A ( copt_net_373 ) , .Y ( copt_net_322 ) ) ;
NBUFFX2_HVT copt_h_inst_965 ( .A ( n318 ) , .Y ( copt_net_323 ) ) ;
NBUFFX4_HVT copt_h_inst_966 ( .A ( copt_net_323 ) , .Y ( copt_net_324 ) ) ;
NBUFFX4_HVT copt_h_inst_967 ( .A ( copt_net_324 ) , .Y ( copt_net_325 ) ) ;
NBUFFX2_HVT copt_h_inst_969 ( .A ( copt_net_205 ) , .Y ( copt_net_327 ) ) ;
NBUFFX2_HVT copt_h_inst_971 ( .A ( cnt_n[9] ) , .Y ( copt_net_329 ) ) ;
NBUFFX2_HVT copt_h_inst_972 ( .A ( copt_net_329 ) , .Y ( copt_net_330 ) ) ;
NBUFFX4_HVT copt_h_inst_973 ( .A ( n197 ) , .Y ( copt_net_331 ) ) ;
NBUFFX4_HVT copt_h_inst_974 ( .A ( copt_net_129 ) , .Y ( copt_net_332 ) ) ;
NBUFFX4_HVT copt_h_inst_975 ( .A ( copt_net_183 ) , .Y ( copt_net_333 ) ) ;
NBUFFX4_HVT copt_h_inst_976 ( .A ( copt_net_333 ) , .Y ( copt_net_334 ) ) ;
NBUFFX2_HVT copt_h_inst_977 ( .A ( n193 ) , .Y ( copt_net_335 ) ) ;
NBUFFX2_HVT copt_h_inst_979 ( .A ( copt_net_391 ) , .Y ( copt_net_337 ) ) ;
NBUFFX2_HVT copt_h_inst_980 ( .A ( copt_net_213 ) , .Y ( copt_net_338 ) ) ;
NBUFFX2_HVT copt_h_inst_981 ( .A ( copt_net_341 ) , .Y ( copt_net_339 ) ) ;
NBUFFX4_HVT copt_h_inst_982 ( .A ( copt_net_339 ) , .Y ( copt_net_340 ) ) ;
NBUFFX4_HVT copt_h_inst_983 ( .A ( copt_net_252 ) , .Y ( copt_net_341 ) ) ;
NBUFFX4_HVT copt_h_inst_984 ( .A ( copt_net_157 ) , .Y ( copt_net_342 ) ) ;
NBUFFX2_HVT copt_h_inst_985 ( .A ( n194 ) , .Y ( copt_net_343 ) ) ;
NBUFFX2_HVT copt_h_inst_986 ( .A ( copt_net_499 ) , .Y ( copt_net_344 ) ) ;
DELLN3X2_LVT copt_h_inst_987 ( .A ( copt_net_335 ) , .Y ( copt_net_345 ) ) ;
NBUFFX2_HVT copt_h_inst_989 ( .A ( copt_net_498 ) , .Y ( copt_net_347 ) ) ;
DELLN2X2_LVT copt_h_inst_990 ( .A ( copt_net_343 ) , .Y ( copt_net_348 ) ) ;
NBUFFX2_HVT copt_h_inst_994 ( .A ( copt_net_353 ) , .Y ( copt_net_352 ) ) ;
NBUFFX4_HVT copt_h_inst_995 ( .A ( copt_net_355 ) , .Y ( copt_net_353 ) ) ;
NBUFFX4_HVT copt_h_inst_996 ( .A ( copt_net_190 ) , .Y ( copt_net_354 ) ) ;
NBUFFX4_HVT copt_h_inst_997 ( .A ( copt_net_354 ) , .Y ( copt_net_355 ) ) ;
NBUFFX2_HVT copt_h_inst_999 ( .A ( copt_net_113 ) , .Y ( copt_net_357 ) ) ;
NBUFFX4_HVT copt_h_inst_1009 ( .A ( copt_net_266 ) , .Y ( copt_net_362 ) ) ;
NBUFFX2_HVT copt_h_inst_1011 ( .A ( cnt_n[10] ) , .Y ( copt_net_364 ) ) ;
NBUFFX2_HVT copt_h_inst_1012 ( .A ( cnt_n[10] ) , .Y ( copt_net_365 ) ) ;
NBUFFX2_HVT copt_h_inst_1013 ( .A ( copt_net_364 ) , .Y ( copt_net_366 ) ) ;
NBUFFX2_HVT copt_h_inst_1014 ( .A ( copt_net_365 ) , .Y ( copt_net_367 ) ) ;
NBUFFX2_HVT copt_h_inst_1015 ( .A ( copt_net_366 ) , .Y ( copt_net_368 ) ) ;
NBUFFX2_HVT copt_h_inst_1016 ( .A ( copt_net_367 ) , .Y ( copt_net_369 ) ) ;
NBUFFX2_HVT copt_h_inst_1017 ( .A ( copt_net_368 ) , .Y ( copt_net_370 ) ) ;
NBUFFX4_HVT copt_h_inst_1018 ( .A ( copt_net_369 ) , .Y ( copt_net_371 ) ) ;
NBUFFX4_HVT copt_h_inst_1019 ( .A ( copt_net_371 ) , .Y ( copt_net_372 ) ) ;
NBUFFX4_HVT copt_h_inst_1020 ( .A ( n223 ) , .Y ( copt_net_373 ) ) ;
NBUFFX2_HVT copt_h_inst_1021 ( .A ( cnt_n[11] ) , .Y ( copt_net_374 ) ) ;
NBUFFX2_HVT copt_h_inst_1022 ( .A ( copt_net_374 ) , .Y ( copt_net_375 ) ) ;
NBUFFX4_HVT copt_h_inst_1023 ( .A ( copt_net_375 ) , .Y ( copt_net_376 ) ) ;
NBUFFX2_HVT copt_h_inst_1024 ( .A ( copt_net_380 ) , .Y ( copt_net_377 ) ) ;
NBUFFX4_HVT copt_h_inst_1025 ( .A ( copt_net_256 ) , .Y ( copt_net_378 ) ) ;
NBUFFX4_HVT copt_h_inst_1026 ( .A ( copt_net_378 ) , .Y ( copt_net_379 ) ) ;
NBUFFX4_HVT copt_h_inst_1027 ( .A ( copt_net_379 ) , .Y ( copt_net_380 ) ) ;
NBUFFX2_HVT copt_h_inst_1028 ( .A ( copt_net_382 ) , .Y ( copt_net_381 ) ) ;
NBUFFX4_HVT copt_h_inst_1029 ( .A ( cnt_n[8] ) , .Y ( copt_net_382 ) ) ;
NBUFFX2_HVT copt_h_inst_1030 ( .A ( copt_net_411 ) , .Y ( copt_net_383 ) ) ;
NBUFFX4_HVT copt_h_inst_1031 ( .A ( copt_net_508 ) , .Y ( copt_net_384 ) ) ;
NBUFFX4_HVT copt_h_inst_1032 ( .A ( copt_net_384 ) , .Y ( copt_net_385 ) ) ;
NBUFFX2_HVT copt_h_inst_1033 ( .A ( copt_net_182 ) , .Y ( copt_net_386 ) ) ;
NBUFFX2_HVT copt_h_inst_1034 ( .A ( copt_net_388 ) , .Y ( copt_net_387 ) ) ;
NBUFFX4_HVT copt_h_inst_1035 ( .A ( n231 ) , .Y ( copt_net_388 ) ) ;
NBUFFX2_HVT copt_h_inst_1036 ( .A ( copt_net_392 ) , .Y ( copt_net_389 ) ) ;
NBUFFX4_HVT copt_h_inst_1037 ( .A ( copt_net_504 ) , .Y ( copt_net_390 ) ) ;
NBUFFX4_HVT copt_h_inst_1038 ( .A ( copt_net_390 ) , .Y ( copt_net_391 ) ) ;
NBUFFX4_HVT copt_h_inst_1039 ( .A ( copt_net_506 ) , .Y ( copt_net_392 ) ) ;
NBUFFX2_HVT copt_h_inst_1040 ( .A ( copt_net_395 ) , .Y ( copt_net_393 ) ) ;
NBUFFX2_HVT copt_h_inst_1041 ( .A ( copt_net_395 ) , .Y ( copt_net_394 ) ) ;
NBUFFX4_HVT copt_h_inst_1042 ( .A ( cnt_n[7] ) , .Y ( copt_net_395 ) ) ;
NBUFFX2_HVT copt_h_inst_1043 ( .A ( cnt_n[6] ) , .Y ( copt_net_396 ) ) ;
NBUFFX2_HVT copt_h_inst_1044 ( .A ( copt_net_396 ) , .Y ( copt_net_397 ) ) ;
NBUFFX8_LVT copt_h_inst_1047 ( .A ( copt_net_530 ) , .Y ( copt_net_400 ) ) ;
NBUFFX2_LVT copt_h_inst_1049 ( .A ( copt_net_442 ) , .Y ( copt_net_402 ) ) ;
NBUFFX2_LVT copt_h_inst_1050 ( .A ( copt_net_445 ) , .Y ( copt_net_403 ) ) ;
NBUFFX2_LVT copt_h_inst_1051 ( .A ( copt_net_444 ) , .Y ( copt_net_404 ) ) ;
NBUFFX2_LVT copt_h_inst_1052 ( .A ( copt_net_63 ) , .Y ( copt_net_405 ) ) ;
NBUFFX4_HVT copt_h_inst_1053 ( .A ( copt_net_407 ) , .Y ( copt_net_406 ) ) ;
NBUFFX32_LVT copt_h_inst_1054 ( .A ( copt_net_409 ) , .Y ( copt_net_407 ) ) ;
NBUFFX4_LVT copt_h_inst_1055 ( .A ( n290 ) , .Y ( copt_net_408 ) ) ;
NBUFFX32_LVT copt_h_inst_1056 ( .A ( n290 ) , .Y ( copt_net_409 ) ) ;
NBUFFX2_LVT copt_h_inst_1057 ( .A ( n290 ) , .Y ( copt_net_410 ) ) ;
NBUFFX2_LVT copt_h_inst_1058 ( .A ( copt_net_408 ) , .Y ( copt_net_411 ) ) ;
NBUFFX2_LVT copt_h_inst_1059 ( .A ( copt_net_410 ) , .Y ( copt_net_412 ) ) ;
NBUFFX4_LVT copt_h_inst_1063 ( .A ( \prescale/N55 ) , .Y ( copt_net_416 ) ) ;
NBUFFX2_LVT copt_h_inst_1069 ( .A ( copt_net_263 ) , .Y ( copt_net_418 ) ) ;
NBUFFX4_LVT copt_h_inst_1071 ( .A ( copt_net_421 ) , .Y ( copt_net_420 ) ) ;
NBUFFX2_LVT copt_h_inst_1072 ( .A ( \wishbone/bus_wait_state ) , 
    .Y ( copt_net_421 ) ) ;
NBUFFX2_LVT copt_h_inst_1076 ( .A ( copt_net_316 ) , .Y ( copt_net_425 ) ) ;
NBUFFX4_LVT copt_h_inst_1077 ( .A ( copt_net_428 ) , .Y ( copt_net_426 ) ) ;
NBUFFX4_LVT copt_h_inst_1078 ( .A ( n284 ) , .Y ( copt_net_427 ) ) ;
NBUFFX2_LVT copt_h_inst_1079 ( .A ( copt_net_427 ) , .Y ( copt_net_428 ) ) ;
NBUFFX16_LVT copt_h_inst_1080 ( .A ( copt_net_532 ) , .Y ( copt_net_429 ) ) ;
DELLN3X2_LVT copt_h_inst_1083 ( .A ( copt_net_230 ) , .Y ( copt_net_431 ) ) ;
NBUFFX2_HVT copt_h_inst_1084 ( .A ( copt_net_434 ) , .Y ( copt_net_432 ) ) ;
NBUFFX2_LVT copt_h_inst_1085 ( .A ( copt_net_432 ) , .Y ( copt_net_433 ) ) ;
NBUFFX8_LVT copt_h_inst_1086 ( .A ( n305 ) , .Y ( copt_net_434 ) ) ;
NBUFFX4_LVT copt_h_inst_1094 ( .A ( copt_net_530 ) , .Y ( copt_net_441 ) ) ;
NBUFFX2_LVT copt_h_inst_1095 ( .A ( copt_net_441 ) , .Y ( copt_net_442 ) ) ;
NBUFFX2_LVT copt_h_inst_1097 ( .A ( copt_net_530 ) , .Y ( copt_net_444 ) ) ;
NBUFFX2_LVT copt_h_inst_1098 ( .A ( copt_net_530 ) , .Y ( copt_net_445 ) ) ;
NBUFFX2_LVT copt_h_inst_1103 ( .A ( n196 ) , .Y ( copt_net_447 ) ) ;
NBUFFX4_LVT copt_h_inst_1104 ( .A ( copt_net_449 ) , .Y ( copt_net_448 ) ) ;
NBUFFX2_LVT copt_h_inst_1105 ( .A ( copt_net_192 ) , .Y ( copt_net_449 ) ) ;
NBUFFX2_LVT copt_h_inst_1106 ( .A ( n309 ) , .Y ( copt_net_450 ) ) ;
NBUFFX2_HVT copt_h_inst_1107 ( .A ( cnt_flag_o ) , .Y ( copt_net_451 ) ) ;
DELLN3X2_LVT copt_h_inst_1108 ( .A ( copt_net_451 ) , .Y ( copt_net_452 ) ) ;
NBUFFX8_LVT copt_h_inst_1109 ( .A ( n295 ) , .Y ( copt_net_453 ) ) ;
NBUFFX2_LVT copt_h_inst_1114 ( .A ( \counter/N34 ) , .Y ( copt_net_458 ) ) ;
NBUFFX2_LVT copt_h_inst_1115 ( .A ( \counter/N31 ) , .Y ( copt_net_459 ) ) ;
NBUFFX2_LVT copt_h_inst_1116 ( .A ( copt_net_459 ) , .Y ( copt_net_460 ) ) ;
NBUFFX16_LVT copt_h_inst_1117 ( .A ( copt_net_64 ) , .Y ( copt_net_461 ) ) ;
NBUFFX4_LVT copt_h_inst_1119 ( .A ( copt_net_51 ) , .Y ( copt_net_463 ) ) ;
NBUFFX2_LVT copt_h_inst_1127 ( .A ( cnt_n[13] ) , .Y ( copt_net_471 ) ) ;
NBUFFX2_HVT copt_h_inst_1129 ( .A ( n243 ) , .Y ( copt_net_473 ) ) ;
DELLN3X2_LVT copt_h_inst_1130 ( .A ( copt_net_475 ) , .Y ( copt_net_474 ) ) ;
NBUFFX4_HVT copt_h_inst_1131 ( .A ( mod_value[15] ) , .Y ( copt_net_475 ) ) ;
NBUFFX16_HVT copt_h_inst_1132 ( .A ( copt_net_18 ) , .Y ( copt_net_476 ) ) ;
NBUFFX16_HVT copt_h_inst_1133 ( .A ( copt_net_476 ) , .Y ( copt_net_477 ) ) ;
NBUFFX4_LVT copt_h_inst_1135 ( .A ( copt_net_480 ) , .Y ( copt_net_479 ) ) ;
NBUFFX2_LVT copt_h_inst_1136 ( .A ( copt_net_36 ) , .Y ( copt_net_480 ) ) ;
NBUFFX4_LVT copt_h_inst_1137 ( .A ( n265 ) , .Y ( copt_net_481 ) ) ;
NBUFFX4_LVT copt_h_inst_1140 ( .A ( copt_net_486 ) , .Y ( copt_net_484 ) ) ;
NBUFFX2_LVT copt_h_inst_1141 ( .A ( copt_net_484 ) , .Y ( copt_net_485 ) ) ;
NBUFFX2_LVT copt_h_inst_1142 ( .A ( copt_net_103 ) , .Y ( copt_net_486 ) ) ;
DELLN1X2_LVT copt_h_inst_1143 ( .A ( copt_net_519 ) , .Y ( copt_net_487 ) ) ;
NBUFFX4_HVT copt_h_inst_1144 ( .A ( copt_net_519 ) , .Y ( copt_net_488 ) ) ;
NBUFFX4_HVT copt_h_inst_1149 ( .A ( copt_net_494 ) , .Y ( copt_net_493 ) ) ;
NBUFFX2_LVT copt_h_inst_1150 ( .A ( n310 ) , .Y ( copt_net_494 ) ) ;
NBUFFX2_HVT copt_h_inst_1151 ( .A ( copt_net_177 ) , .Y ( copt_net_495 ) ) ;
DELLN1X2_LVT copt_h_inst_1154 ( .A ( copt_net_124 ) , .Y ( copt_net_498 ) ) ;
NBUFFX2_LVT copt_h_inst_1155 ( .A ( copt_net_322 ) , .Y ( copt_net_499 ) ) ;
NBUFFX4_HVT copt_h_inst_1156 ( .A ( n308 ) , .Y ( copt_net_500 ) ) ;
DELLN3X2_LVT copt_h_inst_1157 ( .A ( copt_net_502 ) , .Y ( copt_net_501 ) ) ;
NBUFFX4_HVT copt_h_inst_1158 ( .A ( mod_value[9] ) , .Y ( copt_net_502 ) ) ;
DELLN3X2_LVT copt_h_inst_1159 ( .A ( copt_net_295 ) , .Y ( copt_net_503 ) ) ;
NBUFFX2_LVT copt_h_inst_1160 ( .A ( copt_net_191 ) , .Y ( copt_net_504 ) ) ;
NBUFFX4_HVT copt_h_inst_1161 ( .A ( copt_net_504 ) , .Y ( copt_net_505 ) ) ;
NBUFFX2_LVT copt_h_inst_1162 ( .A ( copt_net_504 ) , .Y ( copt_net_506 ) ) ;
NBUFFX2_LVT copt_h_inst_1164 ( .A ( n290 ) , .Y ( copt_net_508 ) ) ;
DELLN3X2_LVT copt_h_inst_1165 ( .A ( copt_net_510 ) , .Y ( copt_net_509 ) ) ;
NBUFFX8_HVT copt_h_inst_1166 ( .A ( mod_value[8] ) , .Y ( copt_net_510 ) ) ;
NBUFFX32_LVT copt_h_inst_1167 ( .A ( copt_net_521 ) , .Y ( copt_net_511 ) ) ;
endmodule


