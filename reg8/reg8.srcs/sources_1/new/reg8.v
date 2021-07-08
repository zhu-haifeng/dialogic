`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 21:59:59
// Design Name: 
// Module Name: reg8
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


module reg8(
    input clk,
    input clrn,
    input wen,
    input [7:0] d,
    output reg [7:0] q
    );
    always@(posedge clk or clrn) begin
        if(clrn == 1'b0)
            q = 8'b0;
        else if(wen == 1'b0)
            q = d;
    end
            
endmodule
