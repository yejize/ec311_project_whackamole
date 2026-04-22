`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:31 11/27/2017 
// Design Name: 
// Module Name:    Cloc_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Clock_divider(
    input in_clk,      // 100 MHz clock
    output reg out_clk // 1 Hz clock
);
	
	reg[32:0] count;

	initial begin
		// initialize everything to zero
	end
	
	always @(negedge in_clk)
	begin
		// increment count by one (use blocking assignment)
		
		// if count equals to some big number (that you need to calculate),
		//     (Think: how many input clock cycles do you need to see 
		//     for it to be half a second)
		
		//     then flip the output clock,   (use non-blocking assignment)
		//     and reset count to zero.      (use non-blocking assignment)
	end


endmodule
