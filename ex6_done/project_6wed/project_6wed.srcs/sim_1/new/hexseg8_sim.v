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
    reg [3:0]
        data1,
        data2,
        data3,
        data4,
        data5,
        data6,
        data7,
        data8;
            
//    reg rst_n_i = 0;
    reg [7:0] sw_i = 'b00000000;
    wire [6:0] led_o_l;
    wire [6:0] led_o_r;
    wire [7:0] en;
    wire dot;
    hexseg8 uut_hexseg3_1(
    .clk_i  (clk),
    .data1  (data1),
    .data2  (data2),
    .data3  (data3),
    .data4  (data4),
    .data5  (data5),
    .data6  (data6),
    .data7  (data7),
    .data8  (data8),
    .led_o_l  (led_o_l),
    .led_o_r  (led_o_r),
    .en     (en)
//    .dot    (dot)
    );
    always #1 clk=~clk;
    always #10000000 sw_i = sw_i + 1;
    initial begin
    data1<='b1;
    data2<='d2;
    data3<='d3;
    data4<= 'd4;
    data5<= 'd5;
    data6 <= 'd6;
    data7 <= 'd7;
    data8 <= 'd8;
    
//    #1 rst_n_i <= 1;
    end
    
endmodule
