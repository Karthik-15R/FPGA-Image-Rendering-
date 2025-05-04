module top_image_display(
    input wire clk,               // 100 MHz from BASYS3
    input wire reset,             // Add reset input
    output wire hsync,
    output wire vsync,
    output wire [3:0] vga_red,
    output wire [3:0] vga_green,
    output wire [3:0] vga_blue
);

    wire clk25;                  // 25 MHz clock wire
    wire [9:0] hcount, vcount;
    wire blank;
    wire [7:0] pixel;
    reg [14:0] rom_addr;

    // Instantiate clock divider
    clk25MHz clock_divider(
        .clk100MHz(clk),
        .reset(reset),
        .clk25MHz(clk25)
    );

    // Instantiate VGA controller with 25 MHz clock
    vga_controller vga(
        .clk(clk25),            // Changed to 25 MHz clock
        .hsync(hsync),
        .vsync(vsync),
        .hcount(hcount),
        .vcount(vcount),
        .blank(blank)
    );

    // Map 640x480 to 160x120 image
    wire [7:0] x_img = hcount[9:2];  // divide by 4
    wire [7:0] y_img = vcount[9:2];  // divide by 4

    always @(*) begin
        if (hcount < 640 && vcount < 480 &&
            x_img < 160 && y_img < 120) begin
            rom_addr = y_img * 160 + x_img;
        end else begin
            rom_addr = 0;
        end
    end

    // Instantiate ROM with 25 MHz clock
    image_rom_wrapper rom (
        .clk(clk25),            // Changed to 25 MHz clock
        .addr(rom_addr),
        .pixel(pixel)
    );

    // Output grayscale pixel to RGB channels
    assign vga_red   = pixel[7:4];
    assign vga_green = pixel[7:4];
    assign vga_blue  = pixel[7:4];

endmodule
