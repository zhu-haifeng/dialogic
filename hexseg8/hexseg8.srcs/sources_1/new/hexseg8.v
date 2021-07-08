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
    input rst_n_i,
    input clk_i,
    input [7:0]sw_i,
    output reg[6:0]led_o_l,
    output reg[6:0]led_o_r,
    output reg [7:0]en,
    output reg dot
    );
    
//    reg [7:0]en = 8'b00000000;
    
    wire[6:0]led_1,led_2,led_3,led_4,led_5,led_6,led_7,led_8;
    reg [3:0] data1='b0001;
    reg [3:0] data2='h0000;
    reg [3:0] data3;
    reg [3:0] data4;
    reg [3:0] data5 = 'd0;
    reg [3:0] data6 = 'd7;
    reg [3:0] data7 = 'd1;
    reg [3:0] data8 = 'd6;
    wire clk_o,clk_2Hz;
//    reg clk_i;
    reg [1:0]count = 2'b00;
    integer i;
    
//    data5 <= 'b0;
//    data6 <= 'h7;
//    data7 <= 'h1;
//    data8 <= 'h6;
    
    reg rst_n_i_clk ='b1;
    divider u_divider_1(
    .rst_n_i (rst_n_i_clk),
    .clk_i  (clk_i),
    .clk_o  (clk_o)
    );
    divider2Hz u_divider2Hz_1(
    .rst_n_i (rst_n_i_clk),
    .clk_i  (clk_i),
    .clk_o  (clk_2Hz)
    );
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
//        .en  (en[5-1]),
        .data(data5),
        .led (led_5)
    );
    singleDisplay dk6(
//        .en  (en[6-1]),
        .data(data6),
        .led (led_6)
    );
        
    singleDisplay dk7(
//        .en  (en[7-1]),
        .data(data7),
        .led (led_7)
    );    
    singleDisplay dk8(
//        .en  (en[8-1]),
        .data(data8),
        .led (led_8)
    );    
    always@(posedge clk_o) begin
        en = 8'b00000000;
        if(count == 2'b11)
            count ='b00;
        else
            count = count +1;
        
        en[count] <=1;
        en[count + 4] <=1;

        data3 <= sw_i[7:4];
        data4 <= sw_i[3:0];
        case(count)
        'b00:   begin led_o_l <= led_1;led_o_r <= led_5;dot =0;end
        'b01:   begin led_o_l <= led_2;led_o_r <= led_6;dot =1;end
            
        'b10:   begin led_o_l <= led_3;led_o_r <= led_7;dot =0;end
        'b11:   begin led_o_l <= led_4;led_o_r <= led_8;dot =1;end
        endcase
        
    end
    wire rst = rst_n_i;
//    reg [30:0]cnt = 'b0;
    always @(posedge clk_2Hz or posedge rst) begin
        if(rst)begin
            data1 = 'b0001;
            data2 = 'b0000;
            end
        else
        if(data1=='b0001)begin
            data1 <= 'b0000;
            data2 <= 'b1111;           
            end
        else if(data1=='b0000)
            if(data2=='b0000)
                data1<='b0001;
            else
                data2<=data2-1;
        
//        if(data1=='b0000 && data1=='b0000)
//            data2 <= 'b0001;
//        else if(data1=='b0001)begin
//            data1 <= 'b0000;
//            data2 <= 'b1111;           
//            end
//        else
//            data2 = data2 - 'b0010;
    end
    endmodule
