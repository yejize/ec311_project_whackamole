`timescale 1ns / 1ps
module mole_main_tb;

reg CLK100MHZ;
reg rst;
reg [15:0] switches;
wire [15:0] leds;
wire [6:0] cathode;
wire [7:0] anode;

mole_main uut(
    .CLK100MHZ(CLK100MHZ),
    .rst(rst),
    .switches(switches),
    .leds(leds),
    .cathode(cathode),
    .anode(anode)
);

always #5 CLK100MHZ = ~CLK100MHZ;

initial begin
    CLK100MHZ = 0;
    rst = 1;
    switches = 16'b0;
    
    #20;
    rst = 0;
    
    #100;
    switches = leds;
    #20;
    switches = 16'b0;
    
    #100;
    switches = leds;
    #20;
    switches = 16'b0;
    
    #100;
    switches = 16'hFFFF;
    #20;
    switches = 16'b0;
    
    #200;
    $finish;
end

endmodule