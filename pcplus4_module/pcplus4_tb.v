
`timescale 1ns / 1ps

module pcplus4_tb;

    reg  [31:0] fromPc;
    wire [31:0] NexttoPc;

    // Instantiate pcplus4
    pcplus4 dut (
        .fromPc(fromPc),
        .NexttoPc(NexttoPc)
    );

    initial begin
        // Test 1: PC = 0 → Next PC = 4
        fromPc = 32'd0;
        #10;

        // Test 2: PC = 4 → Next PC = 8
        fromPc = 32'd4;
        #10;

        // Test 3: PC = 100 → Next PC = 104
        fromPc = 32'd100;
        #10;

        $finish;
    end

endmodule
