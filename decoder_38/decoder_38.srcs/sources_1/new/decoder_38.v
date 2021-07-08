//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/02 22:23:28
// Design Name: 
// Module Name: decoder_38
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


module decoder_38(
    input [2:0] en_i,
    input [2:0] data_i,
    output reg [7:0] data_o
    );
    
    always @(*) begin
        data_o = 8'b00000000;
        if(en_i == 3'b100)
            
            data_o[data_i] = 1;
            

//            case (data_i)
//                3'b000: data_o = 8'b0000_0001;
//                3'b001: data_o = 8'b00000010;
//                3'b010: data_o = 8'b00000100;
//                3'b011: data_o = 8'b00001000;
//                3'b100: data_o = 8'b00010000;
//                3'b101: data_o = 8'b00100000;
//                3'b110: data_o = 8'b01000000;
//                3'b111: data_o = 8'b10000000;
//                //default: data_o = 8'b11111111;
//            endcase 
//        else
//            data_o = 8'b11110000;
    end
endmodule
