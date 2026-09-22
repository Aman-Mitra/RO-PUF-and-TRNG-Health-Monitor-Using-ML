`timescale 1ns / 1ps

module ROPUF_challengemux #(parameter input_RO=32, parameter challenge_bits=2*($clog2(input_RO/2)))
    (RO_input,challenge,RO_select1,RO_select2);
    input [input_RO-1:0] RO_input;
    input [challenge_bits-1:0] challenge;
    output RO_select1,RO_select2;
    
    assign RO_select1 = RO_input[challenge[challenge_bits/2-1:0]];
    assign RO_select2 = RO_input[(input_RO/2) + challenge[challenge_bits-1:challenge_bits/2]];
    
endmodule
