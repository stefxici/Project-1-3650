`timescale 1ps/1ps
`include "ALU_Control_Unit.v"
`include "ALU.v"
`include "Control_Unit.v"
`include "Data_Memory.v"
`include "Imm_Sign_Extend.v"
`include "Instr_Memory.v"
`include "MIPS_Single_Cycle.v"
`include "PC_Counter.v"
`include "Reg_File.v"

module tb_MIPS_Single_Cycle();

reg clk,rst_n;
reg [31:0] cnt;

initial
begin            
    $dumpfile("MIPS_wave.vcd");        
    $dumpvars(0, tb_MIPS_Single_Cycle);    
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
    if (cnt >= 17) begin
        $stop;
    end
end


MIPS_Single_Cycle u_MIPS_Single_Cycle(
    .clk(clk),
    .rst_n(rst_n)
);

endmodule