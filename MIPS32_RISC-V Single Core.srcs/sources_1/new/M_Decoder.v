module M_Decoder(Op,Reg_Write,Imm_Src,ALU_Src,Mem_Write,Result_Src,Branch,ALU_Op);
    input [6:0]Op;
    output Reg_Write,ALU_Src,Mem_Write,Result_Src,Branch;
    output [1:0]Imm_Src,ALU_Op;

    assign Reg_Write = (Op == 7'b0000011 | Op == 7'b0110011 | Op == 7'b0010011 ) ? 1'b1 :
                                                              1'b0 ;
    assign Imm_Src = (Op == 7'b0100011) ? 2'b01 : 
                    (Op == 7'b1100011) ? 2'b10 :    
                                         2'b00 ;
    assign ALU_Src = (Op == 7'b0000011 | Op == 7'b0100011 | Op == 7'b0010011) ? 1'b1 :
                                                            1'b0 ;
    assign Mem_Write = (Op == 7'b0100011) ? 1'b1 :
                                           1'b0 ;
    assign Result_Src = (Op == 7'b0000011) ? 1'b1 :
                                            1'b0 ;
    assign Branch = (Op == 7'b1100011) ? 1'b1 :
                                         1'b0 ;
    assign ALU_Op = (Op == 7'b0110011) ? 2'b10 :
                   (Op == 7'b1100011) ? 2'b01 :
                                        2'b00 ;

endmodule