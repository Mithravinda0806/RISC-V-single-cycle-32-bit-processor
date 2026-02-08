module instr_mem_tb;

    reg  [31:0] addr;
    wire [31:0] instr;

    instr_mem dut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        addr = 32'd0;    #10;   // instruction 0
        addr = 32'd4;    #10;   // instruction 1
        addr = 32'd8;    #10;   // instruction 2
        addr = 32'd12;   #10;   // instruction 3
        addr = 32'd16;   #10;   // instruction 4
        $finish;
    end

endmodule
//module instr_mem_tb;

    reg  [31:0] addr;
    wire [31:0] instr;

    instr_mem dut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        addr = 32'd0;    #10;   // instruction 0
        addr = 32'd4;    #10;   // instruction 1
        addr = 32'd8;    #10;   // instruction 2
        addr = 32'd12;   #10;   // instruction 3
        addr = 32'd16;   #10;   // instruction 4
        $finish;
    end

endmodule
//module instr_mem_tb;

    reg  [31:0] addr;
    wire [31:0] instr;

    instr_mem dut (
        .addr(addr),
        .instr(instr)
    );

    initial begin
        addr = 32'd0;    #10;   // instruction 0
        addr = 32'd4;    #10;   // instruction 1
        addr = 32'd8;    #10;   // instruction 2
        addr = 32'd12;   #10;   // instruction 3
        addr = 32'd16;   #10;   // instruction 4
        $finish;
    end

endmodule
//PC is byte-addressed, instruction memory is word-addressed.Dividing PC by 4 converts byte address to instruction index.//
