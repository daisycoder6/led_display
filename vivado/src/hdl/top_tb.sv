
`timescale 1ns/100ps
module top_tb();

reg                 clk0_tb;
reg                 rstP_tb;


// wire                [3:0]out1tb;
//wire                button_tb;
//wire                [7:0]Q_tb;
wire                 heartbeat_tb;
logic                refresh_clk_en_tb;

logic       [6:0]    segment_tb;
logic       [3:0]    anode_tb;
//wire                [31:0]count_tb;

//.clk(MHz5_clk),
//.gate_clk_in(refresh_1kHz),
//.clk_en(refresh_clk_en_tb),
//.rstN(rstN),
//.gate_clk_out(refresh_1kHz_out)
//);
// event               testOut1;


//counter counter_inst0(
//                      .clk(clk0_tb),
//                      .clear(rstP_tb),
//                      .Q(Q_tb)
//                      );


//clkdiv clkdiv_inst0(
//                      .clk(clk0_tb),
//                      .clear(rstP_tb),
//                      .clk_div(clkdiv_tb),//                      .clk(clk0_tb),
//                      .clear(rstP_tb),
//                      .clk_div(clkdiv_tb),
//                      .count(count_tb)
//                      );

//lfsr lfsr_inst0(
//                .nextlfsr(nextlfsr_tb),
//                .clear(rstP_tb),
//                .seed(4'b1001),
//                .state(out1tb)
//                );

design_top design_inst0(

.rstP(rstP_tb),
.clk(clk0_tb),
.heartbeat(heartbeat_tb),
.refresh_clk_en(refresh_clk_en_tb),
.segment(segment_tb),
.anode(anode_tb)
//                        .sync_button_press(button_tb)
                        );

// set clock going
initial begin
    clk0_tb=1'b1;
    forever #10 clk0_tb = ~clk0_tb;
end


// toggle reset
initial begin
    clk0_tb = 1'b1;
    // rstP_tb = 1'b0;
    #800
    rstP_tb = 1'b0;
    #200
    rstP_tb = 1'b1;
    #250
    rstP_tb = 1'b0;
    // #2000
    // rstP_tb = 1'b0;
    // #8000
    // rstP_tb = 1'b1;
    // #2000
    // rstP_tb = 1'b0;
end


// toggle refresh clk en
initial begin
    refresh_clk_en_tb = 1'b1;
    // rstP_tb = 1'b0;
    #8ms
    refresh_clk_en_tb = 1'b0;

end

//  initial begin
//     nextlfsr_tb = 1'b0;
//     #100
//     nextlfsr_tb = 1'b1;
//     #100
//     nextlfsr_tb = 1'b0;
//     #200
//     nextlfsr_tb = 1'b1;
//     #200
//     nextlfsr_tb = 1'b0;
//     #100
//     nextlfsr_tb = 1'b1;
//     #200
//     nextlfsr_tb = 1'b0;
// end

// always @(posedge clk0_tb)
// begin
//     $display("%b", out1tb);
// //        $display("%b", design_inst0.sync_reset);
// //        $display("%b", design_inst0.lfsr_inst0.newbit);
// //        $display("%b", design_inst0.sync_button_press);


// end





initial begin
    $dumpfile("lfsr_wave_values.vcd");

    //          $dumpvars(0, andgate_tb); // dumps all signals UNDER andgate_tb
    //          $dumpvars(1, andgate_tb); // dumps all signals in the instance andgate_tb only
    //          $dumpvars(2, andgate_tb); // dumps all signals in the instance andgate_tb and 1 level below

    $dumpvars(0, top_tb); // dumpas all signals in andgate_tb and below

    // preset4_tb = 1'b1;
    repeat(2000000)
    @(posedge clk0_tb); //tick 2 start
    #4
    $stop;
    $finish;
end

endmodule