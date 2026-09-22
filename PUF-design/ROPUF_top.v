`timescale 1ns / 1ps

module ROPUF_top#(input_RO=32,PUF_length=8)(clk,rst,RO_input,PUF_bits);
    input clk,rst;
    input [input_RO-1:0] RO_input;
    output [PUF_length-1:0] PUF_bits;
    
    wire start;
    wire RO_select1, RO_select2;
    
    ROPUF_challengemux #(input_RO) mux (RO_input,challenge,RO_select1,RO_select2);
    
    ROPUF_counter #(.COUNTER_WIDTH(20),.MEAS_CYCLES(1000)) counter(clk,rst,start,RO_select1,RO_select2,RO1_count,RO2_count,count_ready);
    
    ROPUF_freqcomparator #(PUF_length) comparator(clk,rst,count_ready,RO1_count,RO2_count,count_ready,done,PUF_bits);
    
    ROPUF_ControlUnit ControlUnit();
    
endmodule
