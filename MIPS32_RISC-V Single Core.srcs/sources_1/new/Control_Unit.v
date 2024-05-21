`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 03:28:35 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(Op,Reg_Write,Imm_Src,ALU_Src,Mem_Write,Result_Src,Branch,funct3,funct7,ALU_Control);

    input [6:0]Op,funct7;
    input [2:0]funct3;
    output Reg_Write,ALU_Src,Mem_Write,Result_Src,Branch;
    output [1:0]Imm_Src;
    output [2:0]ALU_Control;

    wire [1:0]ALU_Op;

    M_Decoder Main_Decoder(
                .Op(Op),
                .Reg_Write(Reg_Write),
                .Imm_Src(Imm_Src),
                .Mem_Write(Mem_Write),
                .Result_Src(Result_Src),
                .Branch(Branch),
                .ALU_Src(ALU_Src),
                .ALU_Op(ALU_Op)
    );

    ALU_Decoder ALU_decoder(
                            .ALU_Op(ALU_Op),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(Op),
                            .ALU_Control(ALU_Control)
    );


endmodule


