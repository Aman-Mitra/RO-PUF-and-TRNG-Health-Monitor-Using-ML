`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 17:13:34
// Design Name: 
// Module Name: ROPUF_4_1
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


module ROPUF_4_1_R3(
input [15:0]en0,en1,
input out_trig,rstc,rstd,
input [7:0]C,
output R);

wire [31:0]m;
wire [1:0]cnt;
wire [15:0]d;
wire wr;

ring_osc0_3 r0_3 (en0[0],rstd,m[0]);
ring_osc1_3 r1_3 (en0[1],rstd,m[1]);
ring_osc2_3 r2_3 (en0[2],rstd,m[2]);
ring_osc3_3 r3_3 (en0[3],rstd,m[3]);
ring_osc4_3 r4_3 (en0[4],rstd,m[4]);
ring_osc5_3 r5_3 (en0[5],rstd,m[5]);
ring_osc6_3 r6_3 (en0[6],rstd,m[6]);
ring_osc7_3 r7_3 (en0[7],rstd,m[7]);
ring_osc8_3 r8_3 (en0[8],rstd,m[8]);
ring_osc9_3 r9_3 (en0[9],rstd,m[9]);
ring_osc10_3 r10_3 (en0[10],rstd,m[10]);
ring_osc11_3 r11_3 (en0[11],rstd,m[11]);
ring_osc12_3 r12_3 (en0[12],rstd,m[12]);
ring_osc13_3 r13_3 (en0[13],rstd,m[13]);
ring_osc14_3 r14_3 (en0[14],rstd,m[14]);
ring_osc15_3 r15_3 (en0[15],rstd,m[15]);

mux16_1_0_ro mr0_3 (m[15:0],C[3:0],cnt[0]);

counter_8bit0 c0_3 (cnt[0],rstc,d[7:0]);


ring_osc16_3 r16_3 (en1[0],rstd,m[16]);
ring_osc17_3 r17_3 (en1[1],rstd,m[17]);
ring_osc18_3 r18_3 (en1[2],rstd,m[18]);
ring_osc19_3 r19_3 (en1[3],rstd,m[19]);
ring_osc20_3 r20_3 (en1[4],rstd,m[20]);
ring_osc21_3 r21_3 (en1[5],rstd,m[21]);
ring_osc22_3 r22_3 (en1[6],rstd,m[22]);
ring_osc23_3 r23_3 (en1[7],rstd,m[23]);
ring_osc24_3 r24_3 (en1[8],rstd,m[24]);
ring_osc25_3 r25_3 (en1[9],rstd,m[25]);
ring_osc26_3 r26_3 (en1[10],rstd,m[26]);
ring_osc27_3 r27_3 (en1[11],rstd,m[27]);
ring_osc28_3 r28_3 (en1[12],rstd,m[28]);
ring_osc29_3 r29_3 (en1[13],rstd,m[29]);
ring_osc30_3 r30_3 (en1[14],rstd,m[30]);
ring_osc31_3 r31_3 (en1[15],rstd,m[31]);

mux16_1_1_ro mr1_3 (m[31:16],C[7:4],cnt[1]);

counter_8bit1 c1_3 (cnt[1],rstc,d[15:8]);

d_flipflop_ro dr0_3 (d[7],d[15],rstd,wr);

d_flipflop_ro dr1_3 (wr,out_trig,rstd,R);

endmodule
