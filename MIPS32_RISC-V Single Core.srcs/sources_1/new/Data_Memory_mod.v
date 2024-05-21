`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 12:56:53 AM
// Design Name: 
// Module Name: Data_Memory_mod
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

module Data_Memory_mod(clk,rst,WE,WD,A,RD);

    input clk,rst,WE;
    input [31:0]A,WD;
    output [31:0]RD;

    reg [31:0] Mem [1023:0];

    always @ (posedge clk)
    begin
        if(WE)
            Mem[A] <= WD;
    end

    assign RD = (~rst) ? 32'd0 : Mem[A];

    initial begin
        Mem[0] = 32'h00000000;
        
    end


endmodule