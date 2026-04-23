`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2026 08:00:17 AM
// Design Name: 
// Module Name: led_timer
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


module led_timer(
    input clk_in,
    input rst,
    output reg divided_clk
);

parameter toggle_value = 49_999_999; 

reg [25:0] cnt;

always @(posedge clk_in or posedge rst)
begin
    if (rst == 1) begin
        cnt <= 0;
        divided_clk <= 0;
    end
    else begin
        if (cnt == toggle_value) begin
            cnt <= 0;
            divided_clk <= ~divided_clk;
        end
        else begin
            cnt <= cnt + 1;
            divided_clk <= divided_clk;
        end
    end
end

endmodule