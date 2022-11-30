module MEM_WB_Register(
    // System Clock
    input        clk,
    input        rst_n,

    // User Interface
    input       [31:0]  ReadDataM,
    input       [31:0]  ALUOutM,
    input       [4:0]   WriteRegM, 

    output  reg [31:0]  ReadDataW,
    output  reg [31:0]  ALUOutW,
    output  reg [4:0]   WriteRegW,

    // Control Signal 
    input               RegWriteM,
    input               MemtoRegM,
    // WB
    output  reg         RegWriteW,
    output  reg         MemtoRegW
);


    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            RegWriteW <= 1'b0;
            MemtoRegW <= 1'b0;
        end
        else begin
            // total 64bits
            ReadDataW <= ReadDataM;
            ALUOutW   <= ALUOutM;
            WriteRegW <= WriteRegM;

            // Control Unit
            RegWriteW <= RegWriteM;
            MemtoRegW <= MemtoRegM;
        end
    end

endmodule