set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P17 } [get_ports clk_i]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R15 } [get_ports rst_n_i]

set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN U4 } [get_ports set_i]


set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P5 } [get_ports data_i[7]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P4 } [get_ports data_i[6]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P3 } [get_ports data_i[5]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P2 } [get_ports data_i[4]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R2 } [get_ports data_i[3]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN M4 } [get_ports data_i[2]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN N4 } [get_ports data_i[1]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R1 } [get_ports data_i[0]]


set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN K2} [get_ports detect_o]
