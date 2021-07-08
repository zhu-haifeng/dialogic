`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 23:43:58
// Design Name: 
// Module Name: divider
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


module divider4Hz(
    input rst_n_i,//“Ï≤Ω∏¥Œª
    input clk_i,//100MHz
    output reg clk_o
    );
    
    reg [28:0] cnt= 0;;
    //wire rst = !rst_n_i;
    wire rst = !rst_n_i;
    
    always @(posedge clk_i or posedge rst) begin
        if (rst == 1'b1)
            cnt <= 8'b0;
        else
//            cnt <= (cnt >= 'd25000) ? 'h0 : cnt + 'h1;
//        clk_o <= rst_n_i & (cnt < 'd12500);
            cnt <= (cnt >= 'd25000000) ? 'h0 : cnt + 'h1;
        clk_o <= rst_n_i & (cnt < 'd12500000);
    end
    

    
endmodule
