`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 10:41:05
// Design Name: 
// Module Name: hexseg8
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


module hexseg8(
//    input rst_n_i,//没使用
    input clk_i,//晶振输入
    input [3:0]data1,
    input [3:0]data2,
    input [3:0]data3,
    input [3:0]data4,
    input [3:0]data5,
    input [3:0]data6,
    input [3:0]data7,
    input [3:0]data8,
    
    output reg[6:0]led_o_l,
    output reg[6:0]led_o_r,
    output reg [7:0]en
    );
    
    wire[6:0]led_1,led_2,led_3,led_4,led_5,led_6,led_7,led_8;
//    reg [3:0] data1='b0001;
//    reg [3:0] data2='h0000;
//    reg [3:0] data3;
//    reg [3:0] data4;
//    reg [3:0] data5 = 'd0;
//    reg [3:0] data6 = 'd7;
//    reg [3:0] data7 = 'd1;
//    reg [3:0] data8 = 'd6;
    wire clk_o/*clk_1Hz*/;
    reg [1:0]count = 2'b00;
    integer i;
    
    
    reg neverReset ='b1;
    divider u_divider_1(//1000Hz输出
    
    .rst_n_i (neverReset),
    .clk_i  (clk_i),
    .clk_o  (clk_o)
    );
//    divider1Hz u_divider1Hz_1(
//    .rst_n_i (neverReset),
//    .clk_i  (clk_i),
//    .clk_o  (clk_1Hz)
//    );
    singleDisplay dk1(
        .data(data1),
        .led (led_1)
    );
    singleDisplay dk2(
        .data(data2),
        .led (led_2)
    );
    singleDisplay dk3(
        .data(data3),
        .led (led_3)
    );
    singleDisplay dk4(
        .data(data4),
        .led (led_4)
    );
    singleDisplay dk5(
        .data(data5),
        .led (led_5)
    );
    singleDisplay dk6(
        .data(data6),
        .led (led_6)
    );
        
    singleDisplay dk7(
        .data(data7),
        .led (led_7)
    );    
    singleDisplay dk8(
        .data(data8),
        .led (led_8)
    );    
    always@(posedge clk_o) begin
        en = 8'b00000000;
        if(count == 2'b11)
            count ='b00;
        else
            count = count +1;
        
        en[count] =1;
        en[count + 4] =1;

        case(count)
            'b00:   begin led_o_l <= led_1;led_o_r <= led_5;end
            'b01:   begin led_o_l <= led_2;led_o_r <= led_6;end
                
            'b10:   begin led_o_l <= led_3;led_o_r <= led_7;end
            'b11:   begin led_o_l <= led_4;led_o_r <= led_8;end
        endcase
        
    end
//    wire rst = rst_n_i;//没使用

        
    endmodule
