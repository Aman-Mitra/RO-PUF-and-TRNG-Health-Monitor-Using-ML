`timescale 1ns / 1ps

module TRNG_xortree#(RO_length=32)(jitter_sampled,xor_output);
    input [RO_length-1:0] jitter_sampled;
    output xor_output;
    
    assign xor_output = ^jitter_sampled;
  
endmodule
