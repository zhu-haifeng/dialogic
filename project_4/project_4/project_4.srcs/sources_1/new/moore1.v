`timescale 1ns / 1ps
module moore1(
    input clk_i,rst_n_i,
    input [7:0]data_in,
    output reg detect
    );
    localparam[2:0]
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b010,
    s3 = 3'b011,
    s4 = 3'b100,
    s5 = 3'b101;
    reg [2:0]cnt = 'd7;
    reg data_i;
    reg[2:0]cs = s0;
    reg[2:0]ns = s0;
    wire rst = !rst_n_i;
//    always@(posedge clk_i)
//    begin
//    if(data_in[0] == 1'b0)
//    test <= 1'b0;
//    else
//    test <= 1'b1;
//    end
  
    always@(posedge clk_i or posedge rst)
        begin
        if(rst)
            begin
            detect <= 0;
            cnt <= 'd7;
            end
        else
            begin
            data_i = data_in[cnt];
            if(cnt >'d0)
            cnt <= cnt - 'd1;
            else
            cnt <= 'd7;
            
        end 
    end
    
    always@(posedge clk_i or posedge rst)
    begin
        if(rst)
            begin
            cs <= s0;
            end
        else
            cs <= ns;
    end
    
    always@(*)
    begin
        case(cs)
            s0:
                if(data_i == 1'b0)ns <= s1;
                else ns <= s0;
            s1:
                if(data_i == 1'b1)ns <= s2;
                else ns = s1;
            s2:
                if(data_i == 1'b0)ns <= s3;
                else ns <= s0;
            s3:
                if(data_i == 1'b1)ns = s4;
                else ns <= s1;
            s4:
                if(data_i == 1'b1)ns = s5;
                else ns <= s3;
            s5:
                ns <= s5;
            default :ns <= s0;
        endcase
    end
    
    always@(posedge clk_i)
    begin
        if(cs == s5) detect <= 1'b1;
        else detect <= 1'b0;
    end
endmodule

