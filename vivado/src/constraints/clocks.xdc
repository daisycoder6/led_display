create_clock -period 10.000 -name sys_Clk_pin -waveform {0.000 5.000} -add [get_ports clk]
create_generated_clock -name heartbeat -source [get_pins clk_1Hz/clk_out] -divide_by 100000000 [get_pins clk_1Hz/clk_out_OBUF]
create_generated_clock -name refresh_1kHz -source [get_pins clk_1kHz/clk_out] -divide_by 100000 [get_pins clk_1kHz/clk_out_OBUF]




set_input_delay -clock [get_clocks sys_Clk_pin] -min -add_delay 2.000 [get_ports rstP]
set_input_delay -clock [get_clocks sys_Clk_pin] -max -add_delay 6.000 [get_ports rstP]
#set_input_delay -clock [get_clocks sys_Clk_pin] -min -add_delay 2.000 [get_ports buttonpress_top]
#set_input_delay -clock [get_clocks sys_Clk_pin] -max -add_delay 6.000 [get_ports buttonpress_top]