#set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets data2_1_reg[0]_i_3_n_0];
#set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets data2_1_reg[0]_i_4_n_0];
#set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets data2_1_reg[0]_i_5_n_0];

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets S0]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets S3]
#时钟
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_i]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets S0]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P17 } [get_ports clk_i]
#按键清零
#set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R11 } [get_ports rst_n_i]
#输入信号
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R1 } [get_ports sw_i[0]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN N4 } [get_ports sw_i[1]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN M4 } [get_ports sw_i[2]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R2 } [get_ports sw_i[3]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P2 } [get_ports sw_i[4]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P3 } [get_ports sw_i[5]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P4 } [get_ports sw_i[6]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P5 } [get_ports sw_i[7]]
#前四位数码管使能
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN G2 } [get_ports en_seg[0]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN C2 } [get_ports en_seg[1]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN C1 } [get_ports en_seg[2]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN H1 } [get_ports en_seg[3]]
#后四位数码管使能
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN G1 } [get_ports en_seg[4]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F1 } [get_ports en_seg[5]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN E1 } [get_ports en_seg[6]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN G6 } [get_ports en_seg[7]]
#
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN B4 } [get_ports led_o_l[6]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN A4 } [get_ports led_o_l[5]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN A3 } [get_ports led_o_l[4]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN B1 } [get_ports led_o_l[3]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN A1 } [get_ports led_o_l[2]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN B3 } [get_ports led_o_l[1]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN B2 } [get_ports led_o_l[0]]

#后四位数码管
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN D4 } [get_ports led_o_r[6]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN E3 } [get_ports led_o_r[5]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN D3 } [get_ports led_o_r[4]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F4 } [get_ports led_o_r[3]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F3 } [get_ports led_o_r[2]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN E2 } [get_ports led_o_r[1]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN D2 } [get_ports led_o_r[0]]

#小数点
#set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN H2 } [get_ports dot]

#按键
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN U4 } [get_ports S4]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN V1 } [get_ports S3]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R15} [get_ports S2]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R17} [get_ports S1]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R11} [get_ports S0]


