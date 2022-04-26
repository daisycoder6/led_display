`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2022 10:21:43 PM
// Design Name: 
// Module Name: gated_clk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gated_clk(

input           clk,
input           gate_clk_in,
input           clk_en,
input           rstN,
output  logic   gate_clk_out
);

always_ff @(posedge clk, negedge rstN)
    if (rstN == 0) gate_clk_out <= 0;
    else if (clk_en) gate_clk_out <= gate_clk_in;
    

endmodule
