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


module ROPUF_4_1_R2(
input [15:0]en0,en1,
input out_trig,rstc,rstd,
input [7:0]C,
output R);

wire [31:0]m;
wire [1:0]cnt;
wire [15:0]d;
wire wr;

ring_osc0_2 r0_2 (en0[0],rstd,m[0]);
ring_osc1_2 r1_2 (en0[1],rstd,m[1]);
ring_osc2_2 r2_2 (en0[2],rstd,m[2]);
ring_osc3_2 r3_2 (en0[3],rstd,m[3]);
ring_osc4_2 r4_2 (en0[4],rstd,m[4]);
ring_osc5_2 r5_2 (en0[5],rstd,m[5]);
ring_osc6_2 r6_2 (en0[6],rstd,m[6]);
ring_osc7_2 r7_2 (en0[7],rstd,m[7]);
ring_osc8_2 r8_2 (en0[8],rstd,m[8]);
ring_osc9_2 r9_2 (en0[9],rstd,m[9]);
ring_osc10_2 r10_2 (en0[10],rstd,m[10]);
ring_osc11_2 r11_2 (en0[11],rstd,m[11]);
ring_osc12_2 r12_2 (en0[12],rstd,m[12]);
ring_osc13_2 r13_2 (en0[13],rstd,m[13]);
ring_osc14_2 r14_2 (en0[14],rstd,m[14]);
ring_osc15_2 r15_2 (en0[15],rstd,m[15]);

mux16_1_0_ro mr0_2 (m[15:0],C[3:0],cnt[0]);

counter_8bit0 c0_2 (cnt[0],rstc,d[7:0]);

ring_osc16_2 r16_2 (en1[0],rstd,m[16]);
ring_osc17_2 r17_2 (en1[1],rstd,m[17]);
ring_osc18_2 r18_2 (en1[2],rstd,m[18]);
ring_osc19_2 r19_2 (en1[3],rstd,m[19]);
ring_osc20_2 r20_2 (en1[4],rstd,m[20]);
ring_osc21_2 r21_2 (en1[5],rstd,m[21]);
ring_osc22_2 r22_2 (en1[6],rstd,m[22]);
ring_osc23_2 r23_2 (en1[7],rstd,m[23]);
ring_osc24_2 r24_2 (en1[8],rstd,m[24]);
ring_osc25_2 r25_2 (en1[9],rstd,m[25]);
ring_osc26_2 r26_2 (en1[10],rstd,m[26]);
ring_osc27_2 r27_2 (en1[11],rstd,m[27]);
ring_osc28_2 r28_2 (en1[12],rstd,m[28]);
ring_osc29_2 r29_2 (en1[13],rstd,m[29]);
ring_osc30_2 r30_2 (en1[14],rstd,m[30]);
ring_osc31_2 r31_2 (en1[15],rstd,m[31]);

mux16_1_1_ro mr1_2 (m[31:16],C[7:4],cnt[1]);

counter_8bit1 c1_2 (cnt[1],rstc,d[15:8]);

d_flipflop_ro dr0_2 (d[7],d[15],rstd,wr);

d_flipflop_ro dr1_2 (wr,out_trig,rstd,R);

endmodule
