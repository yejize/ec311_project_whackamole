module buzzer (
    input  wire CLK100MHZ,
    input  wire enable,
    output reg  buzzer_out       // connects to JA1 → your external buzzer
);
    parameter  CLOCK_FREQ = 100_000_000;
    parameter  TONE_FREQ  = 440;
    localparam COUNT_MAX  = CLOCK_FREQ / (2 * TONE_FREQ) - 1;

    reg [16:0] counter = 0;

    always @(posedge CLK100MHZ) begin
        if (!enable) begin
            counter    <= 0;
            buzzer_out <= 0;
        end else begin
            if (counter >= COUNT_MAX) begin
                counter    <= 0;
                buzzer_out <= ~buzzer_out;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule