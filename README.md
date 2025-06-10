# MIPS Single-Cycle Processor in Verilog

This project implements a **MIPS single-cycle CPU** using Verilog HDL.  
The processor executes MIPS instructions in a single clock cycle per instruction and follows the classic MIPS datapath architecture.

---

## 📁 Project Structure

| File Name              | Description                                      |
|------------------------|--------------------------------------------------|
| `top_level.v`          | Top-level module connecting all submodules       |
| `datapath.v`           | Main datapath integration                        |
| `control_unit.v`       | Main control unit for instruction decoding       |
| `program_counter.v`    | Handles PC increment/update logic                |
| `sign_extend.v`        | Sign-extends 16-bit immediate to 32 bits         |
| `alu_control_unit.v`   | Decodes ALU operation from funct and ALUOp       |
| `data_memory.v`        | 32-bit memory for load/store instructions        |
| `instruction_memory.v` | Read-only memory for instruction storage         |
| `register.v`           | Register file (32 registers)                     |
| `ALU.v`                | 32-bit ALU for arithmetic and logical ops        |
| `adder.v`              | Simple 32-bit adder used in PC and datapath      |
| `multiplexer.v`        | Used for mux logic throughout the CPU            |
| `tb.v`                 | Testbench for simulation and verification        |

---

## 🧠 Features

- Single-cycle execution per instruction
- Supports basic MIPS instructions:
  - R-type: `add`, `sub`, `and`, `or`, `slt`
  - I-type: `lw`, `sw`, `beq`
  - J-type: `j`
- ALU integrated with control unit
- Instruction memory and data memory included
- Register file with 32 registers

---

## 🚀 How to Run

### Using ModelSim / Icarus Verilog / GTKWave

1. **Compile the source and testbench**

   *(Example using Icarus Verilog)*:
   ```bash
   iverilog -o mips_tb top_level.v datapath.v control_unit.v \
   program_counter.v sign_extend.v alu_control_unit.v data_memory.v \
   instruction_memory.v register.v ALU.v adder.v multiplexer.v tb.v

2. **Run the simulation:**
 
  vvp mips_tb

3. **View waveforms**

  initial begin 
  $dumpfile("dump.vcd");
  $dumpvars(0, top_level);
end

then run
  gtkwave dump.vcd

📌 To Do
 Add pipelining (optional)

 Support more MIPS instructions (e.g., addi, bne, jal)

 Implement hazard detection and forwarding
