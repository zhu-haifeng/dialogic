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


module mealy_sim(

    );
    reg clk = 0;
    reg rst_n_i = 1;
    reg set_i = 1;
    reg [7:0]data ='b11011111;
    wire detect;
    sep_det_mealy U_mealy_1(
    .clk_i  (clk),
    .rst_n_i(rst_n_i),
    .set_i  (set_i),
    .data_i (data),
    .detect_o(detect)
    );
    always#1 clk = ~clk;
//    always#50 data = data * 'b10;
//    always begin #5 rst_n_i = 1;
//    #45 rst_n_i = 0;
    always begin #48 set_i = 0;
    #2 set_i = 1;
    end
    initial begin
//        #50 data = 00101111;
        #1 rst_n_i = 0;
//        #50 data = 10101111;
        #29 rst_n_i = 1;
        #1 rst_n_i =0;
        #19 data ='b01010111;
        #20 set_i = 0;
        #2 set_i = 1;
        #28 data =  data *'b10;
   
        #50 data = data *'b10;
    end
        
endmodule
