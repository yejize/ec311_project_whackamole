`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2026 05:22:02 PM
// Design Name: 
// Module Name: hit_detect_tb
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


module hit_detect_tb();

    reg clk;
    reg [15:0] switches;
    reg [15:0] leds;
    wire [6:0] cathode;
    wire [7:0] anode;
    wire [15:0] score_out;

    hit_detect DUT (
        .clk(clk),
        .switches(switches),
        .leds(leds),
        .cathode(cathode),
        .anode(anode),
        .score_out(score_out)
    );

    always #1 clk = ~clk;

    initial begin
        clk = 0;
        switches = 0;
        leds = 0;

        // no match - score should stay 0
        #10 switches = 16'b0000000000000001;
            leds     = 16'b0000000000000010;

        // match - score should increment
        #10 switches = 16'b0000000000000100;
            leds     = 16'b0000000000000100;

        // no match again
        #10 switches = 16'b0000000000000001;
            leds     = 16'b0000000000001000;

        // another match
        #10 switches = 16'b1000000000000000;
            leds     = 16'b1000000000000000;

        #10 $finish;
    end

endmodule
