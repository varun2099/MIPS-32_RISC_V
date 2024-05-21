`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 03:53:52 PM
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend (In,Imm_Src,Imm_Ext);
    input [31:0] In;
    input [1:0] Imm_Src;
    output [31:0] Imm_Ext;

    assign Imm_Ext =  (Imm_Src == 2'b00) ? {{20{In[31]}},In[31:20]} : 
                     (Imm_Src == 2'b01) ? {{20{In[31]}},In[31:25],In[11:7]} : 32'h00000000; 

endmodule
