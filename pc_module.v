module pc_module(
  input  wire        clk,
    input  wire        reset,
    input  wire [31:0] next_pc,
    output reg  [31:0] pc
    );
     // PC stores state → updates only on clock or reset
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc <= 32'b0;      // On reset, start at address 0
        else
            pc <= next_pc;    // On every clock, load next PC
    end

endmodule
