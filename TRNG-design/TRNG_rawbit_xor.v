`timescale 1ns / 1ps

module TRNG_rawbit_xor(clk,rst,sample_start,xor_output,raw_bit);
    input clk,rst;
    input sample_start;
    input xor_output;
    output reg raw_bit;
    
    always @(posedge clk or posedge rst)  begin
        if (rst) raw_bit<=0;
        else if (sample_start)  begin
            raw_bit<=xor_output;    
        end
    end
    
endmodule
