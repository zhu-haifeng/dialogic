`timescale 1ns / 1ps

module SeqDetector(rst_i, clk_i, set_i, data_i, detect_o);
    input rst_i;
    input clk_i;
    input [7:0] data_i;
    input set_i;
    output detect_o;
    
    reg cur_data = 'd0;
    reg [3:0] cnt = 'd8;
    
    //state_machine_moore U_moore(.rst_i(rst_i), .set_i(set_i), .clk_i(clk_i), .d_i(cur_data), .detect_o(detect_o));
    state_machine_moore U_mealy(.rst_i(rst_i), .set_i(set_i), .clk_i(clk_i), .d_i(cur_data), .detect_o(detect_o));
    
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
