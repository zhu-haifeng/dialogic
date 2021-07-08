`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 21:04:52
// Design Name: 
// Module Name: state2_rand
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


module state2_rand(

    );
        divider1Hz u_divider1Hz_1(
    .rst_n_i (neverReset),
    .clk_i  (clk_i),
    .clk_o  (clk_1Hz)
    );
endmodule
