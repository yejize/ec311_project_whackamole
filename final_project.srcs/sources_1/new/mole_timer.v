`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2026 05:16:57 PM
// Design Name: 
// Module Name: mole_timer
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

module mole_timer(
    input clk_in,
    input rst,
    output reg divided_clk
);

parameter toggle_value = 99_999_999; 

reg [26:0] cnt;

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

