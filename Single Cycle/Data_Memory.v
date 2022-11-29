module Data_Memory(
    // System Clock
    input        clk,
    input        rst_n,

    // User Interface
    input           [31:0]  A,
    input           [31:0]  WD,
    input                   WE,

    output   reg    [31:0]  RD
);
    integer fd;
    reg [31:0]  DATA_MEM[84:0];

    always @(*) begin
            RD = DATA_MEM[A];
    end


    initial begin
<<<<<<< HEAD
        fd = $fopen("./MEM_Data.txt", "w");
=======
        fd = $fopen("./MEM_Data.txt", "w");  
>>>>>>> Leanna
        #500
        $fclose(fd);
    end

    always @(posedge clk) begin
        if (WE) begin
<<<<<<< HEAD
            DATA_MEM[A] <= WD;
=======
            DATA_MEM[A] <= WD; 
>>>>>>> Leanna
            $fdisplay(fd,"The Write Address A is %h", A);
            $fdisplay(fd,"DATA_MEM[A] is %h", WD);
        end
    end

endmodule