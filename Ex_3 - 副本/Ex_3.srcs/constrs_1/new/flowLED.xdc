set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN R1 } [get_ports rst_n_i]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN P17 } [get_ports clk_i]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN N4 } [get_ports en_i]



set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN K2 } [get_ports led_o[0]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN J2 } [get_ports led_o[1]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN J3 } [get_ports led_o[2]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN H4 } [get_ports led_o[3]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN J4 } [get_ports led_o[4]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN G3 } [get_ports led_o[5]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN G4 } [get_ports led_o[6]]
set_property -dict { IOSTANDARD LVCMOS33 PACKAGE_PIN F6 } [get_ports led_o[7]]