`timescale 1ns / 1ps

module TRNG_VNdebiaser(clk,rst,raw_bit,raw_valid,vn_bit,vn_valid);
    input  wire clk;
    input  wire rst;
    input  wire raw_bit;
    input  wire raw_valid;

    output reg  vn_bit;
    output reg  vn_valid;
    
    reg first_bit;
    reg first_valid;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            first_bit   <= 1'b0;
            first_valid <= 1'b0;
            vn_bit      <= 1'b0;
            vn_valid    <= 1'b0;
        end
        else begin
            // Default: no valid output
            vn_valid <= 1'b0;
            if (raw_valid) begin
                // Store the first bit of the pair
                if (!first_valid) begin
                    first_bit   <= raw_bit;
                    first_valid <= 1'b1;
                end
                // Second bit: process the pair
                else begin
                    case ({first_bit, raw_bit})
                        2'b01: begin
                            vn_bit   <= 1'b0;
                            vn_valid <= 1'b1;
                        end
                        2'b10: begin
                            vn_bit   <= 1'b1;
                            vn_valid <= 1'b1;
                        end
                        2'b00,2'b11: begin
                            vn_bit   <= 1'b0;
                            vn_valid <= 1'b0;
                        end
                    endcase
                    // Pair has been consumed
                    first_valid <= 1'b0;
                end
            end
        end
    end
    
//    always @(posedge clk or posedge rst)    begin
    
    
//    end

endmodule