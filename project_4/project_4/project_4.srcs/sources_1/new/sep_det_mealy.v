`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/21 11:28:34
// Design Name: 
// Module Name: sep_det_mealy
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


module sep_det_mealy(
    input clk_i,rst_n_i,
    input set_i,
    input [7:0]data_i,
    output reg detect_o
    );
    localparam[2:0]
        s0 = 3'b000,
        s1 = 3'b001,
        s2 = 3'b010,
        s3 = 3'b011,
        s4 = 3'b100;
    reg[2:0]cs=0,
            nst=0,
            i=0;
    wire rst = rst_n_i;
    reg rdata;
    always@(posedge clk_i or posedge rst)begin
        if(rst || ~set_i)begin
            i <= 'b111;
//            cs <=s0;
        end
        else if(set_i && i>'b000)begin
             i <= i-1;
            rdata <= data_i[i];
//            cs <= nst;
        end
        else begin
            i <= i;
//            cs <= nst;
        end
    end
    always@(posedge rst or posedge clk_i) begin
            if(rst||!set_i)
                cs <= s0;
            else 
                cs <= nst;
    end
    
    always@(cs or rdata or rst or set_i)begin
        if(rst)
            nst <= s0;
        else if(set_i)
            case(cs)
            
                s0:begin
                    if(rdata == 'b0)nst = s1;
                    else nst <= s0;
                    detect_o <='b0;
                    end
                    
                s1:begin                   
                    if(rdata == 'b1)nst = s2;
                    else nst <= s1;
                    detect_o <='b0;
                    end
                    
                s2:begin                   
                    if(rdata =='b0)nst = s3;
                    else nst <= s0;
                    detect_o <='b0;
                    end
                    
                s3:begin                   
                    if(rdata =='b1)begin
                        nst <= s4;
                        detect_o <='b1;
                        end
                    else begin
                        nst <= s1;
                        detect_o <='b0;
                        end
                    end
                s4://begin
//                    if(rdata =='b1)begin
//                        nst = s4;
//                        detect_o <=
                    nst <= s4;
                default:
                    nst <= s0;
            endcase
        end

                

endmodule
