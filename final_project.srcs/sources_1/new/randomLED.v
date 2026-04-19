`timescale 1ns / 1ps


module random_led(
    input clk,
    input rst,
    output reg [15:0] leds
);

wire [15:0] prng_out;
wire [3:0] idx = prng_out[3:0];

PRNG prng_inst (
    .clk  (clk),
    .rst  (rst),
    .load (1'b0),
    .seed (16'b0),
    .out  (prng_out)
);

always @(posedge clk or posedge rst) begin
    if (rst)
        leds <= 16'b0000000000000000;
    else
        leds <= 16'b0000000000000001 << idx;
end

endmodule