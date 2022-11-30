`timescale 1ps/1ps
`include "Alu.v"
`include "ALU_Control_Unit.v"
`include "Branch_Unit.v"
`include "Control_Unit.v"
`include "Data_Memory.v"
`include "EX_MEM_Register.v"
`include "Forward_Unit.v"
`include "ID_EX_Register.v"
`include "IF_ID_Register.v"
`include "Imm_Sign_Extend.v"
`include "Instr_Memory.v"
`include "MEM_WB_Register.v"
`include "MIPS_Pipeline.v"
`include "PC_Counter.v"
`include "Reg_File.v"
`include "Stall_Unit.v"

module tb_MIPS_Pipeline();

reg clk,rst_n;
reg [31:0] cnt;

initial
begin            
    $dumpfile("MIPS_wave.vcd");        
    $dumpvars(0, tb_MIPS_Pipeline);    
end

initial begin
    clk <= 1'b0;
    rst_n <= 1'b0;
    cnt <= 32'b0;

    #10
    clk <= 1'b1;

    #10
    clk <= 1'b0;
    rst_n <= 1'b1;

    forever begin
        #10 clk <= ~clk;
    end

end

always @(negedge clk) begin
    cnt <= cnt + 1'b1;
    if (cnt >= 25) begin
        $stop;
    end
end


MIPS_Pipeline u_MIPS_Pipeline(
    .clk(clk),
    .rst_n(rst_n)
);

endmodule