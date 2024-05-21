`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 12:55:52 AM
// Design Name: 
// Module Name: Memory_Cycle
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


module Memory_Cycle(clk,rst,PC_Src_E,PC_target_E,Reg_Write_M,Mem_Write_M,Result_Src_M,ALU_Result_M,PC_plus_4M,Rd_M,Write_Data_M,Reg_Write_W,Result_Src_W,Read_Data_W,ALU_Result_W,Rd_W, PC_plus_4W);

    input [31:0] PC_target_E;
    input [31:0] ALU_Result_M,PC_plus_4M,Write_Data_M;
    input clk, rst,PC_Src_E,Reg_Write_M,Mem_Write_M,Result_Src_M;
    input [4:0] Rd_M;
    
      output Reg_Write_W, Result_Src_W; 
      output [4:0] Rd_W;
      output [31:0] PC_plus_4W, ALU_Result_W, Read_Data_W;

    wire [31:0] Read_Data_M;
    
    reg Reg_Write_M_r,Result_Src_M_r;
    reg [31:0] PC_plus_4M_r,ALU_Result_M_r,Read_Data_M_r;
    reg [4:0] Rd_M_r;
    
Data_Memory_mod memory(.clk(clk),.rst(rst),.WE(Mem_Write_M),.WD(Write_Data_M),.A(ALU_Result_M),.RD(Read_Data_M));

//In between cycle register logic
 always @(posedge clk or negedge rst) begin
        if (rst == 1'b0) begin
            Reg_Write_M_r <= 1'b0; 
            Result_Src_M_r <= 1'b0;
            Rd_M_r <= 5'h00;
            PC_plus_4M_r <= 32'h00000000; 
            ALU_Result_M_r <= 32'h00000000; 
            Read_Data_M_r <= 32'h00000000;
        end
        else begin
            Reg_Write_M_r <= Reg_Write_M;
            Result_Src_M_r <= Result_Src_M;
            Rd_M_r <= Rd_M;
            PC_plus_4M_r <= PC_plus_4M; 
            ALU_Result_M_r <= ALU_Result_M; 
            Read_Data_M_r <= Read_Data_M;
        end
    end 
    
    
    assign Reg_Write_W = Reg_Write_M_r;
    assign Result_Src_W = Result_Src_M_r;
    assign Read_Data_W = Read_Data_M_r;
    assign Rd_W = Rd_M_r;
    assign ALU_Result_W = ALU_Result_M_r;
    assign PC_plus_4W = PC_plus_4M_r;
    
    
endmodule
