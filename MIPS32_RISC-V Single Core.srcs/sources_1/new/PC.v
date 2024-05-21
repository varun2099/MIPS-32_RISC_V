`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 11:13:04 PM
// Design Name: 
// Module Name: PC
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

//Program Counter
module PC_mod (clk,rst,PC,PC_nxt);
 input [31:0] PC_nxt;
 input clk,rst;
 
 output [31:0] PC;
 reg [31:0] PC;
 always @(posedge clk) 
 begin
  if (~rst == 1'b0)
   PC <= (32'b0);
   else 
    PC <= PC_nxt;
 end
endmodule
