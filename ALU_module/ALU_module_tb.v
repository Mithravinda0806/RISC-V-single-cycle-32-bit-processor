`timescale 1ns / 1ps

module alu_unit_tb;

    reg  [31:0] A;
    reg  [31:0] B;
    reg  [3:0]  control_in;
    wire        zero;
    wire [31:0] ALU_out;

    // Instantiate ALU
    alu_unit dut (
        .A(A),
        .B(B),
        .control_in(control_in),
        .zero(zero),
        .ALU_out(ALU_out)
    );

    initial begin
        // ADD: 10 + 5 = 15
        A = 32'd10; 
        B = 32'd5;  
        control_in = 4'b0000;
        #10;

        // SUB: 10 - 10 = 0 (zero should be 1)
        A = 32'd10; 
        B = 32'd10; 
        control_in = 4'b0001;
        #10;

        // AND: 10 & 5
        A = 32'd10; 
        B = 32'd5;  
        control_in = 4'b0010;
        #10;

        // OR: 10 | 5
        control_in = 4'b0011;
        #10;

        // SLT: 5 < 10 → result = 1
        A = 32'd5;  
        B = 32'd10; 
        control_in = 4'b1000;
        #10;

        $finish;
    end

endmodule
