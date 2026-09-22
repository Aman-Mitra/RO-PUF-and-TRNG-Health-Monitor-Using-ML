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


module ROPUF_4_1_R0(
input [15:0]en0,en1,
input out_trig,rstc,rstd,
input [7:0]C,
output R);

wire [31:0]m;
wire [1:0]cnt;
wire [15:0]d;
wire wr;

ring_osc0_0 r0_0 (en0[0],rstd,m[0]);
ring_osc1_0 r1_0 (en0[1],rstd,m[1]);
ring_osc2_0 r2_0 (en0[2],rstd,m[2]);
ring_osc3_0 r3_0 (en0[3],rstd,m[3]);
ring_osc4_0 r4_0 (en0[4],rstd,m[4]);
ring_osc5_0 r5_0 (en0[5],rstd,m[5]);
ring_osc6_0 r6_0 (en0[6],rstd,m[6]);
ring_osc7_0 r7_0 (en0[7],rstd,m[7]);
ring_osc8_0 r8_0 (en0[8],rstd,m[8]);
ring_osc9_0 r9_0 (en0[9],rstd,m[9]);
ring_osc10_0 r10_0 (en0[10],rstd,m[10]);
ring_osc11_0 r11_0 (en0[11],rstd,m[11]);
ring_osc12_0 r12_0 (en0[12],rstd,m[12]);
ring_osc13_0 r13_0 (en0[13],rstd,m[13]);
ring_osc14_0 r14_0 (en0[14],rstd,m[14]);
ring_osc15_0 r15_0 (en0[15],rstd,m[15]);

mux16_1_0_ro mr0_0 (m[15:0],C[3:0],cnt[0]);

counter_8bit0 c0_0 (cnt[0],rstc,d[7:0]);

ring_osc16_0 r16_0 (en1[0],rstd,m[16]);
ring_osc17_0 r17_0 (en1[1],rstd,m[17]);
ring_osc18_0 r18_0 (en1[2],rstd,m[18]);
ring_osc19_0 r19_0 (en1[3],rstd,m[19]);
ring_osc20_0 r20_0 (en1[4],rstd,m[20]);
ring_osc21_0 r21_0 (en1[5],rstd,m[21]);
ring_osc22_0 r22_0 (en1[6],rstd,m[22]);
ring_osc23_0 r23_0 (en1[7],rstd,m[23]);
ring_osc24_0 r24_0 (en1[8],rstd,m[24]);
ring_osc25_0 r25_0 (en1[9],rstd,m[25]);
ring_osc26_0 r26_0 (en1[10],rstd,m[26]);
ring_osc27_0 r27_0 (en1[11],rstd,m[27]);
ring_osc28_0 r28_0 (en1[12],rstd,m[28]);
ring_osc29_0 r29_0 (en1[13],rstd,m[29]);
ring_osc30_0 r30_0 (en1[14],rstd,m[30]);
ring_osc31_0 r31_0 (en1[15],rstd,m[31]);

mux16_1_1_ro mr1_0 (m[31:16],C[7:4],cnt[1]);

counter_8bit1 c1_0 (cnt[1],rstc,d[15:8]);

d_flipflop_ro dr0_0 (d[7],d[15],rstd,wr);

d_flipflop_ro dr1_0 (wr,out_trig,rstd,R);


endmodule
