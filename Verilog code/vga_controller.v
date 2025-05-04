module vga_controller (
    input wire clk,
    output reg hsync,
    output reg vsync,
    output wire [9:0] hcount,
    output wire [9:0] vcount,
    output wire blank
);

    // VGA 640x480 @ 60Hz timings
    parameter H_DISPLAY       = 640;
    parameter H_FRONT_PORCH   = 16;
    parameter H_SYNC_PULSE    = 96;
    parameter H_BACK_PORCH    = 48;
    parameter H_TOTAL         = 800;

    parameter V_DISPLAY       = 480;
    parameter V_FRONT_PORCH   = 10;
    parameter V_SYNC_PULSE    = 2;
    parameter V_BACK_PORCH    = 33;
    parameter V_TOTAL         = 525;

    reg [9:0] h_cnt = 0;
    reg [9:0] v_cnt = 0;

    always @(posedge clk) begin
        if (h_cnt == H_TOTAL - 1) begin
            h_cnt <= 0;
            if (v_cnt == V_TOTAL - 1)
                v_cnt <= 0;
            else
                v_cnt <= v_cnt + 1;
        end else begin
            h_cnt <= h_cnt + 1;
        end
    end

    assign hcount = h_cnt;
    assign vcount = v_cnt;

    always @(*) begin
        hsync = ~((h_cnt >= H_DISPLAY + H_FRONT_PORCH) &&
                  (h_cnt <  H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE));
        vsync = ~((v_cnt >= V_DISPLAY + V_FRONT_PORCH) &&
                  (v_cnt <  V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE));
    end

    assign blank = (h_cnt < H_DISPLAY && v_cnt < V_DISPLAY) ? 1'b0 : 1'b1;

endmodule
