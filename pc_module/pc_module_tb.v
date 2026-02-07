`timescale 1ns / 1ps

module pc_module_tb;

    reg        clk;
    reg        reset;
    reg [31:0] next_pc;
    wire [31:0] pc;

    // Instantiate PC
    pc_module dut (
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .pc(pc)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        next_pc = 32'd0;

        // Apply reset
        #10;
        reset = 0;

        // First update
        next_pc = 32'd4;
        #10;

        // Second update
        next_pc = 32'd8;
        #10;

        // Third update
        next_pc = 32'd100;
        #10;

        $finish;
    end

endmodule
