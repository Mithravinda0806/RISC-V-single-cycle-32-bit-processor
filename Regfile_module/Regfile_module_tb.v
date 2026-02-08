`timescale 1ns / 1ps

module regfile_tb;

    reg clk;
    reg reg_write;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] wd;
    wire [31:0] rd1, rd2;

    // Instantiate register file
    regfile dut (
        .clk(clk),
        .rs1(rs1),
        .rs2(rs2),
        .rd1(rd1),
        .rd2(rd2),
        .rd(rd),
        .wd(wd),
        .reg_write(reg_write)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reg_write = 0;

        // Write 42 to x5
        rd = 5'd5;
        wd = 32'd42;
        reg_write = 1;
        #10;

        // Disable write
        reg_write = 0;

        // Read x5 and x0
        rs1 = 5'd5;
        rs2 = 5'd0;
        #10;

        $finish;
    end

endmodule

