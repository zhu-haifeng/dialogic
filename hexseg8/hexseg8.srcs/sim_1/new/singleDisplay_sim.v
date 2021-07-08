`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 11:23:42
// Design Name: 
// Module Name: singleDisplay_sim
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


module singleDisplay_sim(

    );
    reg [3:0]data_i = 0;
    wire [6:0]led_o;
    //reg en = 1;
    singleDisplay uut_singleDisplay_1(
    //.en (en),
    .data (data_i),
    .led (led_o)
    );
    always #1 data_i <= data_i +1;
    always #22 en <=~en;
    initial begin
    end
endmodule
