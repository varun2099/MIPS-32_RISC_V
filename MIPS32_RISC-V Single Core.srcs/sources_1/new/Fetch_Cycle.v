`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2024 10:25:04 PM
// Design Name: 
// Module Name: Fetch_Cycle
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


module Fetch_Cycle(clk,rst,PC_target_E,PC_Src_E,Instr_D,PCD,PC_plus_4D);

  input clk,rst;
  input PC_Src_E;
  input [31:0] PC_target_E;
  
  output [31:0] Instr_D;
  output [31:0] PCD,PC_plus_4D;
  
  reg [31:0] Instr_F_reg,PCF_reg,PC_plus_4F_reg; //register for fetch cycle
  
  
  wire [31:0] PC_F,PCF,PC_plus_4F;
  wire [31:0] Instr_F;
  
  //PC_Mux
  mux PC_Mux(.a(PC_plus_4F),.b(PC_target_E),.s(PC_Src_E),.c(PC_F));
 
  //Program Counter
  PC_mod program_counter(.clk(clk),.rst(rst),.PC(PC_F),.PC_nxt(PCF));
 
 //Instruction Memory
 Instruction_memory IM(.rst(rst),.A(PCF),.rd(Instr_F));
 
 //PC Adder 
 Adder PC_adder(.a(PCF),.b(32'h00000004),.c(PC_plus_4F));

//Fetch Cycle Register behaviour or logic
always @(posedge clk or negedge rst)
 begin
 if (rst == 1'b0) 
  begin
   Instr_F_reg <= 32'h00000000;
   PCF_reg <= 32'h00000000;
   PC_plus_4F_reg <= 32'h00000000;
   end
   else begin 
   Instr_F_reg <= Instr_F;
   PCF_reg <= PCF;
   PC_plus_4F_reg <= PC_plus_4F;
    end
end

//assigning reg values to output ports
assign Instr_D = Instr_F_reg;
assign PCD = PCF_reg;
assign PC_plus_4D = PC_plus_4F_reg;
endmodule