`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2026 11:11:24 AM
// Design Name: 
// Module Name: clk_divider_1s
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

module clk_divider_1s(
	input clk_in,
	input rst,
	output reg divided_clk
    );
	 
	 
parameter toggle_value = 49999999; // TODO: Calculate correct value

	 
reg[32:0] cnt;

always@(posedge clk_in or posedge rst)
begin
	if (rst==1) begin
		cnt <= 0;
		divided_clk <= 0;
	end
	else begin
		if (cnt==toggle_value) begin
			cnt <= 0;
			divided_clk <= ~divided_clk;
		end
		else begin
			cnt <= cnt +1;
			divided_clk <= divided_clk;		
		end
	end

end
