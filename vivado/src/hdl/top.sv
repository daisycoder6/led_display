// Starting Design point with a heartbeat clock

`timescale 1ns/100ps



module design_top(

input                   rstP,
input                   clk,
input                   refresh_clk_en,
output                  heartbeat,
output     logic [6:0]  segment,
output     logic [3:0]  anode
//                  output        sync_button_press
);


wire    rstN;
wire    MHz5_clk;
wire    slow1Hz;
wire    refresh_1kHz;
wire    refresh_1kHz_out;

// wire    clk_div_out;

//wire    sync_reset_fall;
assign heartbeat = slow1Hz;


CLK5M clk_inst0(

.clk_in1(clk),          // input clk 
.resetn(rstN),
.clkout5M(MHz5_clk),     // output clk_div_top
.locked(pll_lock)
);

async_reset asyncr(

.clk(clk),              // Clock
.asyncrst_p(rstP),     // Asynchronous Reset in
.rst_n(rstN)          // Sync resetN output
);


// slowclock clk_1Hz_pin(
//             .clk(MHz5_clk),
//             .clear(clear_top),
//             .slow_clk(clk_div_top)
//             );

clk_ndiv #(.divider(2500000))

clk_1Hz(

.clk(MHz5_clk),
.rstN(rstN),
.clk_out(slow1Hz)
);

clk_ndiv #(.divider(2500))

clk_1kHz(

.clk(MHz5_clk),
.rstN(rstN),
.clk_out(refresh_1kHz)
);


gated_clk gated_1kHz(

.clk(MHz5_clk),
.gate_clk_in(refresh_1kHz),
.clk_en(refresh_clk_en),
.rstN(rstN),
.gate_clk_out(refresh_1kHz_out)
);

led_driver led_driver0(

.rstN(rstN),
.clk(refresh_1kHz_out),
.segment(segment),
.anode(anode)

);


endmodule

// lfsr testbench
