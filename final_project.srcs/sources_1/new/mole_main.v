`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2026 11:17:38 AM
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: A
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mole_main(
    input CLK100MHZ,
    input rst,
    input [15:0] switches,
    output [15:0] leds,
    output [6:0] cathode,
    output [7:0] anode
);

wire clk_05;
wire [15:0] score;

led_timer clk_5sec(
    .clk_in(CLK100MHZ),
    .rst(rst),
    .divided_clk(clk_05)
);

randomLED led(
    .clk(clk_05),
    .rst(rst),
    .leds(leds)
);

hit_detect detector(
    .clk(CLK100MHZ),
    .switches(switches),
    .leds(leds),
    .cathode(cathode),
    .anode(anode),
    .score_out(score)
);

endmodule