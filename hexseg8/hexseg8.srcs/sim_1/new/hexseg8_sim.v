`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/12 23:39:20
// Design Name: 
// Module Name: hexseg8_sim
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


module hexseg8_sim(

    );
    reg clk=0;
    reg rst_n_i = 0;
    reg [7:0] sw_i = 'b00000000;
    wire [6:0] led_o_l;
    wire [6:0] led_o_r;
    wire [7:0] en;
    wire dot;
    hexseg8 uut_hexseg3_1(
    .rst_n_i (rst_n_i),
    .clk_i  (clk),
    .sw_i   (sw_i),
    .led_o_l  (led_o_l),
    .led_o_r  (led_o_r),
    .en     (en),
    .dot    (dot)
    );
    always #1 clk=~clk;
    always #10000000 sw_i = sw_i + 1;
    initial begin
    #1 rst_n_i <= 1;
    end
    
endmodule
