`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 03:22:09 PM
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(ALU_Op,funct3,funct7,op,ALU_Control);

    input [1:0]ALU_Op;
    input [2:0]funct3;
    input [6:0]funct7,op;
    output [2:0]ALU_Control;
    assign ALU_Control = (ALU_Op == 2'b00) ? 3'b000 :
                        (ALU_Op == 2'b01) ? 3'b001 :
                        ((ALU_Op == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} == 2'b11)) ? 3'b001 : 
                        ((ALU_Op == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} != 2'b11)) ? 3'b000 : 
                        ((ALU_Op == 2'b10) & (funct3 == 3'b010)) ? 3'b101 : 
                        ((ALU_Op == 2'b10) & (funct3 == 3'b110)) ? 3'b011 : 
                        ((ALU_Op == 2'b10) & (funct3 == 3'b111)) ? 3'b010 : 
                                                                  3'b000 ;
endmodule