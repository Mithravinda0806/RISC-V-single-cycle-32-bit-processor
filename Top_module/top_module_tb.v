
`timescale 1ns / 1ps

module top_cpu_tb;

    reg clk;
    reg reset;

    // Instantiate DUT
    top_cpu uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    // Monitor important signals
    initial begin
        $display("Time\tPC\t\tInstruction\tALU_Result\tMemWrite\tMemRead\tBranch");
        $monitor("%0t\t%h\t%h\t%h\t%b\t%b\t%b",
                 $time,
                 uut.pc_current,
                 uut.instr,
                 uut.ALU_result,
                 uut.MemWrite,
                 uut.Memread,
                 uut.branch);
    end

    initial begin
        // Initialize
        clk = 0;
        reset = 1;

        // Hold reset for some cycles
        #20;
        reset = 0;

        // Run enough cycles for full program
        #500;

        $display("Simulation Finished");
        $finish;
    end

endmodule
