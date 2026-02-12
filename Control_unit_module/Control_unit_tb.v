`timescale 1ns/1ps

module controlunit_tb;

    // Inputs
    reg [6:0] instruction;

    // Outputs
    wire branch;
    wire Memread;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire Reg_write;
    wire [1:0] ALUOp;

    // Instantiate DUT
    controlunit uut (
        .instruction(instruction),
        .branch(branch),
        .Memread(Memread),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .Reg_write(Reg_write)
    );

    initial begin

        $display("Time | Opcode | ALUSrc MemtoReg RegWrite MemRead MemWrite Branch ALUOp");
        $monitor("%4t | %b | %b      %b        %b        %b       %b        %b      %b",
                 $time, instruction,
                 ALUSrc, MemtoReg, Reg_write,
                 Memread, MemWrite, branch, ALUOp);

        // R-type
        instruction = 7'b0110011;
        #10;

        // Load (lw)
        instruction = 7'b0000011;
        #10;

        // Store (sw)
        instruction = 7'b0100011;
        #10;

        // Branch (beq)
        instruction = 7'b1100011;
        #10;

        // I-type (addi)
        instruction = 7'b0010011;
        #10;

        // Default case
        instruction = 7'b1111111;
        #10;

        $finish;
    end

endmodule

