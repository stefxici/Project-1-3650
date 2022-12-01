
# Project 1: Certified Preowned Processor




## Single Cycle Implementation

This Single-Cycle Implementation handles the subset of instructions [ALU funcs, lw/sw, beq, jump]. It follows the simple datapath in chapter 4 section 4: 

![image](https://user-images.githubusercontent.com/97343745/204700081-77cc7ea8-87e5-4ae6-aa25-9e570f50dada.png)

Instruction Memory: stores the instructions of the program given the address which is loaded using $readmemh into register and from their it assigns the instruction. 

Sign Extend: this incase for instance is the lw and sw instructions offsets are 16 bit value, this module will then bring the offset to be 32 bits .

Program Counter: holds the address of the current instructions and next instruction and since this is a 32 bit processor it increments the address by 4 to fetch the next instruction through an adder. This address increment happens at every clock cycle. Our code also contains the branching and jumping as it takes in input for both which can be seen with "input [31:0] SignImm", "input jump", and "input [25:0] jump_low_26bit".

Register File: encloses all the registers that are independent of the processor which is to perform read and write operations which is done by getting the input and assigning whether its for reading or writing. 

Alu and Alu Control: Alu control is what signals the instructions that will be preformed for both the I-Type instructions and R-Type instructions. I-type uses the opcode and R-Tyoe uses the function field. This can be seen in the code for Alu_Control_Unit.v as you will see under "always @" that their is two cases: Funct and ALUOp which then give you the options for instructions depending on the input. As for Alu.v, it takes in the input from the alu contol and also the values for A and B and it then performs its addition, subtraction, and etc. 

Data Memory: is the read-write memory which takes in addresses and can then fetch or store the data given depending on the instruction chosen.

Control Unit: part of the processor that generates control signals in order to operate in the way which is chosen by the instruction like if beq is chosen, etc.


## Single Cycle Waves

![MIPS Single Cycle Wave pt 1](https://user-images.githubusercontent.com/97343745/204691965-04af2abd-99ff-4a65-b5a5-202a6c15a9be.png)

![MIPS Single Cycle Wave pt 2](https://user-images.githubusercontent.com/97343745/204692086-7c2a0e35-2e5d-4f1f-90f6-2ca7b3c86123.png)



## 5 Stage Pipeline Implementation
This--

Instruction Memory:

Sign Extend:

Program Counter:

Register File:

Alu and Alu Control:

Data Memory:

Control Unit:

![MIPS Pipeline pt 1](https://user-images.githubusercontent.com/97343745/204692206-d0226dab-1aea-46b2-8a9c-639d498323e9.png)

![MIPS Pipeline pt 2](https://user-images.githubusercontent.com/97343745/204692340-9322fc92-1cbf-43db-b7bd-88a68136b2c6.png)
## Acknowledgements

 - credit to Hola39e [https://github.com/Hola39e/MIPS_Multi_Implementation#simulation-benchmarking-of-the-single-cycle-mips-processor]
