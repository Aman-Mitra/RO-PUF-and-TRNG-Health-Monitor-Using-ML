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


module ROPUF_4_1_R1(
input [15:0]en0,en1,
input out_trig,rstc,rstd,
input [7:0]C,
output R);

wire [31:0]m;
wire [1:0]cnt;
wire [15:0]d;
wire wr;

ring_osc0_1 r0_1 (en0[0],rstd,m[0]);
ring_osc1_1 r1_1 (en0[1],rstd,m[1]);
ring_osc2_1 r2_1 (en0[2],rstd,m[2]);
ring_osc3_1 r3_1 (en0[3],rstd,m[3]);
ring_osc4_1 r4_1 (en0[4],rstd,m[4]);
ring_osc5_1 r5_1 (en0[5],rstd,m[5]);
ring_osc6_1 r6_1 (en0[6],rstd,m[6]);
ring_osc7_1 r7_1 (en0[7],rstd,m[7]);
ring_osc8_1 r8_1 (en0[8],rstd,m[8]);
ring_osc9_1 r9_1 (en0[9],rstd,m[9]);
ring_osc10_1 r10_1 (en0[10],rstd,m[10]);
ring_osc11_1 r11_1 (en0[11],rstd,m[11]);
ring_osc12_1 r12_1 (en0[12],rstd,m[12]);
ring_osc13_1 r13_1 (en0[13],rstd,m[13]);
ring_osc14_1 r14_1 (en0[14],rstd,m[14]);
ring_osc15_1 r15_1 (en0[15],rstd,m[15]);

mux16_1_0_ro mr0_1 (m[15:0],C[3:0],cnt[0]);

counter_8bit0 c0_1 (cnt[0],rstc,d[7:0]);

ring_osc16_1 r16_1 (en1[0],rstd,m[16]);
ring_osc17_1 r17_1 (en1[1],rstd,m[17]);
ring_osc18_1 r18_1 (en1[2],rstd,m[18]);
ring_osc19_1 r19_1 (en1[3],rstd,m[19]);
ring_osc20_1 r20_1 (en1[4],rstd,m[20]);
ring_osc21_1 r21_1 (en1[5],rstd,m[21]);
ring_osc22_1 r22_1 (en1[6],rstd,m[22]);
ring_osc23_1 r23_1 (en1[7],rstd,m[23]);
ring_osc24_1 r24_1 (en1[8],rstd,m[24]);
ring_osc25_1 r25_1 (en1[9],rstd,m[25]);
ring_osc26_1 r26_1 (en1[10],rstd,m[26]);
ring_osc27_1 r27_1 (en1[11],rstd,m[27]);
ring_osc28_1 r28_1 (en1[12],rstd,m[28]);
ring_osc29_1 r29_1 (en1[13],rstd,m[29]);
ring_osc30_1 r30_1 (en1[14],rstd,m[30]);
ring_osc31_1 r31_1 (en1[15],rstd,m[31]);

mux16_1_1_ro mr1_1 (m[31:16],C[7:4],cnt[1]);

counter_8bit1 c1_1 (cnt[1],rstc,d[15:8]);

d_flipflop_ro dr0_1 (d[7],d[15],rstd,wr);

d_flipflop_ro dr1_1 (wr,out_trig,rstd,R);

endmodule
