`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 08:43:13 AM
// Design Name: 
// Module Name: fsm
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


module fsm(
        input clock,
        input [15:0] sixteen_bit_number,
        output [6:0] cathode,
        output reg [7:0] anode
    );
    
    reg [3:0] four_bit_number;
    // instantiate decoder that decodes the four bit number into the cathode
    decoder DUT(.number(four_bit_number), .cathode(cathode));
    reg [1:0] state; // stores state of FSM
    
    initial begin
		state = 0;
		anode = 8'b11111111;
	end
    
    always @(posedge clock) begin
        state <= state + 1;
    
        case(state)
            0: begin anode <= 8'b11111110; four_bit_number <= sixteen_bit_number[3:0];   end
            1: begin anode <= 8'b11111101; four_bit_number <= sixteen_bit_number[7:4];   end
            2: begin anode <= 8'b11111011; four_bit_number <= sixteen_bit_number[11:8];  end
            3: begin anode <= 8'b11110111; four_bit_number <= sixteen_bit_number[15:12]; end
        endcase
    end
endmodule
