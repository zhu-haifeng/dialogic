`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 19:44:46
// Design Name: 
// Module Name: topDesign_sim
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


module topDesign_sim(

    );
    reg clk_i = 0;
    reg S1 = 0,
        S2 = 0,
        S3 = 0,
        S4 = 0,
        S0 = 0;
    reg [7:0]sw_i;
    wire [6:0]led_o_l,led_o_r;
    wire [7:0] en_seg;
    
    
    topDesign U_topDesign_sim1(
    .clk_i  (clk_i),
    .S4     (S4),
    .S3     (S3),
    .S2     (S2),
    .S1     (S1),
    .S0     (S0),
    .sw_i   (sw_i),
    .led_o_l(led_o_l),
    .led_o_r(led_o_r),
    .en_seg (en_seg)
    );
    always #1 clk_i = ~clk_i;
    initial begin
    #100 S0 = 1;
    #10 S0 = 0;
    #1000 S1 = 1;
    #10 S1 = 0;
    sw_i[7:0] = 8'b00000011;
    #100 S2 = 1;
    #10 S2 = 0;
    #10 sw_i[7:0] = 8'b00000111;
    #1 S3 = 1;#1 S3=0;
    #10 sw_i[7:0] = 8'b00000111;
    #1 S3 = 1;#1 S3=0;    
    #10 sw_i[7:0] = 8'b00000011;

    #1 S3 = 1;#1 S3=0;
    #1 sw_i[7:0] = 8'b00000101;
    #1 S3 = 1;#1 S3=0;
    #1 sw_i[7:0] = 8'b00000010;
    #1 S3 = 1;#1 S3=0;
    #1 sw_i[7:0] = 8'b00000101;
    #1 S3 = 1;#1 S3=0;
//    #10000 S4 = 1;
    
//    #100 S4 = 0;
//    #10000 S0 = 1;
//    #100 S0 = 0;
//    #100 S4 = 1;
    
//    #1 S4 = 0;
    end
endmodule
