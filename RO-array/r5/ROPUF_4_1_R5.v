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


module ROPUF_4_1_R5(
input [15:0]en0,en1,
input out_trig,rstc,rstd,
input [7:0]C,
output R);

wire [31:0]m;
wire [1:0]cnt;
wire [15:0]d;
wire wr;

ring_osc0_5 r0_5 (en0[0],rstd,m[0]);
ring_osc1_5 r1_5 (en0[1],rstd,m[1]);
ring_osc2_5 r2_5 (en0[2],rstd,m[2]);
ring_osc3_5 r3_5 (en0[3],rstd,m[3]);
ring_osc4_5 r4_5 (en0[4],rstd,m[4]);
ring_osc5_5 r5_5 (en0[5],rstd,m[5]);
ring_osc6_5 r6_5 (en0[6],rstd,m[6]);
ring_osc7_5 r7_5 (en0[7],rstd,m[7]);
ring_osc8_5 r8_5 (en0[8],rstd,m[8]);
ring_osc9_5 r9_5 (en0[9],rstd,m[9]);
ring_osc10_5 r10_5 (en0[10],rstd,m[10]);
ring_osc11_5 r11_5 (en0[11],rstd,m[11]);
ring_osc12_5 r12_5 (en0[12],rstd,m[12]);
ring_osc13_5 r13_5 (en0[13],rstd,m[13]);
ring_osc14_5 r14_5 (en0[14],rstd,m[14]);
ring_osc15_5 r15_5 (en0[15],rstd,m[15]);

mux16_1_0_ro mr0_5 (m[15:0],C[3:0],cnt[0]);

counter_8bit0 c0_5 (cnt[0],rstc,d[7:0]);

ring_osc16_5 r16_5 (en1[0],rstd,m[16]);
ring_osc17_5 r17_5 (en1[1],rstd,m[17]);
ring_osc18_5 r18_5 (en1[2],rstd,m[18]);
ring_osc19_5 r19_5 (en1[3],rstd,m[19]);
ring_osc20_5 r20_5 (en1[4],rstd,m[20]);
ring_osc21_5 r21_5 (en1[5],rstd,m[21]);
ring_osc22_5 r22_5 (en1[6],rstd,m[22]);
ring_osc23_5 r23_5 (en1[7],rstd,m[23]);
ring_osc24_5 r24_5 (en1[8],rstd,m[24]);
ring_osc25_5 r25_5 (en1[9],rstd,m[25]);
ring_osc26_5 r26_5 (en1[10],rstd,m[26]);
ring_osc27_5 r27_5 (en1[11],rstd,m[27]);
ring_osc28_5 r28_5 (en1[12],rstd,m[28]);
ring_osc29_5 r29_5 (en1[13],rstd,m[29]);
ring_osc30_5 r30_5 (en1[14],rstd,m[30]);
ring_osc31_5 r31_5 (en1[15],rstd,m[31]);

mux16_1_1_ro mr1_5 (m[31:16],C[7:4],cnt[1]);

counter_8bit1 c1_5 (cnt[1],rstc,d[15:8]);

d_flipflop_ro dr0_5 (d[7],d[15],rstd,wr);

d_flipflop_ro dr1_5 (wr,out_trig,rstd,R);

endmodule
