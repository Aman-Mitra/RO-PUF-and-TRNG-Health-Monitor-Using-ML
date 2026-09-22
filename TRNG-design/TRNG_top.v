`timescale 1ns / 1ps

module TRNG_top#(TRNG_word=8,RO_length=32)(clk,rst,RO_input,TRNG_output);
    input clk,rst;
    input [RO_length-1:0] RO_input;
    output [TRNG_word-1:0] TRNG_output;
    
    wire sample_start;
    wire [RO_length-1:0] jitter_sampled;
    wire xor_output,raw_bit;
    
    TRNG_jittersampler#(.RO_length(32)) jitter_sampler(clk,rst,sample_start,RO_input,jitter_sampled);
    
    TRNG_xortree#(.RO_length(32)) xor_tree(jitter_sampled,xor_output);
    
    TRNG_rawbit_xor raw_bits(clk,rst,sample_start,xor_output,raw_bit);
    
    TRNG_VNdebiaser debiaser(clk,rst,raw_bit,raw_valid,vn_bit,vn_valid);
    
    TRNG_controlunit control_unit();
    
endmodule
