    `timescale 1ns / 1ps
    
module TRNG_jittersampler#(RO_length=32)(clk,rst,sample_start,RO_input,jitter_sampled);
    input clk,rst;
    input sample_start;
    input [RO_length-1:0] RO_input;
    output reg [RO_length-1:0] jitter_sampled;
        
        //reg [RO_length-1:0] sampler;
        //reg index;
        
    always @(posedge clk or posedge rst)    begin
        if (rst) begin
            jitter_sampled<=0;
        end
        else if (sample_start)   begin
            jitter_sampled<=RO_input;           
        end    
        
    end

endmodule
