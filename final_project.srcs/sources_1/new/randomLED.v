
`timescale 1ns / 1ps
module randomLED(
    input clk,
    input rst,
    output reg [15:0] leds,
    output wire buzzer_out
);
wire [15:0] prng_out;
wire [3:0] idx = prng_out[3:0];
reg LEDisOn = 0;
reg [27:0] led_on = 0;
parameter ON_TIME  = 100_000_000;  // 1 sec at 100MHz
parameter OFF_TIME =  50_000_000;  // 0.5 sec at 100MHz

PRNG prng_inst (
    .clk  (clk),
    .rst  (rst),
    .load (1'b0),
    .seed (16'hACE1),
    .out  (prng_out)
);
buzzer DUT (
    .CLK100MHZ(clk),
    .enable(LEDisOn),
    .buzzer_out(buzzer_out)
);
always @(posedge clk or posedge rst) begin
    if (rst) begin
        leds    <= 0;
        led_on  <= 0;
        LEDisOn <= 0;
    end else if (led_on < ON_TIME) begin
        leds    <= 16'b1 << idx;
        LEDisOn <= 1;
        led_on  <= led_on + 1;
    end else if (led_on < ON_TIME + OFF_TIME) begin
        leds    <= 0;
        LEDisOn <= 0;
        led_on  <= led_on + 1;
    end else begin
        led_on  <= 0;
    end
end
endmodule

//module randomLED(
//    input clk,
//    input rst,
//    output reg [15:0] leds,
//    output wire buzzer_out
//);
//reg  [1:0] led_on =0; 
//wire [15:0] prng_out;
//wire [3:0] idx = prng_out[3:0];
//reg LEDisOn;

//PRNG prng_inst (
//    .clk  (clk),
//    .rst  (rst),
//    .load (1'b0),
//    .seed (16'hACE1),
//    .out  (prng_out)
//);

//buzzer DUT (
//    .CLK100MHZ(clk),
//    .enable(1'b1),
//    .buzzer_out(buzzer_out)
//);



//always @(posedge clk or posedge rst) begin
//    if (rst) begin
//        leds <= 16'b0000000000000000;
//        led_on <= 0;
////        LEDisOn = 1'b0;
//    end else if (led_on==2)begin 
//        leds <=16'b1 <<idx; 
//        led_on<=0;
////        LEDisOn = 1'b1;
//    end else begin 
//        leds <=16'b0;
//        led_on<= led_on+1;
////        LEDisOn = 1'b0;
//    end 
//  end 

//endmodule