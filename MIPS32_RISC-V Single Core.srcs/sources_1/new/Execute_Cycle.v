`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 10:29:56 PM
// Design Name: 
// Module Name: Execute_Cycle
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


module Execute_Cycle(clk,rst,Reg_Write_E,ALU_Src_E,Mem_Write_E,Result_Src_E,Branch_E,ALU_Control_E, Rd1_E, Rd2_E,Imm_Ext_E,Rd_E,PCE,PC_plus_4E,PC_Src_E,PC_target_E,Reg_Write_M,Mem_Write_M,Result_Src_M, Rd_M, PC_plus_4M, Write_Data_M, ALU_Result_M);
   
    input Reg_Write_E,ALU_Src_E,Mem_Write_E,Result_Src_E,Branch_E;
    input clk,rst;
    input [2:0] ALU_Control_E;
    input [31:0] Rd1_E, Rd2_E, Imm_Ext_E;
    input [4:0] Rd_E;
    input [31:0] PCE, PC_plus_4E;
    
    output [31:0] PC_target_E;
    output [31:0] ALU_Result_M,PC_plus_4M,Write_Data_M;
    output PC_Src_E,Reg_Write_M,Mem_Write_M,Result_Src_M;
    output [4:0] Rd_M;
    
    wire [31:0] Src_B,Result_E;
    wire Zero_E; 
    
    reg Reg_Write_E_r,Result_Src_E_r,Mem_Write_E_r;
    reg [4:0] Rd_E_r;
    reg [31:0] PC_plus_4E_r,Rd2_E_r,Result_E_r;
    
    
 mux ALU_Src_mux(.a(Rd2_E),.b(Imm_Ext_E),.s(ALU_Control_E),.c(Src_B));   
 
 Adder Branch_target_adder(.a(PCE),.b(Imm_Ext_E),.c(PC_target_E));
    
 ALU_mod alu(.A(Rd1_E),.B(Src_B),.Result(),.ALU_Control(ALU_Control_E),.OverFlow(),.C(),.Z(),.N());
 
 
  //in between register logic
 always @(posedge clk or negedge rst) begin
          if(rst == 1'b0) begin
              Reg_Write_E_r <= 1'b0; 
              Mem_Write_E_r <= 1'b0; 
              Result_Src_E_r <= 1'b0;
              Rd_E_r <= 5'h00;
              PC_plus_4E_r <= 32'h00000000; 
              Rd2_E_r <= 32'h00000000; 
              Result_E_r <= 32'h00000000;
          end
          else begin
              Reg_Write_E_r <= Reg_Write_E; 
              Mem_Write_E_r <= Mem_Write_E; 
              Result_Src_E_r <= Result_Src_E;
              Rd_E_r <= Rd_E;
              PC_plus_4E_r <= PC_plus_4E; 
              Result_E_r <= Result_E;
          end
      end
  //outputs
   assign PC_Src_E = Zero_E & Branch_E;
   assign Reg_Write_M = Reg_Write_E_r;
   assign Mem_Write_M = Mem_Write_E_r;
   assign Result_Src_M = Result_Src_E_r;
   assign Rd_M = Rd_E_r;
   assign PC_plus_4M = PC_plus_4E_r;
   assign Write_Data_M = Rd2_E_r;
   assign ALU_Result_M = Result_E_r;

 
endmodule
