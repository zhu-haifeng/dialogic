`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 23:44:37
// Design Name: 
// Module Name: flowLED
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


module flowLED(
    input rst_n_i,  //异步复位
    input clk_i,    //1Hz输入
    input en_i,     //同步是能
    output[7:0]led_o//流水灯信号输出
    );
    integer i = 0;
    reg [7:0]led = 8'b0;
    wire rst = !rst_n_i;
    always@(posedge clk_i or posedge rst)   begin
        led = 8'b0;
        if(en_i)    begin
            if(rst) begin
                i = 0;
                //led[0] = 1;
                end
            else begin
                i = (i+1)%8;
                //led[8-i] = 1; 
                end
            led[7-i] = 1; 
            end
    end
    assign led_o = led;
    
endmodule
