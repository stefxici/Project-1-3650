
# Project 1: Certified Preowned Processor




## Single Cycle Implementation:

This Single-Cycle Implementation handles the subset of instructions [ALU funcs, lw/sw, beq, jump]. It follows the simple datapath in chapter 4 section 4: 

![image](https://user-images.githubusercontent.com/97343745/204700081-77cc7ea8-87e5-4ae6-aa25-9e570f50dada.png)

Instruction Memory: 
stores the instructions of the program given the address which is loaded using $readmemh into register and from their it assigns the instruction. 

Sign Extend: 
this incase for instance is the lw and sw instructions offsets are 16 bit value, this module will then bring the offset to be 32 bits .

Program Counter: 
holds the address of the current instructions and next instruction and since this is a 32 bit processor it increments the address by 4 to fetch the next instruction through an adder. This address increment happens at every clock cycle. Our code also contains the branching and jumping as it takes in input for both which can be seen with "input [31:0] SignImm", "input jump", and "input [25:0] jump_low_26bit".

Register File: 
encloses all the registers that are independent of the processor which is to perform read and write operations which is done by getting the input and assigning whether its for reading or writing. 

Alu and Alu Control: 
Alu control is what signals the instructions that will be preformed for both the I-Type instructions and R-Type instructions. I-type uses the opcode and R-Tyoe uses the function field. This can be seen in the code for Alu_Control_Unit.v as you will see under "always @" that their is two cases: Funct and ALUOp which then give you the options for instructions depending on the input. As for Alu.v, it takes in the input from the alu contol and also the values for A and B and it then performs its addition, subtraction, and etc. 

Data Memory: 
is the read-write memory which takes in addresses and can then fetch or store the data given depending on the instruction chosen.

Control Unit: 
part of the processor that generates control signals in order to operate in the way which is chosen by the instruction like if beq is chosen, etc.


## Single Cycle Waves:

![MIPS Single Cycle Wave pt 1](https://user-images.githubusercontent.com/97343745/204691965-04af2abd-99ff-4a65-b5a5-202a6c15a9be.png)

![MIPS Single Cycle Wave pt 2](https://user-images.githubusercontent.com/97343745/204692086-7c2a0e35-2e5d-4f1f-90f6-2ca7b3c86123.png)



## 5 Stage Pipeline Implementation:
A five stage pipeline means that up to five instructions will be executed during any single clock cycle unlive above as the single only does one instruction hence the name. Futhermore, the datapath then has to be divided into 5 pieces which are:
1) IF: Instruction fetch
2) ID: Instruction decode and register file read
3) EX: Execution or address calculatiom
4) MEM: Data memory access
5) WB: Write back
The difference between the pipeline and single datapath is that pipeline has a faster perfomance due to it processing more instructions unlike the single datapath.

![image](https://user-images.githubusercontent.com/97343745/205169458-79ddd5c4-e368-4c03-ae91-5e4cdd0df17f.png)

An important thing to note is that the pipeline implementation has hazards, which is when the next instruction can't execute in the next clock cycle. There are 3 different types: 
1) Structural Hazards: is when the hardware can't support the combination of instructions that we want to execute in the same clock cycle
2) Data Hazards: is when the pipeline must be stalled because one step must wait for another to complete [this has a resove which is called Fowarding which is implemented in this code and what it does is it retrieves the missing data element from internal buffers rather than waiting for it to arrive from programmer-visible registers or memory]
3) Load Use Data Hazard: is a form of data hazard in which the data being loaded by a load instruction hasn't become yet available when it is needed by another instruction [this also has a resolve which is also implemented in this code calles Pipeline Stall whichall it does is iniate a stall to resolve the hazard]
4) 

Instruction Memory:

Sign Extend:

Program Counter:

Register File:

Alu and Alu Control:

Data Memory:

Control Unit:

## 5 Stage Pipeline Waves:
![MIPS Pipeline pt 1](https://user-images.githubusercontent.com/97343745/204692206-d0226dab-1aea-46b2-8a9c-639d498323e9.png)

![MIPS Pipeline pt 2](https://user-images.githubusercontent.com/97343745/204692340-9322fc92-1cbf-43db-b7bd-88a68136b2c6.png)
## Acknowledgements

 - credit to Hola39e [https://github.com/Hola39e/MIPS_Multi_Implementation#simulation-benchmarking-of-the-single-cycle-mips-processor]
 - credit to our textbook: Computer Organization and Design and their authors
