
`timescale 1ns / 1ps

module alu_control_tb;

    reg  [1:0] ALUOp;
    reg  [6:0] fun7;
    reg  [2:0] fun3;
    wire [3:0] Control_out;

    // Instantiate ALU control
    alu_control dut (
        .ALUOp(ALUOp),
        .fun7(fun7),
        .fun3(fun3),
        .Control_out(Control_out)
    );

    initial begin
        // R-type ADD
        ALUOp = 2'b10; fun7 = 7'b0000000; fun3 = 3'b000;
        #10;

        // R-type SUB
        ALUOp = 2'b10; fun7 = 7'b0100000; fun3 = 3'b000;
        #10;

        // R-type AND
        ALUOp = 2'b10; fun7 = 7'b0000000; fun3 = 3'b111;
        #10;

        // R-type OR
        ALUOp = 2'b10; fun7 = 7'b0000000; fun3 = 3'b110;
        #10;

        // Load/Store address calculation (ADD)
        ALUOp = 2'b00; fun7 = 7'b0000000; fun3 = 3'b000;
        #10;

        $finish;
    end

endmodule


