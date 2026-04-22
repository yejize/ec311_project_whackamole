`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2026 11:15:21 AM
// Design Name: 
// Module Name: led_blink
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


module led_blink(
    input clk,       
    input rst,
    output reg [3:0] leds  
);

reg [2:0] led_index; 

always @(posedge clk or posedge rst)
begin
    if (rst == 1) begin
        led_index <= 0;
        leds <= 4'b0000;
    end
    else begin
        leds <= (4'b1111 >> (3 - led_index));  // fills all bits up to current index
        if (led_index == 3)
            led_index <= 0;
        else
            led_index <= led_index + 1;
    end
end

endmodule
