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


module ROPUF_4_1_R4(
input [15:0]en0,en1,
input out_trig,rstc,rstd,
input [7:0]C,
output R);

wire [31:0]m;
wire [1:0]cnt;
wire [15:0]d;
wire wr;

ring_osc0_4 r0_4 (en0[0],rstd,m[0]);
ring_osc1_4 r1_4 (en0[1],rstd,m[1]);
ring_osc2_4 r2_4 (en0[2],rstd,m[2]);
ring_osc3_4 r3_4 (en0[3],rstd,m[3]);
ring_osc4_4 r4_4 (en0[4],rstd,m[4]);
ring_osc5_4 r5_4 (en0[5],rstd,m[5]);
ring_osc6_4 r6_4 (en0[6],rstd,m[6]);
ring_osc7_4 r7_4 (en0[7],rstd,m[7]);
ring_osc8_4 r8_4 (en0[8],rstd,m[8]);
ring_osc9_4 r9_4 (en0[9],rstd,m[9]);
ring_osc10_4 r10_4 (en0[10],rstd,m[10]);
ring_osc11_4 r11_4 (en0[11],rstd,m[11]);
ring_osc12_4 r12_4 (en0[12],rstd,m[12]);
ring_osc13_4 r13_4 (en0[13],rstd,m[13]);
ring_osc14_4 r14_4 (en0[14],rstd,m[14]);
ring_osc15_4 r15_4 (en0[15],rstd,m[15]);

mux16_1_0_ro mr0_4 (m[15:0],C[3:0],cnt[0]);

counter_8bit0 c0_4 (cnt[0],rstc,d[7:0]);

ring_osc16_4 r16_4 (en1[0],rstd,m[16]);
ring_osc17_4 r17_4 (en1[1],rstd,m[17]);
ring_osc18_4 r18_4 (en1[2],rstd,m[18]);
ring_osc19_4 r19_4 (en1[3],rstd,m[19]);
ring_osc20_4 r20_4 (en1[4],rstd,m[20]);
ring_osc21_4 r21_4 (en1[5],rstd,m[21]);
ring_osc22_4 r22_4 (en1[6],rstd,m[22]);
ring_osc23_4 r23_4 (en1[7],rstd,m[23]);
ring_osc24_4 r24_4 (en1[8],rstd,m[24]);
ring_osc25_4 r25_4 (en1[9],rstd,m[25]);
ring_osc26_4 r26_4 (en1[10],rstd,m[26]);
ring_osc27_4 r27_4 (en1[11],rstd,m[27]);
ring_osc28_4 r28_4 (en1[12],rstd,m[28]);
ring_osc29_4 r29_4 (en1[13],rstd,m[29]);
ring_osc30_4 r30_4 (en1[14],rstd,m[30]);
ring_osc31_4 r31_4 (en1[15],rstd,m[31]);

mux16_1_1_ro mr1_4 (m[31:16],C[7:4],cnt[1]);

counter_8bit1 c1_4 (cnt[1],rstc,d[15:8]);

d_flipflop_ro dr0_4 (d[7],d[15],rstd,wr);

d_flipflop_ro dr1_4 (wr,out_trig,rstd,R);

endmodule
