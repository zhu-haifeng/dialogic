`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/03 22:15:00
// Design Name: 
// Module Name: reg8_sim
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


module reg8_sim ();

    // Inputs
    reg clk = 1'b0;
    reg clrn = 1'b1;
    reg wen = 1'b1;
    reg [7:0] d = 8'b1010_1010;

    // Output
    wire [7:0] q;
    
    reg8 U_reg9_0(
    .clk    (clk),
    .clrn   (clrn),
    .wen    (wen),
    .d      (d),
    .q      (q)
    );
// 1 �벹ȫ
    always #10 clk = ~clk;

    initial begin
            
        #25 begin clrn = 1'b0; wen = 1'b0; end
        #10 begin clrn = 1'b1; wen = 1'b1; end
        #30 wen = 1'b0;
        #35 d = 8'b1100_1001;

// 2 �벹ȫ
        #30 $finish;
    end
endmodule
