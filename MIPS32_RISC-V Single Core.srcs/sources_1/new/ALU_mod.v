`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 10:45:28 PM
// Design Name: 
// Module Name: ALU_mod
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
//C = Carry,Z = Zero, N = Negative

module ALU_mod(A,B,Result,ALU_Control,OverFlow,C,Z,N);

    input [31:0]A,B;
    input [2:0]ALU_Control;
    output C,OverFlow,Z,N;
    output [31:0]Result;

    wire Cout;
    wire [31:0]Sum;

    assign Sum = (ALU_Control[0] == 1'b0) ? A + B :
                                          (A + ((~B)+1)) ;
    assign {Cout,Result} = (ALU_Control == 3'b000) ? Sum :
                           (ALU_Control == 3'b001) ? Sum :
                           (ALU_Control == 3'b010) ? A & B :
                           (ALU_Control == 3'b011) ? A | B :
                           (ALU_Control == 3'b101) ? {{32{1'b0}},(Sum[31])} :
                           {33{1'b0}};
    assign OverFlow = ((Sum[31] ^ A[31]) & 
                      (~(ALU_Control[0] ^ B[31] ^ A[31])) &
                      (~ALU_Control[1]));
    assign C = ((~ALU_Control[1]) & Cout);
    assign Z = &(~Result);
    assign N = Result[31];

endmodule