`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 23:44:16
// Design Name: 
// Module Name: flowLED_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module flowLED_top(
    input clk_i,    //100MHz
    input rst_n_i,  //异步复位
    input en_i,     //同步使能
    output[7:0] led_o
    );
    wire clk_1Hz;
    divider u_devider_1(
    .rst_n_i(rst_n_i),
    .clk_i  (clk_i),
    .clk_o  (clk_1Hz)
    );
    flowLED u_flowLED_1(
    .rst_n_i    (rst_n_i),
    .clk_i  (clk_1Hz),
    .en_i   (en_i),
    .led_o  (led_o)
    );
endmodule
