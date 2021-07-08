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


module divider(
    input rst_n_i,//“Ï≤Ω∏¥Œª
    input clk_i,//100MHz
    output clk_o
    );
    
    reg [27:0] cnt;
    //wire rst = !rst_n_i;
    wire rst = !rst_n_i;
    always @(posedge clk_i or posedge rst) begin
        if (rst == 1'b1)
            cnt <= 'h0;
        else
            //cnt <= (cnt >= 'h2000000) ? 'h0 : cnt + 'h1;
            cnt <= (cnt >= 'h5F5E100) ? 'h0 : cnt + 'h1;
    end
    
    //wire clk_div = rst_n_i & (cnt < 'h1000000);
    wire clk_div = rst_n_i & (cnt < 'h2FAF080);
    
    assign clk_o = clk_div;
    
    
endmodule
