module clk25MHz (
    input wire clk100MHz,    // Input: 100 MHz clock from Basys 3
    input wire reset,
    output reg clk25MHz      // Output: 25 MHz clock
);

    reg [1:0] counter = 0;

    always @(posedge clk100MHz or posedge reset) begin
        if (reset)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    always @(posedge clk100MHz) begin
        clk25MHz <= counter[1];  // Divide by 4 → 100 MHz / 4 = 25 MHz
    end

endmodule
