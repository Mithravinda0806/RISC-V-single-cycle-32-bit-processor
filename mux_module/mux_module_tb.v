
//minimal testbench
`timescale 1ns / 1ps

module mux_1_tb;

    reg        Sel1;
    reg [31:0] A1;
    reg [31:0] B1;
    wire [31:0] Mux1_out;

    // Instantiate the mux
    mux_1 dut (
        .Sel1(Sel1),
        .A1(A1),
        .B1(B1),
        .Mux1_out(Mux1_out)
    );

    initial begin
        // Case 1: Sel = 0 → output should be A1
        A1   = 32'd10;
        B1   = 32'd20;
        Sel1 = 1'b0;
        #10;

        // Case 2: Sel = 1 → output should be B1
        Sel1 = 1'b1;
        #10;

        $finish;
    end
