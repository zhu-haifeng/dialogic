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
    input [7:0] sw_i,
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
        data1_3='he,data2_3='he,data3_3='he,data4_3='he,data5_3='he;//data6_3,data7_3,data8_3;
    wire [3:0]shiningO;
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
        temp1[4:0],
        temp2[4:0],
        temp3[4:0],
        temp4[4:0],
        temp5[4:0];
    reg [3:0]
        randString1[4:0],
        randString2[4:0],
        randString3[4:0],
        randString4[4:0],
        randString5[4:0];
    wire clk_1Hz;
    wire [3:0]Y;
    reg [2:0]addrSel;   //选择的地址
    reg [3:0]readin;    //读入的数
    reg [5:0] i = 0;
    randNum U_ranNum_1(
        .clk (clk_i),
        .Y  (Y)
    );
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
    shinningO U_shinningO_1(
    .clk_i  (clk_i),
    .shiningO(shiningO)
    );
    reg [2:0]cnt = 3'b000;
    reg neverReset = 1;
    divider1Hz u_divider1Hz_1(
    .rst_n_i (neverReset),
    .clk_i  (clk_i),
    .clk_o  (clk_1Hz)
    );
    always@(posedge clk_i)begin
        i <=(i+1) % 'd25;
        if(i>='d0 && i<'d5)
            temp1[i%'d5] <= Y;
        else if(i>='d5 && i<'d10)
            temp2[i%'d5] <= Y;
        else if(i>='d10 && i<'d15)
            temp3[i%'d5] <= Y;
        else if(i>='d15 && i<'d20)
            temp4[i%'d5] <= Y;
        else if(i>='d20 && i<'d25)
            temp5[i%'d5] <= Y;
    end
//    always@(S0,S1,S2,S4)begin
//    always@(posedge clk_i,posedge S4)begin
    always@(posedge clk_i)begin

        if(S4)
            next_state <= state0;//初始
        else if(cs==state0 && S0)
            next_state <= state1;//显示
        else if(cs==state1 && S1)
            next_state <= state2;//输入地址
        else if(cs==state2 && S2) begin
            next_state <= state3;//读数状态
            addrSel <= sw_i[2:0];
        end
//        else if(cs==state3 && S3) begin
//            next_state <= state3;//读数状态
//            data1_3 = data2_3;
//            data2_3 = data3_3;
//            data3_3 = data4_3;
//            data4_3 = data5_3;
//            data5_3 = sw_i[2:0];
            
//        end
    end
    always@(posedge clk_i)begin
        cs <= next_state;
        en <= 3'b000;
        en[cs] <= 1;
    end
    always@(posedge S3)
        if(cs==state3 && S3) begin
            data1_3 = data2_3;
            data2_3 = data3_3;
            data3_3 = data4_3;
            data4_3 = data5_3;
            data5_3 = sw_i[2:0];
            
        end
    always@(clk_i)begin    //控制输入数码管数据
        if(cs==state0)begin //状态0
            data1 = data1_0;
            data2 = data2_0;
            data3 = data3_0;
            data4 = data4_0;
            data5 = data5_0;
            data6 = data6_0;
            data7 = data7_0;
            data8 = data8_0;
        end
        else if(cs==state1)begin //状态1
            data1 = data1_1;
            data2 = data2_1;
            data3 = data3_1;
            data4 = data4_1;
            data5 = data5_1;
            data6 = data6_1;
            data7 = data7_1;
            data8 = data8_1;
        end
        else if(cs==state2)begin //状态2
            if(sw_i>'d4)begin
                data1 = 'hf;
                data2 = 'hf;
                data3 = 'hf;
                data4 = 'hf;
                data5 = 'hf;
                data6 = 'hf;
                data7 = 'hf;
                data8 = 'hf;
            end
            else begin//状态4
                data8 = sw_i[3:0];
                data1 = 'he;
                data2 = 'he;
                data3 = 'he;
                data4 = 'he;
                data5 = 'he;
                data6 = cs;
                data7 = 'he;
                end;
        end
    else if(cs==state3)begin 
            data1 = addrSel;
            data2 = 'hd;
            data3 = data1_3;
            data4 = data2_3;
            data5 = data3_3;
            data6 = data4_3;
            data7 = data5_3;
            data8 = shiningO;
            case(addrSel)
            3'b000:
                if( data1_3 == randString1[0] &&
                    data2_3 == randString1[1] &&
                    data3_3 == randString1[2] &&
                    data4_3 == randString1[3] &&
                    data5_3 == randString1[4])
                data8 = 'ha;
            3'b001:
                if( data1_3 == randString2[0] &&
                    data2_3 == randString2[1] &&
                    data3_3 == randString2[2] &&
                    data4_3 == randString2[3] &&
                    data5_3 == randString2[4])
                data8 = 'ha;
            3'b010:
                if( data1_3 == randString3[0] &&
                    data2_3 == randString3[1] &&
                    data3_3 == randString3[2] &&
                    data4_3 == randString3[3] &&
                    data5_3 == randString3[4])
                data8 = 'ha;
            3'b011:
                if( data1_3 == randString4[0] &&
                    data2_3 == randString4[1] &&
                    data3_3 == randString4[2] &&
                    data4_3 == randString4[3] &&
                    data5_3 == randString4[4])
                data8 = 'ha;
            3'b100:
                if( data1_3 == randString5[0] &&
                    data2_3 == randString5[1] &&
                    data3_3 == randString5[2] &&
                    data4_3 == randString5[3] &&
                    data5_3 == randString5[4])
                data8 <= 'ha;
//            3'b100:
//                if( data1_3 == 'd1 &&
//                    data2_3 =='d1 &&
//                    data3_3 == 'd1 &&
//                    data4_3 == 'd1 &&
//                    data5_3 == 'd1)
//                data8 = 'ha;
            endcase
                
//            data1 = data1_3;
//            data2 = data2_3;
//            data3 = data3_3;
//            data4 = data4_3;
//            data5 = data5_3;
//            data6 = 'hd;
//            data7 = shiningO;
//            data8 = addrSel;

        end
        
    end
//    always@(cs)begin
    always@(posedge S0)begin


        if(cs ==state0)begin

                randString1[0] = temp1[0];
                randString1[1] = temp1[1] ;
                randString1[2] = temp1[2];
                randString1[3] = temp1[3];
                randString1[4] = temp1[4];
                randString2[0] = temp2[0];
                randString2[1] = temp2[1];
                randString2[2] = temp2[2];
                randString2[3] = temp2[3];
                randString2[4] = temp2[4];
                randString3[0] = temp3[0];
                randString3[1] = temp3[1];
                randString3[2] = temp3[2];
                randString3[3] = temp3[3];
                randString3[4] = temp3[4];
                randString4[0] = temp4[0];
                randString4[1] = temp4[1];
                randString4[2] = temp4[2];
                randString4[3] = temp4[3];
                randString4[4] = temp4[4];
                randString5[0] <= temp5[0];
                randString5[1] <= temp5[1];
                randString5[2] <= temp5[2];
                randString5[3] <= temp5[3];
                randString5[4] <= temp5[4];
        end
         
    end
    always@(posedge clk_1Hz)begin//上板
//    always@(clk_i)begin//仿真

        if(cs == state1)begin
            if(cnt == 'd0)begin
                data1_1 <= randString1[0];
                data2_1 <= randString1[1];
                data3_1 <= randString1[2];
                data4_1 <= randString1[3];
                data5_1 <= randString1[4];
            end
            else if(cnt == 'd1)begin
                data1_1 <= randString2[0];
                data2_1 <= randString2[1];
                data3_1 <= randString2[2];
                data4_1 <= randString2[3];
                data5_1 <= randString2[4];
            end
            else if(cnt == 'd2)begin
                data1_1 <= randString3[0];
                data2_1 <= randString3[1];
                data3_1 <= randString3[2];
                data4_1 <= randString3[3];
                data5_1 <= randString3[4];
            end
            else if(cnt == 'd3)begin
                data1_1 <= randString4[0];
                data2_1 <= randString4[1];
                data3_1 <= randString4[2];
                data4_1 <= randString4[3];
                data5_1 <= randString4[4];
            end
//            else if(cnt == 'd4)begin
            else begin
                data1_1 <= randString5[0];
                data2_1 <= randString5[1];
                data3_1 <= randString5[2];
                data4_1 <= randString5[3];
                data5_1 <= randString5[4];
            end
//            else begin
//                data1_1 <= 'hf;
//                data2_1 <= 'hf;
//                data3_1 <= 'hf;
//                data4_1 <= 'hf;
//                data5_1 <= 'hf;
//            end
//            data1_1 = 'h8;
//            data2_1 <= 'h9;
//            data3_1 <= 'ha;
//            data4_1 <= 'hb;
//            data5_1 <= 'hc;
            data6_1 <= temp4[0];
            data7_1 <= cs;
            data8_1 <= cnt;
            if(cnt<'b100)
            cnt <= cnt + 1;
        end
        else
            cnt <= 0;
    end
            
                
        
endmodule
