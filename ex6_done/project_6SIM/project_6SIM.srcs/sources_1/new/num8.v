`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/30 11:08:10
// Design Name: 
// Module Name: num8
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


module num8(

    );
        reg clk=1;
     wire [3:0]num1;
     wire [3:0]num2;
     wire [3:0]num3;
     wire [3:0]num4;
      wire [3:0]num5;
    randNum U_1(
    .clk    (clk),
    .Y      (num1)
    );
    randNum U_2(
    .clk    (clk),
    .Y      (num2)
    );
    randNum U_3(
    .clk    (clk),
    .Y      (num4)
    );
    randNum U_4(
    .clk    (clk),
    .Y      (num4)
    );
    randNum U_5(
    .clk    (clk),
    .Y      (num5)
    );
    always #1 clk = ~clk    ;
    initial begin


    end
    
endmodule
