`timescale 1ns / 1ps

module state_machine_moore(rst_i, clk_i, set_i, d_i, detect_o);
    input rst_i;
    input clk_i;
    input d_i;
    input set_i;
    output reg detect_o;
    
    parameter s0 = 'd0;
    parameter s1 = 'd1;
    parameter s2 = 'd2;
    parameter s3 = 'd3;
    parameter s4 = 'd4;
    parameter s5 = 'd5;
    
    reg [2:0] current_state = s0;
    reg [2:0] next_state = s0;
 
    always @ (posedge rst_i or posedge clk_i) begin
        if (rst_i || (~set_i))
            current_state <= s0;
        else
            current_state <= next_state;
    end
    
    always @ (current_state or d_i or rst_i) begin
        if (rst_i)
            next_state <= s0;
        else
            case (current_state)
                s0: next_state <= (d_i ? s1 : s0);
                s1: next_state <= (d_i ? s2 : s0);
                s2: next_state <= (d_i ? s2 : s3);
                s3: next_state <= (d_i ? s4 : s0);
                s4: next_state <= (d_i ? s2 : s5);
                s5: next_state <= s5;
            endcase
    end

    always @ (current_state or rst_i or set_i) begin
        if (rst_i)
            detect_o <= 'd0;
        else if (set_i)
            detect_o <= (current_state == s5) && (~rst_i);
    end
endmodule
