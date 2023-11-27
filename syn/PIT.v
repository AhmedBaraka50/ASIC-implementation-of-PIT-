/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Nov 21 14:49:39 2023
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_pit_wb_bus_0_16_0_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2_HVT latch ( .CLK(CLK), .EN(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2_HVT latch ( .CLK(CLK), .EN(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_pit_count_COUNT_SIZE16_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2_HVT latch ( .CLK(CLK), .EN(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CGLPPRX2_HVT latch ( .CLK(CLK), .EN(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module pit_top ( wb_dat_o, wb_ack_o, wb_clk_i, wb_rst_i, arst_i, wb_adr_i, 
        wb_dat_i, wb_we_i, wb_stb_i, wb_cyc_i, wb_sel_i, pit_o, pit_irq_o, 
        cnt_flag_o, cnt_sync_o, ext_sync_i );
  output [15:0] wb_dat_o;
  input [2:0] wb_adr_i;
  input [15:0] wb_dat_i;
  input [1:0] wb_sel_i;
  input wb_clk_i, wb_rst_i, arst_i, wb_we_i, wb_stb_i, wb_cyc_i, ext_sync_i;
  output wb_ack_o, pit_o, pit_irq_o, cnt_flag_o, cnt_sync_o;
  wire   sync_reset, async_rst_b, pit_slave, pit_ien, pit_flg_clr,
         \wishbone/net2006 , \wishbone/N26 , \wishbone/bus_wait_state ,
         \wishbone/module_sel , \regs/net1989 , \regs/net1978 , \regs/N80 ,
         \regs/N79 , \regs/N78 , \regs/N77 , \regs/N76 , \regs/N75 ,
         \regs/N72 , \regs/N62 , \prescale/N60 , \prescale/N56 ,
         \prescale/N55 , \counter/net1960 , \counter/N50 , \counter/N41 ,
         \counter/N40 , \counter/N39 , \counter/N38 , \counter/N37 ,
         \counter/N36 , \counter/N35 , \counter/N34 , \counter/N33 ,
         \counter/N32 , \counter/N31 , \counter/N30 , \counter/N29 ,
         \counter/N28 , \counter/N27 , \counter/N26 , \counter/N25 , n122,
         n125, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350;
  wire   [15:0] cnt_n;
  wire   [15:0] mod_value;
  wire   [3:0] pit_pre_scl;
  wire   [2:0] \wishbone/address ;
  wire   [14:0] \prescale/cnt_n ;
  assign sync_reset = wb_rst_i;
  assign async_rst_b = arst_i;

  SNPS_CLOCK_GATE_HIGH_pit_wb_bus_0_16_0_0 \wishbone/clk_gate_addr_latch_reg  ( 
        .CLK(wb_clk_i), .EN(\wishbone/module_sel ), .ENCLK(\wishbone/net2006 ), 
        .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_2 \regs/clk_gate_pit_slave_reg  ( 
        .CLK(wb_clk_i), .EN(\regs/N62 ), .ENCLK(\regs/net1989 ), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_pit_regs_0_16_0_16_0_0 \regs/clk_gate_mod_value_reg  ( 
        .CLK(wb_clk_i), .EN(\regs/N80 ), .ENCLK(\regs/net1978 ), .TE(1'b0) );
  SNPS_CLOCK_GATE_HIGH_pit_count_COUNT_SIZE16_0 \counter/clk_gate_cnt_n_reg  ( 
        .CLK(wb_clk_i), .EN(\counter/N25 ), .ENCLK(\counter/net1960 ), .TE(
        1'b0) );
  DFFX1_HVT \wishbone/addr_latch_reg[0]  ( .D(wb_adr_i[0]), .CLK(
        \wishbone/net2006 ), .Q(\wishbone/address [0]) );
  DFFX1_HVT \wishbone/addr_latch_reg[1]  ( .D(wb_adr_i[1]), .CLK(
        \wishbone/net2006 ), .Q(\wishbone/address [1]) );
  DFFX1_HVT \wishbone/addr_latch_reg[2]  ( .D(wb_adr_i[2]), .CLK(
        \wishbone/net2006 ), .Q(\wishbone/address [2]) );
  DFFARX1_HVT \wishbone/bus_wait_state_reg  ( .D(\wishbone/N26 ), .CLK(
        wb_clk_i), .RSTB(n327), .Q(\wishbone/bus_wait_state ), .QN(n319) );
  DFFARX1_HVT \regs/pit_flg_clr_reg  ( .D(n122), .CLK(wb_clk_i), .RSTB(
        async_rst_b), .Q(pit_flg_clr), .QN(n320) );
  DFFARX1_HVT \regs/pit_ien_reg  ( .D(n342), .CLK(\regs/net1989 ), .RSTB(
        async_rst_b), .Q(pit_ien) );
  DFFARX1_HVT \regs/mod_value_reg[0]  ( .D(\regs/N72 ), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[0]), .QN(n318) );
  DFFARX1_HVT \regs/mod_value_reg[2]  ( .D(n341), .CLK(\regs/net1978 ), .RSTB(
        async_rst_b), .Q(mod_value[2]) );
  DFFARX1_HVT \regs/mod_value_reg[3]  ( .D(\regs/N75 ), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[3]) );
  DFFARX1_HVT \regs/mod_value_reg[4]  ( .D(\regs/N76 ), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[4]) );
  DFFARX1_HVT \regs/mod_value_reg[5]  ( .D(\regs/N77 ), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[5]) );
  DFFARX1_HVT \regs/mod_value_reg[6]  ( .D(\regs/N78 ), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[6]) );
  DFFARX1_HVT \regs/mod_value_reg[7]  ( .D(\regs/N79 ), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[7]) );
  DFFARX1_HVT \regs/mod_value_reg[8]  ( .D(n350), .CLK(\regs/net1978 ), .RSTB(
        async_rst_b), .Q(mod_value[8]) );
  DFFARX1_HVT \regs/mod_value_reg[9]  ( .D(n349), .CLK(\regs/net1978 ), .RSTB(
        async_rst_b), .Q(mod_value[9]) );
  DFFARX1_HVT \regs/mod_value_reg[10]  ( .D(n348), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[10]) );
  DFFARX1_HVT \regs/mod_value_reg[11]  ( .D(n347), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[11]) );
  DFFARX1_HVT \regs/mod_value_reg[12]  ( .D(n346), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[12]) );
  DFFARX1_HVT \regs/mod_value_reg[13]  ( .D(n345), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[13]) );
  DFFARX1_HVT \regs/mod_value_reg[14]  ( .D(n344), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[14]) );
  DFFARX1_HVT \regs/mod_value_reg[15]  ( .D(n343), .CLK(\regs/net1978 ), 
        .RSTB(async_rst_b), .Q(mod_value[15]) );
  DFFARX1_HVT \prescale/cnt_n_reg[2]  ( .D(n338), .CLK(wb_clk_i), .RSTB(
        async_rst_b), .Q(\prescale/cnt_n [2]) );
  DFFARX1_HVT \prescale/cnt_n_reg[3]  ( .D(\prescale/N55 ), .CLK(wb_clk_i), 
        .RSTB(async_rst_b), .Q(\prescale/cnt_n [3]), .QN(n317) );
  DFFARX1_HVT \prescale/cnt_n_reg[5]  ( .D(n337), .CLK(wb_clk_i), .RSTB(
        async_rst_b), .Q(\prescale/cnt_n [5]) );
  DFFARX1_HVT \prescale/cnt_n_reg[6]  ( .D(n336), .CLK(wb_clk_i), .RSTB(
        async_rst_b), .Q(\prescale/cnt_n [6]) );
  DFFARX1_HVT \prescale/cnt_n_reg[7]  ( .D(n335), .CLK(wb_clk_i), .RSTB(
        async_rst_b), .Q(\prescale/cnt_n [7]), .QN(n316) );
  DFFARX1_HVT \prescale/cnt_n_reg[9]  ( .D(n334), .CLK(wb_clk_i), .RSTB(n327), 
        .Q(\prescale/cnt_n [9]) );
  DFFARX1_HVT \prescale/cnt_n_reg[10]  ( .D(n333), .CLK(wb_clk_i), .RSTB(n327), 
        .Q(\prescale/cnt_n [10]) );
  DFFARX1_HVT \prescale/cnt_n_reg[11]  ( .D(n332), .CLK(wb_clk_i), .RSTB(n327), 
        .Q(\prescale/cnt_n [11]), .QN(n315) );
  DFFARX1_HVT \prescale/cnt_n_reg[12]  ( .D(n331), .CLK(wb_clk_i), .RSTB(n327), 
        .Q(\prescale/cnt_n [12]) );
  DFFARX1_HVT \prescale/cnt_n_reg[13]  ( .D(n330), .CLK(wb_clk_i), .RSTB(n327), 
        .Q(\prescale/cnt_n [13]), .QN(n313) );
  DFFARX1_HVT \prescale/cnt_n_reg[14]  ( .D(n329), .CLK(wb_clk_i), .RSTB(n327), 
        .Q(\prescale/cnt_n [14]), .QN(n314) );
  DFFARX1_HVT \counter/cnt_n_reg[11]  ( .D(\counter/N37 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[11]) );
  DFFARX1_HVT \counter/cnt_n_reg[10]  ( .D(\counter/N36 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[10]) );
  DFFARX1_HVT \counter/cnt_n_reg[8]  ( .D(\counter/N34 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[8]) );
  DFFARX1_LVT \counter/cnt_n_reg[2]  ( .D(\counter/N28 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[2]) );
  DFFARX1_LVT \counter/cnt_n_reg[1]  ( .D(\counter/N27 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[1]) );
  DFFASX1_LVT \counter/cnt_n_reg[0]  ( .D(\counter/N26 ), .CLK(
        \counter/net1960 ), .SETB(n327), .Q(cnt_n[0]), .QN(n325) );
  DFFARX1_HVT \counter/cnt_flag_o_reg  ( .D(n125), .CLK(wb_clk_i), .RSTB(n327), 
        .Q(cnt_flag_o), .QN(n326) );
  DFFARX1_HVT \regs/cnt_sync_o_reg  ( .D(\regs/N72 ), .CLK(\regs/net1989 ), 
        .RSTB(n327), .Q(cnt_sync_o), .QN(n324) );
  DFFARX1_HVT \regs/pit_pre_reg[3]  ( .D(n347), .CLK(\regs/net1989 ), .RSTB(
        async_rst_b), .Q(pit_pre_scl[3]), .QN(n321) );
  DFFASX1_HVT \regs/pit_irq_o_reg  ( .D(n143), .CLK(wb_clk_i), .SETB(n327), 
        .QN(pit_irq_o) );
  DFFARX1_HVT \counter/cnt_n_reg[9]  ( .D(\counter/N35 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[9]) );
  DFFARX1_HVT \counter/pit_o_reg  ( .D(\counter/N50 ), .CLK(wb_clk_i), .RSTB(
        n327), .Q(pit_o) );
  DFFARX1_HVT \counter/cnt_n_reg[15]  ( .D(\counter/N41 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[15]) );
  DFFARX1_HVT \counter/cnt_n_reg[14]  ( .D(\counter/N40 ), .CLK(
        \counter/net1960 ), .RSTB(async_rst_b), .Q(cnt_n[14]) );
  DFFARX1_HVT \counter/cnt_n_reg[13]  ( .D(\counter/N39 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[13]) );
  DFFARX1_HVT \counter/cnt_n_reg[12]  ( .D(\counter/N38 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[12]) );
  DFFARX1_LVT \regs/pit_pre_reg[0]  ( .D(n350), .CLK(\regs/net1989 ), .RSTB(
        async_rst_b), .Q(pit_pre_scl[0]), .QN(n322) );
  DFFARX1_LVT \counter/cnt_n_reg[3]  ( .D(\counter/N29 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[3]) );
  DFFARX1_LVT \regs/mod_value_reg[1]  ( .D(n342), .CLK(\regs/net1978 ), .RSTB(
        async_rst_b), .Q(mod_value[1]) );
  DFFARX1_LVT \prescale/cnt_n_reg[1]  ( .D(n339), .CLK(wb_clk_i), .RSTB(
        async_rst_b), .Q(\prescale/cnt_n [1]) );
  DFFARX1_LVT \prescale/cnt_n_reg[8]  ( .D(\prescale/N60 ), .CLK(wb_clk_i), 
        .RSTB(async_rst_b), .Q(\prescale/cnt_n [8]) );
  DFFARX1_LVT \regs/pit_slave_reg  ( .D(n343), .CLK(\regs/net1989 ), .RSTB(
        async_rst_b), .Q(pit_slave) );
  DFFARX1_LVT \regs/pit_pre_reg[1]  ( .D(n349), .CLK(\regs/net1989 ), .RSTB(
        async_rst_b), .Q(pit_pre_scl[1]), .QN(n312) );
  DFFARX1_LVT \prescale/cnt_n_reg[4]  ( .D(\prescale/N56 ), .CLK(wb_clk_i), 
        .RSTB(async_rst_b), .Q(\prescale/cnt_n [4]) );
  DFFASX1_LVT \prescale/cnt_n_reg[0]  ( .D(n328), .CLK(wb_clk_i), .SETB(n327), 
        .Q(\prescale/cnt_n [0]), .QN(n311) );
  DFFARX1_LVT \regs/pit_pre_reg[2]  ( .D(n348), .CLK(\regs/net1989 ), .RSTB(
        async_rst_b), .Q(pit_pre_scl[2]), .QN(n323) );
  DFFARX1_LVT \counter/cnt_n_reg[4]  ( .D(\counter/N30 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[4]) );
  DFFARX1_LVT \counter/cnt_n_reg[6]  ( .D(\counter/N32 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[6]) );
  DFFARX1_LVT \counter/cnt_n_reg[7]  ( .D(\counter/N33 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[7]) );
  DFFARX1_HVT \counter/cnt_n_reg[5]  ( .D(\counter/N31 ), .CLK(
        \counter/net1960 ), .RSTB(n327), .Q(cnt_n[5]) );
  AND2X1_HVT U171 ( .A1(n290), .A2(n273), .Y(\counter/N33 ) );
  NAND2X0_HVT U172 ( .A1(n299), .A2(mod_value[14]), .Y(n302) );
  AND2X1_HVT U173 ( .A1(\prescale/cnt_n [10]), .A2(n232), .Y(n206) );
  NAND2X1_HVT U174 ( .A1(pit_pre_scl[1]), .A2(pit_pre_scl[2]), .Y(n171) );
  INVX0_HVT U175 ( .A(n257), .Y(n285) );
  INVX1_HVT U176 ( .A(n305), .Y(n303) );
  INVX1_HVT U177 ( .A(n230), .Y(n231) );
  INVX1_HVT U178 ( .A(n300), .Y(n144) );
  NAND3X0_LVT U179 ( .A1(pit_pre_scl[0]), .A2(n312), .A3(n321), .Y(n149) );
  OR2X1_HVT U180 ( .A1(pit_pre_scl[0]), .A2(n323), .Y(n166) );
  AND2X1_LVT U181 ( .A1(n290), .A2(n275), .Y(\counter/N32 ) );
  AND2X1_LVT U182 ( .A1(n290), .A2(n277), .Y(\counter/N31 ) );
  AND2X1_LVT U183 ( .A1(n290), .A2(n279), .Y(\counter/N30 ) );
  NAND3X0_LVT U184 ( .A1(pit_pre_scl[0]), .A2(pit_pre_scl[2]), .A3(
        pit_pre_scl[1]), .Y(n147) );
  AND2X1_LVT U185 ( .A1(n232), .A2(\prescale/cnt_n [4]), .Y(n198) );
  NAND2X0_HVT U186 ( .A1(\prescale/cnt_n [4]), .A2(n313), .Y(n176) );
  NAND2X0_HVT U187 ( .A1(n166), .A2(n312), .Y(n152) );
  OA22X1_LVT U188 ( .A1(n312), .A2(n185), .A3(n323), .A4(n149), .Y(n150) );
  NAND2X0_LVT U189 ( .A1(pit_slave), .A2(n231), .Y(n308) );
  NAND2X0_HVT U190 ( .A1(ext_sync_i), .A2(pit_slave), .Y(n145) );
  NAND2X0_LVT U191 ( .A1(\prescale/cnt_n [8]), .A2(n316), .Y(n153) );
  NAND3X0_LVT U192 ( .A1(n232), .A2(\prescale/cnt_n [1]), .A3(n297), .Y(n192)
         );
  AND2X1_LVT U193 ( .A1(\prescale/cnt_n [2]), .A2(\prescale/cnt_n [1]), .Y(
        n225) );
  XOR2X1_LVT U194 ( .A1(\prescale/cnt_n [1]), .A2(n169), .Y(n175) );
  NOR3X0_LVT U195 ( .A1(mod_value[1]), .A2(mod_value[15]), .A3(mod_value[14]), 
        .Y(n236) );
  HADDX1_LVT U196 ( .A0(n280), .B0(cnt_n[3]), .C1(n278), .SO(n281) );
  AO21X1_LVT U197 ( .A1(n310), .A2(n309), .A3(sync_reset), .Y(\regs/N80 ) );
  AND2X1_LVT U198 ( .A1(wb_ack_o), .A2(wb_we_i), .Y(n310) );
  HADDX1_LVT U199 ( .A0(n260), .B0(cnt_n[13]), .C1(n287), .SO(n261) );
  HADDX1_LVT U200 ( .A0(n262), .B0(cnt_n[12]), .C1(n260), .SO(n263) );
  XOR2X1_LVT U201 ( .A1(n288), .A2(cnt_n[15]), .Y(n289) );
  HADDX1_LVT U202 ( .A0(n287), .B0(cnt_n[14]), .C1(n288), .SO(n259) );
  AND3X1_LVT U203 ( .A1(n298), .A2(n297), .A3(n296), .Y(\counter/N50 ) );
  AND3X1_HVT U204 ( .A1(\wishbone/module_sel ), .A2(n296), .A3(n319), .Y(
        \wishbone/N26 ) );
  NAND3X0_HVT U205 ( .A1(pit_ien), .A2(cnt_flag_o), .A3(n296), .Y(n143) );
  AND2X1_HVT U206 ( .A1(wb_dat_i[3]), .A2(n296), .Y(\regs/N75 ) );
  AND2X1_HVT U207 ( .A1(wb_dat_i[4]), .A2(n296), .Y(\regs/N76 ) );
  AND2X1_HVT U208 ( .A1(wb_dat_i[6]), .A2(n296), .Y(\regs/N78 ) );
  AND2X1_HVT U209 ( .A1(wb_dat_i[7]), .A2(n296), .Y(\regs/N79 ) );
  AND2X1_HVT U210 ( .A1(wb_dat_i[12]), .A2(n296), .Y(n346) );
  AND2X1_HVT U211 ( .A1(wb_dat_i[13]), .A2(n296), .Y(n345) );
  AND2X1_HVT U212 ( .A1(wb_dat_i[14]), .A2(n296), .Y(n344) );
  AND2X1_HVT U213 ( .A1(wb_dat_i[1]), .A2(n296), .Y(n342) );
  AND2X1_HVT U214 ( .A1(wb_dat_i[15]), .A2(n296), .Y(n343) );
  AND2X1_HVT U215 ( .A1(wb_dat_i[0]), .A2(n296), .Y(\regs/N72 ) );
  AND2X1_HVT U216 ( .A1(wb_dat_i[8]), .A2(n296), .Y(n350) );
  AND2X1_HVT U217 ( .A1(wb_dat_i[9]), .A2(n296), .Y(n349) );
  AND2X1_HVT U218 ( .A1(wb_dat_i[10]), .A2(n296), .Y(n348) );
  AND2X1_HVT U219 ( .A1(wb_dat_i[11]), .A2(n296), .Y(n347) );
  AND2X1_HVT U220 ( .A1(wb_dat_i[2]), .A2(n296), .Y(n341) );
  OR2X1_HVT U221 ( .A1(\prescale/cnt_n [4]), .A2(n322), .Y(n158) );
  AND3X1_LVT U222 ( .A1(n285), .A2(n297), .A3(n295), .Y(n290) );
  AND2X1_HVT U223 ( .A1(\prescale/cnt_n [12]), .A2(n297), .Y(n213) );
  AND2X1_HVT U224 ( .A1(\prescale/cnt_n [3]), .A2(n225), .Y(n227) );
  OR2X1_HVT U225 ( .A1(pit_slave), .A2(n324), .Y(n146) );
  INVX1_HVT U226 ( .A(sync_reset), .Y(n296) );
  AND2X1_HVT U227 ( .A1(\wishbone/module_sel ), .A2(\wishbone/bus_wait_state ), 
        .Y(wb_ack_o) );
  NAND2X0_HVT U228 ( .A1(n300), .A2(cnt_n[14]), .Y(n301) );
  AND2X1_HVT U229 ( .A1(wb_stb_i), .A2(wb_cyc_i), .Y(\wishbone/module_sel ) );
  INVX0_HVT U230 ( .A(n295), .Y(n298) );
  NAND2X0_HVT U231 ( .A1(n325), .A2(n285), .Y(n286) );
  AND2X1_HVT U232 ( .A1(n290), .A2(n284), .Y(\counter/N27 ) );
  AND2X1_HVT U233 ( .A1(n290), .A2(n283), .Y(\counter/N28 ) );
  AND2X1_HVT U234 ( .A1(n290), .A2(n281), .Y(\counter/N29 ) );
  AND2X1_HVT U235 ( .A1(n290), .A2(n263), .Y(\counter/N38 ) );
  AND2X1_HVT U236 ( .A1(n290), .A2(n261), .Y(\counter/N39 ) );
  AND2X1_HVT U237 ( .A1(n290), .A2(n259), .Y(\counter/N40 ) );
  AND2X1_HVT U238 ( .A1(n290), .A2(n289), .Y(\counter/N41 ) );
  NAND2X0_HVT U239 ( .A1(n317), .A2(n311), .Y(n228) );
  INVX0_HVT U240 ( .A(n166), .Y(n170) );
  INVX0_HVT U241 ( .A(n178), .Y(n179) );
  INVX0_HVT U242 ( .A(n219), .Y(n221) );
  XOR2X1_LVT U243 ( .A1(n196), .A2(n195), .Y(n336) );
  AND2X1_HVT U244 ( .A1(wb_dat_i[5]), .A2(n296), .Y(\regs/N77 ) );
  NOR2X0_HVT U245 ( .A1(\wishbone/address [0]), .A2(\wishbone/address [2]), 
        .Y(n300) );
  NOR2X0_LVT U246 ( .A1(\wishbone/address [1]), .A2(n144), .Y(n305) );
  AO21X1_LVT U247 ( .A1(n310), .A2(n305), .A3(sync_reset), .Y(\regs/N62 ) );
  NAND2X2_LVT U248 ( .A1(n146), .A2(n145), .Y(n297) );
  NAND2X0_LVT U249 ( .A1(n321), .A2(n147), .Y(n148) );
  XOR2X1_LVT U250 ( .A1(\prescale/cnt_n [10]), .A2(n148), .Y(n162) );
  OR3X1_LVT U251 ( .A1(pit_pre_scl[2]), .A2(pit_pre_scl[0]), .A3(
        pit_pre_scl[3]), .Y(n185) );
  XOR2X1_LVT U252 ( .A1(\prescale/cnt_n [2]), .A2(n150), .Y(n157) );
  OR3X1_LVT U253 ( .A1(pit_pre_scl[2]), .A2(pit_pre_scl[3]), .A3(n322), .Y(
        n168) );
  NAND3X0_LVT U254 ( .A1(pit_pre_scl[1]), .A2(n316), .A3(n168), .Y(n151) );
  AO21X1_LVT U255 ( .A1(n152), .A2(n151), .A3(n317), .Y(n156) );
  NAND3X0_LVT U256 ( .A1(\prescale/cnt_n [9]), .A2(\prescale/cnt_n [11]), .A3(
        n317), .Y(n154) );
  AOI22X1_LVT U257 ( .A1(\prescale/cnt_n [14]), .A2(n154), .A3(
        \prescale/cnt_n [13]), .A4(n153), .Y(n155) );
  NAND3X0_LVT U258 ( .A1(n157), .A2(n156), .A3(n155), .Y(n161) );
  NAND3X0_LVT U259 ( .A1(\prescale/cnt_n [9]), .A2(n158), .A3(n314), .Y(n159)
         );
  OA21X1_LVT U260 ( .A1(\prescale/cnt_n [7]), .A2(\prescale/cnt_n [8]), .A3(
        n159), .Y(n160) );
  NOR4X1_LVT U261 ( .A1(\prescale/cnt_n [12]), .A2(n162), .A3(n161), .A4(n160), 
        .Y(n184) );
  XOR2X1_LVT U262 ( .A1(pit_pre_scl[0]), .A2(pit_pre_scl[1]), .Y(n163) );
  NAND2X0_LVT U263 ( .A1(pit_pre_scl[2]), .A2(n163), .Y(n178) );
  AND2X1_LVT U264 ( .A1(n321), .A2(n178), .Y(n164) );
  XOR2X1_LVT U265 ( .A1(\prescale/cnt_n [5]), .A2(n164), .Y(n183) );
  NAND2X0_LVT U266 ( .A1(pit_pre_scl[1]), .A2(n317), .Y(n165) );
  OA22X1_LVT U267 ( .A1(pit_pre_scl[3]), .A2(n315), .A3(n168), .A4(n165), .Y(
        n177) );
  NAND2X0_LVT U268 ( .A1(n170), .A2(n321), .Y(n167) );
  AO21X1_LVT U269 ( .A1(n168), .A2(n167), .A3(pit_pre_scl[1]), .Y(n169) );
  AOI22X1_LVT U270 ( .A1(\prescale/cnt_n [9]), .A2(n171), .A3(n170), .A4(n317), 
        .Y(n173) );
  OA21X1_LVT U271 ( .A1(\prescale/cnt_n [8]), .A2(n171), .A3(n321), .Y(n172)
         );
  AO21X1_LVT U272 ( .A1(n173), .A2(n172), .A3(\prescale/cnt_n [14]), .Y(n174)
         );
  AND4X1_LVT U273 ( .A1(n177), .A2(n176), .A3(n175), .A4(n174), .Y(n182) );
  NAND2X0_LVT U274 ( .A1(n321), .A2(n179), .Y(n180) );
  XOR2X1_LVT U275 ( .A1(n180), .A2(\prescale/cnt_n [6]), .Y(n181) );
  AND4X1_LVT U276 ( .A1(n184), .A2(n183), .A3(n182), .A4(n181), .Y(n187) );
  OR2X1_LVT U277 ( .A1(pit_pre_scl[1]), .A2(n185), .Y(n230) );
  XOR2X1_LVT U278 ( .A1(\prescale/cnt_n [0]), .A2(n230), .Y(n186) );
  NAND2X0_LVT U279 ( .A1(n187), .A2(n186), .Y(n232) );
  AND2X1_LVT U280 ( .A1(\prescale/cnt_n [5]), .A2(n232), .Y(n193) );
  AND2X1_LVT U281 ( .A1(n297), .A2(n193), .Y(n197) );
  AND2X1_LVT U282 ( .A1(\prescale/cnt_n [0]), .A2(n232), .Y(n202) );
  AND2X1_LVT U283 ( .A1(n227), .A2(n202), .Y(n190) );
  AND2X1_LVT U284 ( .A1(n198), .A2(n297), .Y(n189) );
  AND2X1_LVT U285 ( .A1(n190), .A2(n189), .Y(n188) );
  XOR2X1_LVT U286 ( .A1(n197), .A2(n188), .Y(n337) );
  AND2X1_LVT U287 ( .A1(n297), .A2(n190), .Y(n194) );
  XOR2X1_LVT U288 ( .A1(n189), .A2(n194), .Y(\prescale/N56 ) );
  AND2X1_LVT U289 ( .A1(\prescale/cnt_n [8]), .A2(n232), .Y(n220) );
  AND2X1_LVT U290 ( .A1(n297), .A2(n220), .Y(n205) );
  AND2X1_LVT U291 ( .A1(\prescale/cnt_n [6]), .A2(n190), .Y(n199) );
  AND4X1_LVT U292 ( .A1(n199), .A2(\prescale/cnt_n [5]), .A3(
        \prescale/cnt_n [4]), .A4(\prescale/cnt_n [7]), .Y(n222) );
  AND2X1_LVT U293 ( .A1(n297), .A2(n222), .Y(n209) );
  XOR2X1_LVT U294 ( .A1(n205), .A2(n209), .Y(\prescale/N60 ) );
  AND4X1_LVT U295 ( .A1(n206), .A2(\prescale/cnt_n [9]), .A3(
        \prescale/cnt_n [8]), .A4(\prescale/cnt_n [11]), .Y(n212) );
  AND2X1_LVT U296 ( .A1(n297), .A2(n212), .Y(n216) );
  AND2X1_LVT U297 ( .A1(n216), .A2(n222), .Y(n191) );
  XOR2X1_LVT U298 ( .A1(n213), .A2(n191), .Y(n331) );
  NAND2X0_LVT U299 ( .A1(n202), .A2(n297), .Y(n328) );
  XOR2X1_LVT U300 ( .A1(n328), .A2(n192), .Y(n339) );
  NAND3X0_LVT U301 ( .A1(n194), .A2(n193), .A3(n198), .Y(n196) );
  NAND3X0_LVT U302 ( .A1(n232), .A2(\prescale/cnt_n [6]), .A3(n297), .Y(n195)
         );
  NAND3X0_LVT U303 ( .A1(n199), .A2(n198), .A3(n197), .Y(n201) );
  NAND3X0_LVT U304 ( .A1(n232), .A2(\prescale/cnt_n [7]), .A3(n297), .Y(n200)
         );
  XOR2X1_LVT U305 ( .A1(n201), .A2(n200), .Y(n335) );
  AND2X1_LVT U306 ( .A1(n297), .A2(n232), .Y(n306) );
  NAND3X0_LVT U307 ( .A1(n202), .A2(n306), .A3(\prescale/cnt_n [1]), .Y(n204)
         );
  NAND3X0_LVT U308 ( .A1(n232), .A2(\prescale/cnt_n [2]), .A3(n297), .Y(n203)
         );
  XOR2X1_LVT U309 ( .A1(n204), .A2(n203), .Y(n338) );
  AND2X1_LVT U310 ( .A1(n232), .A2(\prescale/cnt_n [9]), .Y(n210) );
  NAND3X0_LVT U311 ( .A1(n222), .A2(n210), .A3(n205), .Y(n208) );
  NAND2X0_LVT U312 ( .A1(n206), .A2(n297), .Y(n207) );
  XOR2X1_LVT U313 ( .A1(n208), .A2(n207), .Y(n333) );
  NAND2X0_LVT U314 ( .A1(n209), .A2(n220), .Y(n211) );
  NAND2X0_LVT U315 ( .A1(n210), .A2(n297), .Y(n219) );
  XOR2X1_LVT U316 ( .A1(n211), .A2(n219), .Y(n334) );
  NAND3X0_LVT U317 ( .A1(n222), .A2(n213), .A3(n212), .Y(n215) );
  NAND3X0_LVT U318 ( .A1(n232), .A2(\prescale/cnt_n [13]), .A3(n297), .Y(n214)
         );
  XOR2X1_LVT U319 ( .A1(n215), .A2(n214), .Y(n330) );
  NAND4X0_LVT U320 ( .A1(n222), .A2(\prescale/cnt_n [12]), .A3(n216), .A4(
        \prescale/cnt_n [13]), .Y(n218) );
  NAND3X0_LVT U321 ( .A1(n232), .A2(\prescale/cnt_n [14]), .A3(n297), .Y(n217)
         );
  XOR2X1_LVT U322 ( .A1(n218), .A2(n217), .Y(n329) );
  NAND4X0_LVT U323 ( .A1(n222), .A2(n221), .A3(n220), .A4(\prescale/cnt_n [10]), .Y(n224) );
  NAND3X0_LVT U324 ( .A1(n232), .A2(\prescale/cnt_n [11]), .A3(n297), .Y(n223)
         );
  XOR2X1_LVT U325 ( .A1(n224), .A2(n223), .Y(n332) );
  NBUFFX4_HVT U326 ( .A(async_rst_b), .Y(n327) );
  INVX0_HVT U327 ( .A(n225), .Y(n226) );
  AOI22X1_LVT U328 ( .A1(n227), .A2(\prescale/cnt_n [0]), .A3(n317), .A4(n226), 
        .Y(n229) );
  AND3X1_LVT U329 ( .A1(n229), .A2(n228), .A3(n306), .Y(\prescale/N55 ) );
  AND2X1_LVT U330 ( .A1(n232), .A2(n308), .Y(n257) );
  NOR4X1_LVT U331 ( .A1(mod_value[13]), .A2(mod_value[12]), .A3(mod_value[11]), 
        .A4(mod_value[10]), .Y(n235) );
  NOR4X1_LVT U332 ( .A1(mod_value[9]), .A2(mod_value[8]), .A3(mod_value[7]), 
        .A4(mod_value[6]), .Y(n234) );
  NOR4X1_LVT U333 ( .A1(mod_value[5]), .A2(mod_value[4]), .A3(mod_value[3]), 
        .A4(mod_value[2]), .Y(n233) );
  NAND4X0_LVT U334 ( .A1(n236), .A2(n235), .A3(n234), .A4(n233), .Y(n307) );
  XOR2X1_LVT U335 ( .A1(cnt_n[14]), .A2(mod_value[14]), .Y(n244) );
  XOR2X1_LVT U336 ( .A1(cnt_n[1]), .A2(mod_value[1]), .Y(n243) );
  XOR2X1_LVT U337 ( .A1(mod_value[15]), .A2(cnt_n[15]), .Y(n242) );
  XOR2X1_LVT U338 ( .A1(cnt_n[3]), .A2(mod_value[3]), .Y(n240) );
  XOR2X1_LVT U339 ( .A1(cnt_n[2]), .A2(mod_value[2]), .Y(n239) );
  XOR2X1_LVT U340 ( .A1(cnt_n[5]), .A2(mod_value[5]), .Y(n238) );
  XOR2X1_LVT U341 ( .A1(cnt_n[4]), .A2(mod_value[4]), .Y(n237) );
  OR4X1_LVT U342 ( .A1(n240), .A2(n239), .A3(n238), .A4(n237), .Y(n241) );
  NOR4X1_LVT U343 ( .A1(n244), .A2(n243), .A3(n242), .A4(n241), .Y(n256) );
  XOR2X1_LVT U344 ( .A1(cnt_n[7]), .A2(mod_value[7]), .Y(n248) );
  XOR2X1_LVT U345 ( .A1(cnt_n[6]), .A2(mod_value[6]), .Y(n247) );
  XOR2X1_LVT U346 ( .A1(cnt_n[9]), .A2(mod_value[9]), .Y(n246) );
  XOR2X1_LVT U347 ( .A1(cnt_n[8]), .A2(mod_value[8]), .Y(n245) );
  NOR4X1_LVT U348 ( .A1(n248), .A2(n247), .A3(n246), .A4(n245), .Y(n255) );
  XOR2X1_LVT U349 ( .A1(cnt_n[11]), .A2(mod_value[11]), .Y(n252) );
  XOR2X1_LVT U350 ( .A1(cnt_n[10]), .A2(mod_value[10]), .Y(n251) );
  XOR2X1_LVT U351 ( .A1(cnt_n[13]), .A2(mod_value[13]), .Y(n250) );
  XOR2X1_LVT U352 ( .A1(cnt_n[12]), .A2(mod_value[12]), .Y(n249) );
  NOR4X1_LVT U353 ( .A1(n252), .A2(n251), .A3(n250), .A4(n249), .Y(n254) );
  XOR2X1_LVT U354 ( .A1(cnt_n[0]), .A2(n318), .Y(n253) );
  NAND4X0_LVT U355 ( .A1(n256), .A2(n255), .A3(n254), .A4(n253), .Y(n258) );
  AO21X1_LVT U356 ( .A1(n307), .A2(n258), .A3(n257), .Y(n295) );
  HADDX1_LVT U357 ( .A0(n264), .B0(cnt_n[11]), .C1(n262), .SO(n265) );
  AND2X1_LVT U358 ( .A1(n290), .A2(n265), .Y(\counter/N37 ) );
  HADDX1_LVT U359 ( .A0(n266), .B0(cnt_n[10]), .C1(n264), .SO(n267) );
  AND2X1_LVT U360 ( .A1(n290), .A2(n267), .Y(\counter/N36 ) );
  HADDX1_LVT U361 ( .A0(n268), .B0(cnt_n[9]), .C1(n266), .SO(n269) );
  AND2X1_LVT U362 ( .A1(n290), .A2(n269), .Y(\counter/N35 ) );
  HADDX1_LVT U363 ( .A0(n270), .B0(cnt_n[8]), .C1(n268), .SO(n271) );
  AND2X1_LVT U364 ( .A1(n290), .A2(n271), .Y(\counter/N34 ) );
  HADDX1_LVT U365 ( .A0(n272), .B0(cnt_n[7]), .C1(n270), .SO(n273) );
  HADDX1_LVT U366 ( .A0(n274), .B0(cnt_n[6]), .C1(n272), .SO(n275) );
  HADDX1_LVT U367 ( .A0(n276), .B0(cnt_n[5]), .C1(n274), .SO(n277) );
  HADDX1_LVT U368 ( .A0(n278), .B0(cnt_n[4]), .C1(n276), .SO(n279) );
  HADDX1_HVT U369 ( .A0(n282), .B0(cnt_n[2]), .C1(n280), .SO(n283) );
  HADDX1_HVT U370 ( .A0(cnt_n[0]), .B0(cnt_n[1]), .C1(n282), .SO(n284) );
  NAND4X0_LVT U371 ( .A1(n295), .A2(n286), .A3(n307), .A4(n297), .Y(
        \counter/N26 ) );
  NOR2X0_HVT U372 ( .A1(\wishbone/address [2]), .A2(\wishbone/address [1]), 
        .Y(n299) );
  AND2X2_LVT U373 ( .A1(n299), .A2(\wishbone/address [0]), .Y(n309) );
  AND2X1_LVT U374 ( .A1(n309), .A2(pit_flg_clr), .Y(n292) );
  INVX0_HVT U375 ( .A(\regs/N62 ), .Y(n291) );
  AO22X1_LVT U376 ( .A1(n305), .A2(n341), .A3(n292), .A4(n291), .Y(n293) );
  AND2X1_LVT U377 ( .A1(n310), .A2(n293), .Y(n122) );
  NAND2X0_LVT U378 ( .A1(n326), .A2(n295), .Y(n294) );
  AND3X1_LVT U379 ( .A1(n294), .A2(n297), .A3(n320), .Y(n125) );
  AND2X1_LVT U380 ( .A1(n300), .A2(\wishbone/address [1]), .Y(n304) );
  AO222X1_LVT U381 ( .A1(mod_value[0]), .A2(n309), .A3(cnt_sync_o), .A4(n305), 
        .A5(n304), .A6(cnt_n[0]), .Y(wb_dat_o[0]) );
  AO222X1_LVT U382 ( .A1(mod_value[1]), .A2(n309), .A3(n304), .A4(cnt_n[1]), 
        .A5(n305), .A6(pit_ien), .Y(wb_dat_o[1]) );
  AO222X1_LVT U383 ( .A1(mod_value[2]), .A2(n309), .A3(n304), .A4(cnt_n[2]), 
        .A5(n305), .A6(cnt_flag_o), .Y(wb_dat_o[2]) );
  AO22X1_LVT U384 ( .A1(mod_value[3]), .A2(n309), .A3(cnt_n[3]), .A4(n304), 
        .Y(wb_dat_o[3]) );
  AO22X1_LVT U385 ( .A1(mod_value[4]), .A2(n309), .A3(cnt_n[4]), .A4(n304), 
        .Y(wb_dat_o[4]) );
  AO22X1_LVT U386 ( .A1(mod_value[5]), .A2(n309), .A3(cnt_n[5]), .A4(n304), 
        .Y(wb_dat_o[5]) );
  AO22X1_LVT U387 ( .A1(mod_value[6]), .A2(n309), .A3(cnt_n[6]), .A4(n304), 
        .Y(wb_dat_o[6]) );
  AO22X1_LVT U388 ( .A1(mod_value[7]), .A2(n309), .A3(cnt_n[7]), .A4(n304), 
        .Y(wb_dat_o[7]) );
  AO222X1_LVT U389 ( .A1(pit_pre_scl[0]), .A2(n305), .A3(cnt_n[8]), .A4(n304), 
        .A5(mod_value[8]), .A6(n309), .Y(wb_dat_o[8]) );
  AO222X1_LVT U390 ( .A1(pit_pre_scl[1]), .A2(n305), .A3(cnt_n[9]), .A4(n304), 
        .A5(mod_value[9]), .A6(n309), .Y(wb_dat_o[9]) );
  AO222X1_LVT U391 ( .A1(pit_pre_scl[2]), .A2(n305), .A3(cnt_n[10]), .A4(n304), 
        .A5(mod_value[10]), .A6(n309), .Y(wb_dat_o[10]) );
  AO222X1_LVT U392 ( .A1(pit_pre_scl[3]), .A2(n305), .A3(cnt_n[11]), .A4(n304), 
        .A5(mod_value[11]), .A6(n309), .Y(wb_dat_o[11]) );
  AO22X1_LVT U393 ( .A1(mod_value[12]), .A2(n309), .A3(cnt_n[12]), .A4(n304), 
        .Y(wb_dat_o[12]) );
  AO22X1_LVT U394 ( .A1(mod_value[13]), .A2(n309), .A3(cnt_n[13]), .A4(n304), 
        .Y(wb_dat_o[13]) );
  NAND3X0_LVT U395 ( .A1(n303), .A2(n302), .A3(n301), .Y(wb_dat_o[14]) );
  AO222X1_LVT U396 ( .A1(pit_slave), .A2(n305), .A3(cnt_n[15]), .A4(n304), 
        .A5(mod_value[15]), .A6(n309), .Y(wb_dat_o[15]) );
  NAND3X0_LVT U397 ( .A1(n308), .A2(n307), .A3(n306), .Y(\counter/N25 ) );
endmodule

