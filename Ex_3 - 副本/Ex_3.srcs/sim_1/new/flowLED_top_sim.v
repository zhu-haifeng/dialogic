`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/09 09:32:22
// Design Name: 
// Module Name: flowLED_top_sim
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


module flowLED_top_sim(

    );
    reg clk = 0;
    reg rst_n_i = 1;
    reg en_i = 1;
    wire [7:0] led_o;
    flowLED uut_flowLED(
    .clk_i  (clk),
    .rst_n_i(rst_n_i),
    .en_i   (en_i),
    .led_o  (led_o)
    );
    always #1 clk = ~clk;
    initial begin
    end
    
    
endmodule
