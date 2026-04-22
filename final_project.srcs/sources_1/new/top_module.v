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
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module(
    input CLK100MHZ,
    input rst,
    output [15:0] leds
);

wire divided_clk;

clk_divider_one clk_div_inst (
    .clk_in(CLK100MHZ),
    .rst(rst),
    .divided_clk(divided_clk)
);

randomLED led(
    .clk(divided_clk),
    .rst(rst),
    .leds(leds)
);

endmodule
