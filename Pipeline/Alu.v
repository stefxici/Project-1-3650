module ALU(
    // System Clock
    input               rst_n,
    // User Interface
    input       [31:0]  SignImm,
    input       [2:0]   ALUControl,
    input               ALUSrc,
    input       [1:0]   ForwardAE,
    input       [1:0]   ForwardBE,
    input       [31:0]  ResultW,
    input       [31:0]  ALUOutM,
    input       [31:0]  RD1E,
    input       [31:0]  RD2E,

    output  reg [31:0]  SrcB_Forward,
    output  reg [31:0]  ALUOut,
    output              Zero
);
    wire    [31:0] SrcB;
    reg     [31:0] SrcA;

    assign  SrcB = ALUSrc ? SignImm : SrcB_Forward;

    always @(*) begin
        if (~rst_n) begin
            SrcA <= 32'b0;
            SrcB_Forward <= 32'b0;
        end
        else begin
            case(ForwardAE)
                2'b00: SrcA = RD1E;
                2'b01: SrcA = ResultW;
                2'b10: SrcA = ALUOutM;
            endcase
            case (ForwardBE)
                2'b00: SrcB_Forward = RD2E;
                2'b01: SrcB_Forward = ResultW;
                2'b10: SrcB_Forward = ALUOutM;
            endcase
        end
    end

    always @(*) begin
        case (ALUControl)
            3'b010 : begin
                ALUOut = SrcA + SrcB;
            end
            3'b110 : begin
                ALUOut = SrcA - SrcB;
            end
            3'b000 : ALUOut = SrcA & SrcB;
            3'b001 : ALUOut = SrcA | SrcB;
            3'b111 : ALUOut = (SrcA < SrcB) ? 32'b1 : 32'b0;
            default: ;
        endcase
    end

    assign Zero = (ALUOut) ? 1'b0 : 1'b1;

endmodule