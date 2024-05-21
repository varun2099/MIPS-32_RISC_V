`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 02:49:41 PM
// Design Name: 
// Module Name: Decode_Cycle
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

module Decode_Cycle(clk,rst,Instr_D,PCD,PC_plus_4D,Reg_Write_W,Rd_W,Result_W,Reg_Write_E, ALU_Src_E, Mem_Write_E, Result_Src_E,
    Branch_E,  ALU_Control_E, Rd1_E, Rd2_E, Imm_Ext_E, Rd_E, PCE, PC_plus_4E, RS1_E, RS2_E);

input clk,rst,Reg_Write_W;
input [4:0] Rd_W;
input [31:0] Instr_D,PCD,PC_plus_4D,Result_W;

 output Reg_Write_E,ALU_Src_E,Mem_Write_E,Result_Src_E,Branch_E;
    output [2:0] ALU_Control_E;
    output [31:0] Rd1_E, Rd2_E, Imm_Ext_E;
    output [4:0] RS1_E, RS2_E, Rd_E;
    output [31:0] PCE, PC_plus_4E;

wire Reg_Write_D,ALU_Src_D,Mem_Write_D,Branch_D,Result_Src_D;
wire [1:0] Imm_Src_D;
wire [2:0] ALU_Control_D;
wire [31:0] RD1_D,RD2_D,Imm_Ext_D;

reg  Reg_Write_D_r,ALU_Src_D_r,Mem_Write_D_r,Branch_D_r,Result_Src_D_r;
reg [2:0] ALU_Control_D_r;
reg [31:0] Rd1_D_r,Rd2_D_r,Imm_Ext_D_r;
reg [4:0] Rd_D_r, RS1_D_r, RS2_D_r;
reg [31:0] PCD_r,PC_plus_4D_r;

Control_Unit control(.Op(Instr_D[6:0]),.Reg_Write(Reg_Write_D),.Imm_Src(Imm_Src_D),.ALU_Src(ALU_Src_D),.Mem_Write(Mem_Write_D),.Result_Src(Result_Src_D),.Branch(Branch_D),.funct3(Instr_D[14:12]),.funct7(Instr_D[30]),.ALU_Control(ALU_Control_D));

Register_File register_file(.clk(clk),.rst(rst),.WE3(Reg_Write_W),.WD3(Result_W),.A1(Instr_D[19:15]),.A2(Instr_D[24:20]),.A3(Rd_W),.RD1(RD1_D),.RD2(RD2_D));

Sign_Extend sign_extension(.In(Instr_D[31:7]),.Imm_Src(Imm_Src_D),.Imm_Ext(Imm_Ext_D));

 always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            Reg_Write_D_r <= 1'b0;
            ALU_Src_D_r <= 1'b0;
            Mem_Write_D_r <= 1'b0;
            Result_Src_D_r <= 1'b0;
            Branch_D_r <= 1'b0;
            ALU_Control_D_r <= 3'b000;
            Rd1_D_r <= 32'h00000000; 
            Rd2_D_r <= 32'h00000000; 
            Imm_Ext_D_r <= 32'h00000000;
            Rd_D_r <= 5'h00;
            PCD_r <= 32'h00000000; 
            PC_plus_4D_r <= 32'h00000000;
            RS1_D_r <= 5'h00;
            RS2_D_r <= 5'h00;
        end
        else begin
            Reg_Write_D_r <= Reg_Write_D;
            ALU_Src_D_r <= ALU_Src_D;
            Mem_Write_D_r <= Mem_Write_D;
            Result_Src_D_r <= Result_Src_D;
            Branch_D_r <= Branch_D;
            ALU_Control_D_r <= ALU_Control_D;
            Rd1_D_r <= RD1_D; 
            Rd2_D_r <= RD2_D; 
            Imm_Ext_D_r <= Imm_Ext_D;
            Rd_D_r <= Instr_D[11:7];
            PCD_r <= PCD; 
            PC_plus_4D_r <= PC_plus_4D;
            RS1_D_r <= Instr_D[19:15];
            RS2_D_r <= Instr_D[24:20];
        end
    end
      assign Reg_Write_E = Reg_Write_D_r;
      assign ALU_Src_E = ALU_Src_D_r;
      assign Mem_Write_E = Mem_Write_D_r;
      assign Result_Src_E = Result_Src_D_r;
      assign Branch_E = Branch_D_r;
      assign ALU_Control_E = ALU_Control_D_r;
      assign Rd1_E = Rd1_D_r;
      assign Rd2_E = Rd2_D_r;
      assign Imm_Ext_E = Imm_Ext_D_r;
      assign Rd_E = Rd_D_r;
      assign PCE = PCD_r;
      assign PC_plus_4E = PC_plus_4D_r;
      assign RS1_E = RS1_D_r;
      assign RS2_E = RS2_D_r;

endmodule
