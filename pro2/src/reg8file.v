`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/04 11:29:01
// Design Name: 
// Module Name: reg8file
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


module reg8file(
    input clk,  //时钟信号
    input clrn, //异步清零
    input wen,  //使能
    input [7:0] d,  //输入数据
    input [2:0] rsel,   //读选择
    input [2:0] wsel,   //写选择
    output reg [7:0] q
        
    );
    reg [7:0] we_n = 8'b0;
    reg [7:0] array_reg[7:0];

    integer i;
//    for(i=0;i<=7;i=i+1)begin
//         we_n[i] = 1'b1;
//    end



    always@(posedge clk or negedge clrn) begin
        if(clrn == 0)begin
            for(i = 0;i<=7;i=i+1)begin
                array_reg[i] <= 0;
            end
        end
        else begin
            if(wen) begin
                array_reg[wsel] <= d;
            end
            q <= array_reg[rsel];
        end
    end
        
endmodule    
        
//    always@(wsel) begin//译码器
//        we_n[wsel] <= 1'b1;
//    end
//    always@(posedge clk or negedge clrn) begin
//        if(clrn ==1'b0)
//            r = 8'b00000000;
//        for(i=0;i<=7;i=i+1) begin
//            if(we_n[i] &&  d)
//                r[i] = 1'b1;
////        q <= r[rsel];
//        end
//     end  
//    always@(rsel) begin
//        q <= r[rsel];
//    end
        
    
    
    
    
    
    

