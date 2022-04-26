`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2022 02:23:52 PM
// Design Name: 
// Module Name: led_driver
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


module led_driver(

input                   rstN,       // Reset
input                   clk,        // Scan Clock
//input                   D3,         // D3 dates
//input                   D2,         // D3 dates
//input                   D1,         // D3 dates
//input                   D0,         // D3 dates
output     logic [6:0]  segment,
output     logic [3:0]  anode

);

typedef enum logic[6:0] {

one     =   7'b1111001,
two     =   7'b0100100,
three   =   7'b0110000,
four    =   7'b0011001,
five    =   7'b0010010,
six     =   7'b0000010,
seven   =   7'b1111000,
eight   =   7'b00000000,
nine    =   7'b0010000

} digits_def;


typedef enum logic [2:0] {

RESET   = 3'b000,
DIGIT3  = 3'b001,
DIGIT2  = 3'b010,
DIGIT1  = 3'b011,
DIGIT0  = 3'b100

} states_t;

states_t state, next_state;
digits_def number;




//digits;

// State Sequencer

always_ff @(posedge clk or negedge rstN)
    if (!rstN)
        state <= RESET;
    else
        state <= next_state;
        
// Next State Logic

always_comb begin
    unique case (state)
        RESET:
            next_state = DIGIT3; //Move out of reset
        DIGIT3:
            next_state = DIGIT2;
        DIGIT2:
            next_state = DIGIT1;
        DIGIT1:
            next_state = DIGIT0;
        DIGIT0:
            next_state = DIGIT3;
         
         endcase
     end
     
always_comb begin
    unique case (state)
        RESET: { anode, segment} = 9'b000000000;//{4'b0000, number=one};
        DIGIT3: { anode, segment} = {4'b0111, nine};
        DIGIT2: { anode, segment} = {4'b1011, one};
        DIGIT1: { anode, segment} = {4'b1101, one};
        DIGIT0: { anode, segment} = {4'b1110, three};
      endcase
    end
        

endmodule
