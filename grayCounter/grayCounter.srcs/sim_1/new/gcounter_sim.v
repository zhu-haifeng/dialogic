`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/12 12:26:22
// Design Name: 
// Module Name: gcounter_sim
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


module gcounter_sim(

    );
    reg rst_n_i=1;
    reg en =1;
    reg clk_i=1;
    wire [3:0] gray;
    
    gcounter uut_gcounter_1(
    .rst_n_i(rst_n_i),
    .clk_i  (clk_i),
    .en_i   (en),
    .gray_o (gray)
    );
    always #10 clk_i <=~clk_i;
//    always #10 en =~en;
//    always #5 rst_n_i =~rst_n_i;
    initial begin
        #55 en =0;
        #50 rst_n_i =0;
        #50 en =1;
        #50 rst_n_i =1;
    end
endmodule
