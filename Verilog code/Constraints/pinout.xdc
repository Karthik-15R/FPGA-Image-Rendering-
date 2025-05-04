## Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## VGA Horizontal Sync
set_property PACKAGE_PIN P5 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]

## VGA Vertical Sync
set_property PACKAGE_PIN P6 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

## VGA Red (4 bits)
set_property PACKAGE_PIN R5 [get_ports {vga_red[0]}]
set_property PACKAGE_PIN R6 [get_ports {vga_red[1]}]
set_property PACKAGE_PIN R7 [get_ports {vga_red[2]}]
set_property PACKAGE_PIN R8 [get_ports {vga_red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_red[*]}]

## VGA Green (4 bits)
set_property PACKAGE_PIN N5 [get_ports {vga_green[0]}]
set_property PACKAGE_PIN N6 [get_ports {vga_green[1]}]
set_property PACKAGE_PIN N7 [get_ports {vga_green[2]}]
set_property PACKAGE_PIN N8 [get_ports {vga_green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_green[*]}]

## VGA Blue (4 bits)
set_property PACKAGE_PIN L5 [get_ports {vga_blue[0]}]
set_property PACKAGE_PIN L6 [get_ports {vga_blue[1]}]
set_property PACKAGE_PIN L7 [get_ports {vga_blue[2]}]
set_property PACKAGE_PIN L8 [get_ports {vga_blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vga_blue[*]}]

set_property PACKAGE_PIN P19 [get_ports hsync]
set_property PACKAGE_PIN R19 [get_ports vsync]
set_property PACKAGE_PIN J18 [get_ports {vga_blue[3]}]
set_property PACKAGE_PIN K18 [get_ports {vga_blue[2]}]
set_property PACKAGE_PIN L18 [get_ports {vga_blue[1]}]
set_property PACKAGE_PIN N18 [get_ports {vga_blue[0]}]
set_property PACKAGE_PIN D17 [get_ports {vga_green[3]}]
set_property PACKAGE_PIN G17 [get_ports {vga_green[2]}]
set_property PACKAGE_PIN H17 [get_ports {vga_green[1]}]
set_property PACKAGE_PIN J17 [get_ports {vga_green[0]}]
set_property PACKAGE_PIN N19 [get_ports {vga_red[3]}]
set_property PACKAGE_PIN J19 [get_ports {vga_red[2]}]
set_property PACKAGE_PIN H19 [get_ports {vga_red[1]}]
set_property PACKAGE_PIN G19 [get_ports {vga_red[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN T17 [get_ports reset]
