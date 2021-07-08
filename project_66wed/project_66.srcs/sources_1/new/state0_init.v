`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/29 18:57:26
// Design Name: 
// Module Name: state0_init
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


module state0_init(
    input en,
    output reg [3:0]data1,
    output reg [3:0]data2,
    output reg [3:0]data3,
    output reg [3:0]data4,
    output reg [3:0]data5,
    output reg [3:0]data6,
    output reg [3:0]data7,
    output reg [3:0] data8
    );
    always@(en)
        if(en) begin
            data1 <= 'hc;
            data2 <= 'hc;
            data3 <= 'hc;
            data3 <= 'hc;
            data4 <= 'hc;
            data5 <= 'hc;
            data6 <= 'hc;
            data7 <= 'hc;
            data8 <= 'hc;
        end
        else begin
            data1 <= 'he;
            data2 <= 'he;
            data3 <= 'he;
            data3 <= 'he;
            data4 <= 'he;
            data5 <= 'he;
            data6 <= 'he;
            data7 <= 'he;
            data8 <= 'he;
        end
endmodule
