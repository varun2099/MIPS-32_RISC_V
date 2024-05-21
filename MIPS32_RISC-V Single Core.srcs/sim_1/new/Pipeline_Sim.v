`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2024 03:04:59 AM
// Design Name: 
// Module Name: Pipeline_Sim
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


module Pipeline_Sim();


    reg clk=0, rst;
    
    always begin
        clk = ~clk;
        #50;
    end

    initial begin
        rst <= 1'b0;
        #200;
        rst <= 1'b1;
        #1000;
        $finish;    
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

    Pipelining dut (.clk(clk), .rst(rst));

  
endmodule
