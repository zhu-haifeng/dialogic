`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/09 00:09:23
// Design Name: 
// Module Name: flowLED_sim
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


module flowLED_sim(

    );
    reg clk = 0;
    reg rst_n = 1;
    reg en_i = 1;
    wire[7:0] led_o;
    
    flowLED u_flowLED_sim(
    .rst_n_i    (rst_n),
    .clk_i      (clk),
    .en_i       (en_i),
    .led_o      (led_o)
    );
    always #1 clk = ~clk;
    initial begin
    end
    
endmodule
