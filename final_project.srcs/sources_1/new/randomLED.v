`timescale 1ns / 1ps


module randomLED(
    input clk,
    input rst,
    output reg [15:0] leds
);
reg  [1:0] led_on =0; 
wire [15:0] prng_out;
wire [3:0] idx = prng_out[3:0];

PRNG prng_inst (
    .clk  (clk),
    .rst  (rst),
    .load (1'b0),
    .seed (16'hACE1),
    .out  (prng_out)
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        leds <= 16'b0000000000000000;
        led_on <= 0;
    end else if (led_on==2)begin 
        leds <=16'b1 <<idx; 
        led_on<=0;
    end else begin 
        leds <=16'b0;
        led_on<= led_on+1;
    end 
  end 

endmodule

//`timescale 1ns / 1ps

////another comment
//module randomLED(
//    input clk,
//    input rst,
//    output reg [15:0] leds
//);

//wire [15:0] prng_out;
//wire [3:0] idx = prng_out[3:0];

//PRNG prng_inst (
//    .clk  (clk),
//    .rst  (rst),
//    .load (1'b0),
//    .seed (16'hACE1),
//    .out  (prng_out)
//);

//always @(posedge clk or posedge rst) begin
//    if (rst)
//        leds <= 16'b0000000000000000;
//    else
//        leds <= 16'b1 << idx;
//end

//endmodule