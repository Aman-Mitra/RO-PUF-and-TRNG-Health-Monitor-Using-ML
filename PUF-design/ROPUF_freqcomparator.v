`timescale 1ns / 1ps

module ROPUF_freqcomparator#(parameter PUF_length=8)
(clk,rst,count_ready,RO1_count,RO2_count,PUF_done,done,PUF_bits);
    input clk,rst;
    input count_ready;
    input [26:0] RO1_count,RO2_count;
    output reg done;
    output reg PUF_done;
    output reg [PUF_length-1:0] PUF_bits;
    
    reg [$clog2(PUF_length)-1:0] index;  //tracks index of the PUF array
    always @(posedge clk) begin
        if (rst)   begin
            PUF_bits<=0;
            index<=0;
            PUF_done<=0;
            done<=0;
        end
        else if (count_ready && index<PUF_length)  begin  
            if (RO1_count> RO2_count)   begin
                PUF_bits[index]<=1'b0;
                PUF_done<=1;
            end
            else PUF_bits[index]<=1'b1;
            index<=index+1;
            PUF_done<=1;
        end
        else if (index == PUF_length-1)   begin
            PUF_done<=1;
            done<=1;
            index<=0;
        end
        else PUF_done<=0;
    end
    
endmodule
