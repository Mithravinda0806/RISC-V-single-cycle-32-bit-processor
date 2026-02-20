`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2026 15:46:48
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module top_cpu (
    input clk,
    input reset
);

    // ========================
    // Internal Wires
    // ========================

    wire [31:0] pc_current;
    wire [31:0] pc_next;
    wire [31:0] pc_plus4;
    wire [31:0] instr;

    wire branch;
    wire Memread;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire Reg_write;
    wire [1:0] ALUOp;

    wire [31:0] rd1, rd2;
    wire [31:0] ImmExt;
    wire [31:0] ALU_input2;
    wire [31:0] ALU_result;
    wire zero;

    wire [3:0] ALU_control_signal;

    wire [31:0] Mem_data_out;
    wire [31:0] Write_back_data;

    wire [31:0] branch_target;
    wire pc_src;

    // ========================
    // 1️⃣ Program Counter
    // ========================

    pc_module PC (
        .clk(clk),
        .reset(reset),
        .next_pc(pc_next),
        .pc(pc_current)
    );

    // ========================
    // 2️⃣ PC + 4
    // ========================

    pcplus4 PC4 (
        .fromPc(pc_current),
        .NexttoPc(pc_plus4)
    );

    // ========================
    // 3️⃣ Instruction Memory
    // ========================

    instr_mem IM (
        .addr(pc_current),
        .instr(instr)
    );

    // ========================
    // 4️⃣ Control Unit
    // ========================

    controlunit CU (
        .instruction(instr[6:0]),
        .branch(branch),
        .Memread(Memread),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .Reg_write(Reg_write)
    );

    // ========================
    // 5️⃣ Register File
    // ========================

    regfile RF (
        .clk(clk),
        .rs1(instr[19:15]),
        .rs2(instr[24:20]),
        .rd1(rd1),
        .rd2(rd2),
        .rd(instr[11:7]),
        .wd(Write_back_data),
        .reg_write(Reg_write)
    );

    // ========================
    // 6️⃣ Immediate Generator
    // ========================

    Immidiate_generator IG (
        .instruction(instr),
        .ImmExt(ImmExt)
    );

    // ========================
    // 7️⃣ ALU Control
    // ========================

    alu_control ALUCTRL (
        .ALUOp(ALUOp),
        .fun7(instr[31:25]),
        .fun3(instr[14:12]),
        .Control_out(ALU_control_signal)
    );

    // ========================
    // 8️⃣ ALU Source MUX
    // ========================

    mux_2 ALU_MUX (
        .Sel2(ALUSrc),
        .A2(rd2),
        .B2(ImmExt),
        .Mux2_out(ALU_input2)
    );

    // ========================
    // 9️⃣ ALU
    // ========================

    alu_unit ALU (
        .A(rd1),
        .B(ALU_input2),
        .control_in(ALU_control_signal),
        .zero(zero),
        .ALU_out(ALU_result)
    );

    // ========================
    // 🔟 Data Memory
    // ========================

    data_memory DM (
        .clk(clk),
        .rst(reset),
        .Mem_Write(MemWrite),
        .Mem_Read(Memread),
        .Read_addr(ALU_result),
        .Write_Data(rd2),
        .Mem_data_out(Mem_data_out)
    );

    // ========================
    // 1️⃣1️⃣ Write Back MUX
    // ========================

    mux_3 WB_MUX (
        .Sel3(MemtoReg),
        .A3(ALU_result),
        .B3(Mem_data_out),
        .Mux3_out(Write_back_data)
    );

    // ========================
    // 1️⃣2️⃣ Branch Logic
    // ========================

    assign branch_target = pc_current + ImmExt;
    assign pc_src = branch & zero;

    mux_1 PC_MUX (
        .Sel1(pc_src),
        .A1(pc_plus4),
        .B1(branch_target),
        .Mux1_out(pc_next)
    );

endmodule
