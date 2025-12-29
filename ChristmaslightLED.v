`timescale 1ns / 1ps
module ChristmaslightLED(
    input  wire       clk,      // system clock
    input  wire       reset_n,  // active-low async reset
    output reg  [3:0] leds      // {LED4, LED3, LED2, LED1}
);

    // State encoding
    localparam S0 = 2'd0;
    localparam S1 = 2'd1;
    localparam S2 = 2'd2;
    localparam S3 = 2'd3;

    reg [1:0] state, next_state;

    // State register (sequential)
	 always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        state <= S0;
        leds  <= 4'b0001;
    end 
	 else
	   begin
        case (state)
            S0: begin state <= S1; leds <= 4'b0010; end
            S1: begin state <= S2; leds <= 4'b0100; end
            S2: begin state <= S3; leds <= 4'b1000; end
            S3: begin state <= S0; leds <= 4'b0001; end
        endcase
      end
   end

endmodule
