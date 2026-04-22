`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 09:14:50 AM
// Design Name: 
// Module Name: counter_test
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


module counter_test(

    );
    
    reg clock; 
    reg [15:0]number;
    wire [6:0] cathode;
    wire [7:0] anode;
    
    counter DUT (
        .clock(clock),
        .number(number),
        .cathode(cathode),
        .anode(anode)
    ); 
    
    // Clock generator
    always #1 clock = ~clock;
    always #20 number = number + 1;
    
    initial begin
        clock = 0;
        number = 0;
    end
    initial #1000 $finish;
    
endmodule
