`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/11 10:49:50
// Design Name: 
// Module Name: singleDisplay
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


module singleDisplay(
//    input en,
    input [3:0] data,
    output reg[6:0] led
    );
    always@(*) begin
//        if(en)
            case(data)   
                  4'b0000: led = 7'b1111110;  //0  
                  4'b0001: led = 7'b0110000;  //1  
                  4'b0010: led = 7'b1101101;  //2  
                  4'b0011: led = 7'b1111001;    //3  
                  4'b0100: led = 7'b0110011;  //4  
                  4'b0101: led = 7'b1011011;  //5  
                  4'b0110: led = 7'b1011111;  //6  
                  4'b0111: led = 7'b1110000;  //7  
                  4'b1000: led = 7'b1111111;    //8  
                  4'b1001: led = 7'b1111011;  //9  
                  4'b1010: led = 7'b1110111;  //A  
                  4'b1011: led = 7'b0011111;  //b
                  4'b1100: led = 7'b0001101;  //c  
                  4'b1101: led = 7'b0111101;  //d
                  4'b1110: led = 7'b1001111;  //e  
                  default: led = 7'b1000111;  //F
               endcase  
//        else
//            led = 7'b0000000;
        end
endmodule
