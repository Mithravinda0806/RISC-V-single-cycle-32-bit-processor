
//data memory tb
`timescale 1ns/1ps

module data_memory_tb;

    reg clk;
    reg rst;
    reg Mem_Write;
    reg Mem_Read;
    reg [31:0] Read_addr;
    reg [31:0] Write_Data;
    wire [31:0] Mem_data_out;

    // Instantiate DUT
    data_memory uut (
        .clk(clk),
        .rst(rst),
        .Mem_Write(Mem_Write),
        .Mem_Read(Mem_Read),
        .Read_addr(Read_addr),
        .Write_Data(Write_Data),
        .Mem_data_out(Mem_data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        Mem_Write = 0;
        Mem_Read = 0;
        Read_addr = 0;
        Write_Data = 0;

        // Reset memory
        #10;
        rst = 0;

        // Write data 100 to address 10
        #10;
        Mem_Write = 1;
        Read_addr = 10;
        Write_Data = 100;
        #10;
        Mem_Write = 0;

        // Read from address 10
        #10;
        Mem_Read = 1;
        Read_addr = 10;
        #10;

        // Read from initialized address 17 (should be 56)
        Read_addr = 17;
        #10;

        // Read from initialized address 15 (should be 65)
        Read_addr = 15;
        #10;

        // Stop simulation
        $finish;
    end

endmodule

