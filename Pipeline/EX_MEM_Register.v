module EX_MEM_Register(
    // System Clock
    input        clk,
    input        rst_n,

    // User Interface
    input       [31:0]  ALUOut,
    input       [31:0]  WriteDataE,
    input       [4:0]   WriteRegE,
    input               Zero,

    output  reg [31:0]  ALUOutM,
    output  reg [31:0]  WriteDataM,
    output  reg [4:0]   WriteRegM,
    output  reg         ZeroM,

    // Control Unit Input
    input               RegWriteE,
    input               MemtoRegE,
    input               MemWriteE,
    // WB Signal
    output  reg         RegWriteM,
    output  reg         MemtoRegM,
    // MEM Signal
    output  reg         MemWriteM
);
/*******************************************************************************
 *                                 Main Code
*******************************************************************************/

    always @(posedge clk or negedge rst_n ) begin
        if(!rst_n)begin
            ZeroM       <= 1'b0;
            RegWriteM   <= 1'b0;
            MemtoRegM   <= 1'b0;
            MemWriteM   <= 1'b0;
        end
        else begin
            // 97 bits
            ALUOutM     <= ALUOut;
            WriteDataM  <= WriteDataE;
            WriteRegM   <= WriteRegE;
            ZeroM       <= Zero;

            // Control Unit Signal
            RegWriteM   <= RegWriteE;
            MemtoRegM   <= MemtoRegE;
            MemWriteM   <= MemWriteE;
        end
    end

endmodule