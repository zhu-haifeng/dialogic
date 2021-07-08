`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 12:32:49
// Design Name: 
// Module Name: reg8file_sim
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


module reg8file_sim(
    );
    
    reg [2:0] wsel  = 0;
    reg [2:0] rsel  = 0;
    reg wen     = 1;
    reg clk     = 0;
    reg [7:0] d = 8'b1;
    reg clrn    = 1;
    wire [7:0] q;
    
    reg8file u_reg8file_sim(
        .wsel   (wsel),
        .wen    (wen),
        .clk    (clk),
        .d      (d),
        .clrn   (clrn),
        .rsel   (rsel),
        .q      (q)
    );
    
    always #10 clk = ~clk;
    
    initial begin
        #15 ;
        #20 begin d = d-1;wsel = wsel+1;end
        #20 begin d = d-1;wsel = wsel+1;end
        #20 begin d = d-1;wsel = wsel+1;end
        #20 begin d = d-1;wsel = wsel+1;wen = 0; end
        #20 begin d = d-1;wsel = wsel+1;wen = 1;end
        #20 begin d = d-1;wsel = wsel+1;end
        #20 begin d = d-1;wsel = wsel+1;end
        #20 begin rsel = rsel+1;end
        #20 begin rsel = rsel+1;end
        #20 begin rsel = rsel+1;end
        #20 begin rsel = rsel+1;end
        #20 begin rsel = rsel+1;end
        #20 begin rsel = rsel+1;end
        #20 begin rsel = rsel+1;end
        
        #20 $stop;
        
    
    
    end
    
    
    
endmodule
