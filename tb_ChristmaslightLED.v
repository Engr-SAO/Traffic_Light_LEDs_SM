`timescale 1ns/1ps

module tb_ChristmaslightLED;
    reg        clk;
    reg        reset_n;
    wire [3:0] leds;
	   integer i;

    // DUT instance
    ChristmaslightLED dut (
        .clk    (clk),
        .reset_n(reset_n),
        .leds   (leds)
    );

   // Clock: 50 MHz (20 ns period)
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
      

        // Apply reset
        reset_n = 0;
        #50;
        reset_n = 1;

        // Wait for 4 rising edges after reset is released
        for (i = 0; i < 4; i = i + 1) begin
            @(posedge clk);
        end

        // Optional: small delay so the last state is clearly visible
        #20;

        // Stop simulation here (wave shows 4 states)
        $stop;     // or $finish;
    end
endmodule
