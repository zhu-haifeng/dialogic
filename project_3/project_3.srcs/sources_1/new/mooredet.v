`timescale 1ns / 1ps

module SeqDetector(rst_i, clk_i, set_i, data_i, detect_o);
    input rst_i;
    input clk_i;
    input [7:0] data_i;
    input set_i;
    output reg detect_o;
    
    reg cur_data = 'd0;
    reg [3:0] cnt = 'd8;
    
      
    parameter s0 = 'd0;
    parameter s1 = 'd1;
    parameter s2 = 'd2;
    parameter s3 = 'd3;
    parameter s4 = 'd4;
    parameter s5 = 'd5;
    
    reg [2:0] current_state = s0;
    reg [2:0] next_state = s0;
    wire d_i = cur_data;
    always @ (posedge rst_i or posedge clk_i) begin
        if (rst_i || (~set_i))begin
            detect_o <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @ (current_state or d_i or rst_i or set_i) begin
        if (rst_i)
            next_state <= s0;
        else if (set_i)
            case (current_state)
                s0: begin next_state <= (d_i ? s1 : s0); detect_o <= 'b0; end
                s1: begin next_state <= (d_i ? s2 : s0); detect_o <= 'b0; end
                s2: begin next_state <= (d_i ? s2 : s3); detect_o <= 'b0; end
                s3: begin next_state <= (d_i ? s4 : s0); detect_o <= 'b0; end
                s4: begin next_state <= (d_i ? s2 : s5); detect_o <= ~d_i; end
                s5: begin next_state <= s5; detect_o <= 'b1; end
                default: next_state <= s0;
            endcase
    end
     
    always @ (posedge rst_i or posedge clk_i) begin
        if (rst_i || (~set_i))
            cnt <= 'd0;
        else if (set_i && (cnt <= 'd7)) begin
            cur_data <= data_i[cnt];
            cnt <= cnt + 1;
        end else
            cnt <= cnt;
    end

endmodule
