//minimal tb of imm generator
`timescale 1ns / 1ps

module imm_gen_tb;

    reg  [31:0] instruction;
    wire [31:0] ImmExt;

    // Instantiate Immediate Generator
    Immidiate_generator dut (
        .instruction(instruction),
        .ImmExt(ImmExt)
    );

    initial begin
        // I-type: addi x1, x2, 10
        instruction = 32'b000000001010_00010_000_00001_0010011;
        #10;

        // Load-type: lw x3, 8(x1)
        instruction = 32'b000000001000_00001_010_00011_0000011;
        #10;

        // Store-type: sw x3, 12(x1)
        instruction = 32'b0000000_00011_00001_010_01100_0100011;
        #10;

        // Branch-type: beq x1, x2, +16
        instruction = 32'b0000000_00010_00001_000_1000_0_1100011;
        #10;

        // U-type: lui x1, 0x12345
        instruction = 32'b00010010001101000101_00001_0110111;
        #10;

        // J-type: jal x1, +32
        instruction = 32'b00000000001000000000_00001_1101111;
        #10;

        $finish;
    end

endmodule

