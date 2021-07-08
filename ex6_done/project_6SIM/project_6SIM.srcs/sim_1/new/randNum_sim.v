`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 09:35:26
// Design Name: 
// Module Name: randNum_sim
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


module randNum_sim(

    );
    reg rst_n = 1;
    reg clk = 1;
    reg load = 1;
    reg [7:0]seed = 8'b11111111;
    wire [3:0] out;
    randNum U_randNum_1(
//    .rst_n  (rst_n),
    .clk    (clk),
//    .load   (load),
//    .seed   (seed),
    .Y      (out)
    );
    always#1 clk = ~clk;
    initial begin
        #10 load = 0;
    end
endmodule
