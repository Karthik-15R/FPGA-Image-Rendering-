module image_rom_wrapper (
    input wire clk,
    input wire [14:0] addr,  // 19200 locations → 15-bit address
    output wire [7:0] pixel
);

    img_fpga IMG2FPGA (
        .clka(clk),
        .addra(addr),
        .douta(pixel)
    );

endmodule
