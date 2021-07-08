`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 19:49:45
// Design Name: 
// Module Name: shinningO
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


module shinningO(
    input clk_i,
    output reg [3:0] shiningO
    );
    wire clk4Hz;
    reg neverRst = 1;
    divider4Hz U_divider4Hz_1(
    .rst_n_i(neverRst),
    .clk_i  (clk_i),
    .clk_o  (clk4Hz)
    );
    
    always@(posedge clk4Hz)begin
        if(shiningO =='he)
            shiningO = 'h0;
        else
            shiningO = 'he;
    end
endmodule
