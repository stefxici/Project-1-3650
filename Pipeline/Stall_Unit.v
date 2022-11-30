module Stall_Unit(
    // System Clock
    input        clk,
    input        rst_n,

    // User Interface
    input   [4:0]   RsD,
    input   [4:0]   RtD,
    input   [4:0]   RtE,
    input   [4:0]   WriteRegE,
    input   [4:0]   WriteRegM,
    input           RegWriteE,
    input           MemtoRegE,
    input           MemtoRegM,
    input           BranchD,
    output  reg     FlushE,
    output  reg     StallD,
    output  reg     StallF
);
    wire lwstall,branchstall;


    assign branchstall = (BranchD && RegWriteE && ((WriteRegE == RsD) || (WriteRegE == RtD))) ||
                            (BranchD && MemtoRegM && ((WriteRegM == RsD) || (WriteRegM == RtD)));
    assign lwstall = ((RsD == RtE) || (RtD == RtE)) && MemtoRegE;
    always @(*) begin
        if (~rst_n) begin
            FlushE = 1'b0;     // ID/EX: Only need to Set MemWrite and RegWrite 0
            StallD = 1'b0;     // IF/ID: keep last state data
            StallF = 1'b0;
        end
        else if (lwstall || branchstall ) begin
            FlushE = 1'b1;     // ID/EX: Only need to Set MemWrite and RegWrite 0
            StallD = 1'b1;     // IF/ID: keep last state data
            StallF = 1'b1;     // PC:    keep last state data
        end 
        else begin
            FlushE = 1'b0;     
            StallD = 1'b0;     
            StallF = 1'b0;
        end
    end
endmodule