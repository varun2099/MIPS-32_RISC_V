`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 01:41:02 AM
// Design Name: 
// Module Name: Write_Back_Cycle
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


module Write_Back_Cycle(clk,rst,Result_Src_W,Read_Data_W,ALU_Result_W,PC_plus_4W,Result_W);

input clk,rst,Result_Src_W;
input [31:0] PC_plus_4W,ALU_Result_W,Read_Data_W;

output [31:0] Result_W;

mux Result_mux_W(.a(ALU_Result_W),.b(Read_Data_W),.s(Result_Src_W),.c(Result_W));


endmodule
