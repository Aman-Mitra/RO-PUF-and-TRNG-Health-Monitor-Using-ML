`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 10:55:52
// Design Name: 
// Module Name: ring_osc
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


module ring_osc27_5(
input en,rst,
output op);

wire w1,w2,w3,w4,w5,w6,w7,wop;

assign w1 = ~(en&w7);
assign w2 = ~w1;
assign w3 = ~w2;
assign w4 = ~w3;
assign w5 = ~w4;
assign w6 = ~w5;
assign w7 = ~w6;
assign wop = ~w7;
clock_div_2 c0 (.clk(wop),.rst(rst),.q(op));
endmodule
