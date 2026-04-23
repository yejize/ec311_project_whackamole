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
    output [15:0] leds
);

wire clk_05; 

//mole_timer clk_1sec (
//    .clk_in(CLK100MHZ),
//    .rst(rst),
//    .divided_clk(clk_1)
//);

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

endmodule
