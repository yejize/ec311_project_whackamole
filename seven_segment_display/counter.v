`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 09:05:20 AM
// Design Name: 
// Module Name: counter
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


module counter(
        input clock, // 100 MHz clock from the board
        input [15:0]number,
        output [6:0] cathode,
        output [7:0] anode
    );
    wire seconds_clock; // 1 Hz
	wire fsm_clock;     // 1 kHz
    reg [15:0] counter; // this is the number we want to display
    // instantiate the clock divider to drive the 1 Hz signal
    initial begin
        counter = 0;
    end
    
    Clock_divider DUT(.in_clk(clock), .out_clk(seconds_clock));
    // instantiate the faster clock divider to drive the 1 kHz signal
    faster_clock_divider UUT(.in_clk(clock), .out_clk(fsm_clock));
	// instantiate the FSM using the fsm_clock signal
    fsm YUT(.clock(fsm_clock), .sixteen_bit_number(number), .cathode(cathode), .anode(anode));
    
    always @(posedge seconds_clock)
	begin
		// increment counter
        counter <= counter + 1;
	end
	
endmodule
