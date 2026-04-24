`timescale 1ns / 1ps

module mole_main(
    input CLK100MHZ,
    input rst,
    input [15:0] switches,
    output [15:0] leds,
    output [6:0] cathode,
    output [7:0] anode,
    output buzzer_out
);

wire clk_05;
wire [15:0] score;

//led_timer clk_5sec(
//    .clk_in(CLK100MHZ),
//    .rst(rst),
//    .divided_clk(clk_05)
//);

randomLED led(
    .clk(CLK100MHZ),  
    .rst(rst),
    .leds(leds),
    .buzzer_out(buzzer_out)
);

hit_detect detector(
    .rst(rst),
    .clk(CLK100MHZ),
    .switches(switches),
    .leds(leds),
    .cathode(cathode),
    .anode(anode),
    .score_out(score)
);

endmodule