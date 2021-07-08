`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/18 11:26:52
// Design Name: 
// Module Name: moore
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


module moore(
    input clk_i,
    input rst_n_i,
    input set_i,
    input [7:0]data_i,
    output reg detect_o
    );
    localparam[2:0]
        s0 = 3'b000,
        s1 = 3'b001,
        s2 = 3'b010,
        s3 = 3'b011,
        s4 = 3'b100,
        s5 = 3'b101;
    reg[2:0]cs = 0,
        nst = 0,
        i='b111;//位数
    reg rdata;  //当前位
    wire rst1 = ~rst_n_i;
    wire rst = ~rst1;
//    always@(posedge set_i)
//        begin
////            detect_o <= 0;
//            i <= 'b111;
//            cs <= 'b000;
//            nst <='b000;
//        end
////    always@(posedge clk_i)
////    begin

////            if(i>0)i <=i-1;
////            else i <= 0;
////            rdata <= data_i[i];
////            cs <=nst;

////    end
    
//    always@(posedge rst)
//    begin
//            i = 'b111;
//            nst = 0;
////            cs = s0;


//    end  
    always@(posedge clk_i)begin
        if(!set_i)
            i = 7;
        else if(i>0)
            i = i-1;
        else i = 0;
        rdata = data_i[i];
    end
    always@(posedge clk_i or posedge rst)
        if(rst)
            cs <= 0;
        else
            cs <= nst;

    always@(*)
        begin
//            if(i>0)i =i-1;
//            else i = 0;
//            rdata = data_i[i];
//            cs =nst;
        if (!set_i)
            nst = s0;
        else
            case(cs)
                s0:
                    if(rdata == 1'b0)nst = s1;
                    else nst = s0;
                s1:
                    if(rdata == 1'b1)nst = s2;
                    else nst = s1;
                s2:
                    if(rdata == 1'b0)nst = s3;
                    else nst = s0;
                s3:
                    if(rdata == 1'b1)nst = s4;
                    else nst = s1;
                s4:
                    if(rdata == 1'b1)nst = s5;
                    else nst = s3;
                s5:
                    nst = s5;
                default:nst = s0;
            endcase
        
    end
    always@(cs)
    begin
        if(cs == s5) detect_o = 1'b1;
        else detect_o = 1'b0;
    end
endmodule
