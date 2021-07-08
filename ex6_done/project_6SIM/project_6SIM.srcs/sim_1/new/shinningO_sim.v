`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 20:16:29
// Design Name: 
// Module Name: shinningO_sim
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


module shinningO_sim(

    );
    reg clk_i = 1;
    wire [3:0]shiningO;
    shinningO U_shinningO_1(
    .clk_i  (clk_i),
    .shiningO(shiningO)
    );
    always#1 clk_i = ~clk_i;
endmodule
