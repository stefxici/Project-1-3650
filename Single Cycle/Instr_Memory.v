module Instr_Memory(
	//System Clock
    input   [31:0]  A,
    output  [31:0]  RD

	//User Interface
);

	reg [7:0] Instr_Reg [71:0];
	initial begin
		$readmemh("./memfile.dat",Instr_Reg,0,71);
	end
    assign RD = {{Instr_Reg[A]},{Instr_Reg[A+32'd1]},{Instr_Reg[A+32'd2]},{Instr_Reg[A+32'd3]}};

endmodule