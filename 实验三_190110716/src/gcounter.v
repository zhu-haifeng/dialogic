`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/12 12:09:58
// Design Name: 
// Module Name: gcounter
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


module gcounter(
    input rst_n_i,
    input clk_i,
    input en_i,
    output reg[3:0] gray_o
    );
    reg[3:0]g =4'b0000;
    reg[3:0]b =4'b0000;
    wire rst = !rst_n_i;
    always@(posedge rst or posedge clk_i) begin
        if(rst)
            b = 4'b0000;
        else if(en_i)begin
            if(b ==4'b1111)
                b  = 4'b0000;
            else            
                b = b + 'b1;
        end
        for(integer i=0;i<=2;i=i+1)begin
            g[i] = b[i] ^ b[i+1];
        end
        g[3] = b[3];
//        assign gray_o = g;
        gray_o <= g;
    end
//    gray_o <= g;
endmodule
