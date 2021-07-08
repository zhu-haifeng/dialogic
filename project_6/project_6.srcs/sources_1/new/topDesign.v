`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/25 11:34:47
// Design Name: 
// Module Name: topDesign
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

module topDesign(
    input clk_i,
    input S4,   //按键输入
    input S3,
    input S2,
    input S1,
    input S0,
    output [6:0]led_o_l,
    output [6:0]led_o_r,
    output [7:0]en_seg//数码管使能
    );
    localparam[2:0]
        state0 = 3'b000,
        state1 = 3'b001,
        state2 = 3'b010,
        state3 = 3'b011; 
    reg[2:0]en = 3'b001;
    reg[2:0]    cs = state0,         //当前状态
                next_state = state0; //次态
    wire[3:0]
        data1_0,data2_0,data3_0,data4_0,data5_0,data6_0,data7_0,data8_0;
    reg[3:0]
        data1_1,data2_1,data3_1,data4_1,data5_1,data6_1,data7_1,data8_1,
        data1_3,data2_3,data3_3,data4_3,data5_3,data6_3,data7_3,data8_3;
        
    reg [3:0]   
        data1 = 'ha,
        data2 = 'ha,
        data3 = 'ha,
        data4 = 'ha,
        data5 = 'ha,
        data6 = 'ha,
        data7 = 'ha,
        data8 = 'ha;
    reg [3:0]
        randString1[4:0],
        randString2[4:0],
        randString3[4:0],
        randString4[4:0],
        randString5[4:0];
    wire clk_1Hz;
    
    hexseg8 U_hexseg8_1(
        .clk_i  (clk_i),//晶振输入
        .data1  (data1),
        .data2  (data2),
        .data3  (data3),
        .data4  (data4),
        .data5  (data5),
        .data6  (data6),
        .data7  (data7),
        .data8  (data8),
        .led_o_l(led_o_l),
        .led_o_r(led_o_r),
        .en     (en_seg)
        );
    state0_init U_state0_init_1(
    .en (en[0]),
    .data1 (data1_0),
    .data2 (data2_0),
    .data3 (data3_0),
    .data4 (data4_0),
    .data5 (data5_0),
    .data6 (data6_0),
    .data7 (data7_0),
    .data8 (data8_0)
    );
    reg [2:0]cnt = 3'b000;
    reg neverReset = 1;
    divider1Hz u_divider1Hz_1(
    .rst_n_i (neverReset),
    .clk_i  (clk_i),
    .clk_o  (clk_1Hz)
    );
    always@(S0,S1,S2,S4)begin
//    always@(*)begin
        if(S4)
            next_state <= state0;
        else if(cs==state0 && S1)
            next_state <= state1;
        else if(cs==state1 && S2)
            next_state <= state2;
    end
    always@(posedge clk_i)begin
        cs <= next_state;
    end
    always@(cs)begin    //控制输入数码管数据
        if(cs==state0)begin 
            data1 = data1_0;
            data2 = data2_0;
            data3 = data3_0;
            data4 = data4_0;
            data5 = data5_0;
            data6 = data6_0;
            data7 = data7_0;
            data8 = data8_0;
        end
        if(cs==state1)begin 
            data1 = data1_1;
            data2 = data2_1;
            data3 = data3_1;
            data4 = data4_1;
            data5 = data5_1;
            data6 = data6_1;
            data7 = data7_1;
            data8 = data8_1;
        end
        
    end
    always@(cs)begin
        en = 3'b000;
        en[cs] = 1;
        if(cs ==state1)begin
                randString1[0] = 'h1;
                randString1[1] = 'h1;
                randString1[2] = 'h1;
                randString1[3] = 'h1;
                randString1[4] = 'h1;
                randString2[0] = 'h2;
                randString2[1] = 'h2;
                randString2[2] = 'h2;
                randString2[3] = 'h2;
                randString2[4] = 'h2;   
                randString3[0] = 'h3;
                randString3[1] = 'h3;
                randString3[2] = 'h3;
                randString3[3] = 'h3;
                randString3[4] = 'h3;
                randString4[0] = 'h4;
                randString4[1] = 'h4;
                randString4[2] = 'h4;
                randString4[3] = 'h4;
                randString4[4] = 'h4;
        end
         
    end
    always@(clk_1Hz)begin
//    always@(clk_i)begin

        if(cs == state1)begin
//            if(cnt == 'd0)begin
//                data1_1 <= randString1[0];
//                data2_1 <= randString1[1];
//                data3_1 <= randString1[2];
//                data4_1 <= randString1[3];
//                data5_1 <= randString1[4];
//            end
//            else if(cnt == 'd1)begin
//                data1_1 <= randString2[0];
//                data2_1 <= randString2[1];
//                data3_1 <= randString2[2];
//                data4_1 <= randString2[3];
//                data5_1 <= randString2[4];
//            end
//            else if(cnt == 'd2)begin
//                data1_1 <= randString3[0];
//                data2_1 <= randString3[1];
//                data3_1 <= randString3[2];
//                data4_1 <= randString3[3];
//                data5_1 <= randString3[4];
//            end
//            else if(cnt == 'd3)begin
//                data1_1 <= randString4[0];
//                data2_1 <= randString4[1];
//                data3_1 <= randString4[2];
//                data4_1 <= randString4[3];
//                data5_1 <= randString4[4];
//            end
//            else if(cnt == 'd4)begin
//                data1_1 <= randString5[0];
//                data2_1 <= randString5[1];
//                data3_1 <= randString5[2];
//                data4_1 <= randString5[3];
//                data5_1 <= randString5[4];
//            end
            data1_1 <= 'h8;
            data2_1 <= 'h9;
            data3_1 <= 'ha;
            data4_1 <= 'hb;
            data5_1 <= 'hc;
            data6_1 <= 'hd;
            data7_1 <= 'he;
            data8_1 <= 'hf;
            if(cnt!='d4)
            cnt <= cnt + 1;
        end
        else
            cnt <= 0;
    end
            
                
        
endmodule
