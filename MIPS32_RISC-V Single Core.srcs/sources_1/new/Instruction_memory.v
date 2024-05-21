`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 11:38:18 PM
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(rst,A,rd);
 input rst;
 input [31:0] A;
 output [31:0] rd;
 reg [31:0] mem [1023:0];
 assign rd = (rst==1'b0) ? 32'b0 : mem[A[31:2]];
 
endmodule
