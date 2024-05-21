`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2024 02:30:16 AM
// Design Name: 
// Module Name: Pipelining
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


module Pipelining(clk,rst);

input clk,rst;

  wire PC_Src_E, Reg_Write_W, Reg_Write_E, ALU_Src_E, Mem_Write_E, Result_Src_E, Branch_E, Reg_Write_M, Mem_Write_M, Result_Src_M, Result_Src_W;
    wire [2:0] ALU_Control_E;
    wire [4:0] Rd_E, Rd_M, Rd_W;
    wire [31:0] PC_target_E, Instr_D, PCD, PC_plus_4D, Result_W, Rd1_E, Rd2_E, Imm_Ext_E, PCE, PC_plus_4E, PC_plus_4M, Write_Data_M, ALU_Result_M;
    wire [31:0] PC_plus_4W, ALU_Result_W, Read_Data_W;
    wire [4:0] RS1_E, RS2_E;
    
     // Fetch Stage
       Fetch_Cycle Fetch (
                           .clk(clk), 
                           .rst(rst), 
                           .PC_Src_E(PC_Src_E), 
                           .PC_target_E(PC_target_E), 
                           .Instr_D(Instr_D), 
                           .PCD(PCD), 
                           .PC_plus_4D(PC_plus_4D)
                       );
   
       // Decode Stage
       Decode_Cycle Decode (
                           .clk(clk), 
                           .rst(rst), 
                           .Instr_D(Instr_D), 
                           .PCD(PCD), 
                           .PC_plus_4D(PC_plus_4D), 
                           .Reg_Write_W(Reg_Write_W), 
                           .Rd_W(Rd_W), 
                           .Result_W(Result_W), 
                           .Reg_Write_E(Reg_Write_E), 
                           .ALU_Src_E(ALU_Src_E), 
                           .Mem_Write_E(Mem_Write_E), 
                           .Result_Src_E(Result_Src_E),
                           .Branch_E(Branch_E),  
                           .ALU_Control_E(ALU_Control_E), 
                           .Rd1_E(Rd1_E), 
                           .Rd2_E(Rd2_E), 
                           .Imm_Ext_E(Imm_Ext_E), 
                           .Rd_E(Rd_E), 
                           .PCE(PCE), 
                           .PC_plus_4E(PC_plus_4E),
                           .RS1_E(RS1_E),
                           .RS2_E(RS2_E)
                       );
   
             Execute_Cycle Execute (
                           .clk(clk), 
                           .rst(rst), 
                           .Reg_Write_E(Reg_Write_E), 
                           .ALU_Src_E(ALU_Src_E), 
                           .Mem_Write_E(Mem_Write_E), 
                           .Result_Src_E(Result_Src_E), 
                           .Branch_E(Branch_E), 
                           .ALU_Control_E(ALU_Control_E), 
                           .Rd1_E(Rd1_E), 
                           .Rd2_E(Rd2_E), 
                           .Imm_Ext_E(Imm_Ext_E), 
                           .Rd_E(Rd_E), 
                           .PCE(PCE), 
                           .PC_plus_4E(PC_plus_4E), 
                           .PC_Src_E(PC_Src_E), 
                           .PC_target_E(PC_target_E), 
                           .Reg_Write_M(Reg_Write_M), 
                           .Mem_Write_M(Mem_Write_M), 
                           .Result_Src_M(Result_Src_M), 
                           .Rd_M(Rd_M), 
                           .PC_plus_4M(PC_plus_4M), 
                           .Write_Data_M(Write_Data_M), 
                           .ALU_Result_M(ALU_Result_M)
                         
                          
                       );
       
       // Memory Stage
       Memory_Cycle Memory (
                           .clk(clk), 
                           .rst(rst), 
                           .Reg_Write_M(Reg_Write_M), 
                           .Mem_Write_M(Mem_Write_M), 
                           .Result_Src_M(Result_Src_M), 
                           .Rd_M(Rd_M), 
                           .PC_plus_4M(PC_plus_4M), 
                           .Write_Data_M(Write_Data_M), 
                           .ALU_Result_M(ALU_Result_M), 
                           .Reg_Write_W(Reg_Write_W), 
                           .Result_Src_W(Result_Src_W), 
                           .Rd_W(Rd_W), 
                           .PC_plus_4W(PC_plus_4W), 
                           .ALU_Result_W(ALU_Result_W), 
                           .Read_Data_W(Read_Data_W)
                       );
   
       // Write Back Stage
       Write_Back_Cycle Write_Back (
                           .clk(clk), 
                           .rst(rst), 
                           .Result_Src_W(Result_Src_W), 
                           .PC_plus_4W(PC_plus_4W), 
                           .ALU_Result_W(ALU_Result_W), 
                           .Read_Data_W(Read_Data_W), 
                           .Result_W(Result_W)
                       );

endmodule
