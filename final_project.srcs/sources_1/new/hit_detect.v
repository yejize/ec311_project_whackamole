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
    input rst,
    input [15:0] switches,
    input [15:0] leds,
    output [6:0] cathode,
    output [7:0] anode,
    output [15:0] score_out
);
    reg [15:0] score;
    reg [15:0] switches_prev;

    assign score_out = score;
    counter d(.clock(clk), .number(score), .cathode(cathode), .anode(anode));

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            score        <= 0;
            switches_prev <= 0;
        end else begin
            switches_prev <= switches;
            if ((switches == leds) && (switches_prev != leds) && (leds != 0))
                score <= score + 1;
        end
    end
endmodule