`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 22:55:32
// Design Name: 
// Module Name: counter_mod_99
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


module counter_mod_99
#(parameter N = 7)

(
    input clr,  //异步清零
    input en,   //使能
    input updown,
    input ld,   //同步有效时载入data数据改变计数制式
    input [N-1:0]data,
    input mode, //模式
    output q[N-1:0]
    );
    reg [N-1:0] regN;
    always @(posedge clk or posedge clr) begin
        if(clr)
            regN <=0;
        else if(ld)
            regN <=data;
        else if(En ==0);
        else if(!updown && !mode)//向下计数
                if(regN == 0)
                    regN <= 7'b1100010;
                else
                    regN = regN - 1;
        else
            if(regN == 7'b01100010)
                regN <= 0;
            else
                regN = regN + 1;
    end 
    assign q = regN; 
                
    
endmodule
