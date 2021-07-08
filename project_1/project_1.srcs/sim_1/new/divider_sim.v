`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/09 00:10:07
// Design Name: 
// Module Name: divider_sim
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


module divider_sim(  
    );
    reg clk = 0;
    reg rst_n_i = 0;
    wire clk_o;
    
    divider u_divider_sim(
    .rst_n_i    (rst_n_i),
    .clk_i      (clk),
    .clk_o      (clk_o)
    );
    always #1 clk = !clk;
    initial begin
    #1 rst_n_i <= 1;
    end
endmodule
