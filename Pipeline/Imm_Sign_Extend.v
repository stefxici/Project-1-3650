
<<<<<<< HEAD
=======
module Imm_Sign_Extend(
    // User Interface
    input       [15:0]  Immediate,

    output      [31:0]  SignImm
);
    assign  SignImm = {{16{Immediate[15]}}, Immediate[15:0]};
endmodule
>>>>>>> Leanna
