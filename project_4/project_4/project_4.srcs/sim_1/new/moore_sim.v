`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/18 13:19:56
// Design Name: 
// Module Name: mealy_sim
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


module moore_sim(

    );
    reg clk = 0;
    reg rst_n_i = 1;
    reg set_i = 1;
    reg [7:0]data ='b11011111;
    wire detect;
    moore uut_moore_1(
    .clk_i  (clk),
    .rst_n_i(rst_n_i),
    .set_i  (set_i),
    .data_i (data),
    .detect_o(detect)
    );
    always#1 clk = ~clk;
//    always#50 data = data * 'b10;
//    always begin #5 rst_n_i = 0;
//    #45 rst_n_i = 1;

    always begin #45 set_i = 0;
    #5 set_i = 1;
    end
    initial begin
//        #50 data = 00101111;
        #2 rst_n_i = 0;
        #23 data = 'b11011111;
        
        #25 data = 'b01010111;
    end
        
endmodule
