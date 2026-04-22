`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2026 04:57:30 PM
// Design Name: 
// Module Name: hit_detect
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


module hit_detect(
    input clk,
    input [15:0] switches,
    input [15:0] leds,
    output [6:0] cathode,
    output [7:0] anode,
    output [15:0] score_out
);

    reg [15:0] score;
    reg [15:0] switches_prev;

    initial begin
        score = 0;
        switches_prev = 0;
    end

    assign score_out = score;

    counter d(.clock(clk), .number(score), .cathode(cathode), .anode(anode));

    always @(posedge clk) begin
        switches_prev <= switches;

        if ((switches == leds) && (switches_prev != leds))
            score <= score + 1;
    end

endmodule