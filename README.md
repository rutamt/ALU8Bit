# 8-Bit Arithmetic Logic Unit (ALU) Design & Verification

A hardware description language (HDL) implementation of an 8-bit Arithmetic Logic Unit (ALU) using Verilog. This project covers the architectural definition, combinational logic design, behavioral modeling, and testbench verification of a processor core component.

## Why I Made This
I built this project over the summer to transition from conceptual computer architecture to practical chip design. The goal was to master key digital engineering workflows, including:
* Writing synthesizable, race-condition-free combinational Verilog logic.
* Managing bit-widths, data truncation, and handling mathematical overflows.
* Developing a robust modular testbench simulation to independently verify hardware code behavior.

---

## What It Does
The ALU processes two 8-bit data inputs (`A` and `B`) based on a 4-bit selection code (`sel`), outputting an 8-bit result. It executes a comprehensive suite of 16 distinct operations divided into mathematical data processing and bitwise manipulation.

### Supported Operations
* **Arithmetic:** Clear, Addition, Subtraction, Multiplication (lower 8 bits), Increment, Decrement.
* **Shifts:** Logical Left Shift (`<< 1`), Logical Right Shift (`>> 1`).
* **Logical Gates:** Bitwise AND, OR, XOR, NOT, NAND, NOR, XNOR, and a Preset state.

---

## Architecture & Truth Table
The implementation architecture and operation mapping are based on the established 8-bit processor design paradigms outlined by A. Kamaraj. 

### Operation Select Table
The control logic strictly adheres to the following behavioral truth table configurations:

| Selection Code (`sel`) | Operation | Description |
| :--- | :--- | :--- |
| `4'b0000` | **Clear** | Forces output to `8'b00000000` |
| `4'b0001` | **ADD** | `A + B` (Addition) |
| `4'b0010` | **SUB** | `A - B` (Subtraction) |
| `4'b0011` | **MUL** | `A * B` (Multiplication) |
| `4'b0100` | **INC** | `A + 1` (Increment A) |
| `4'b0101` | **DEC** | `A - 1` (Decrement A) |
| `4'b0110` | **SHL** | `A << 1` (Logical Left Shift) |
| `4'b0111` | **SHR** | `A >> 1` (Logical Right Shift) |
| `4'b1000` | **OR** | `A \| B` (Bitwise OR) |
| `4'b1001` | **AND** | `A & B` (Bitwise AND) |
| `4'b1010` | **NOT** | `~A` (Bitwise Inversion) |
| `4'b1011` | **XOR** | `A ^ B` (Bitwise XOR) |
| `4'b1100` | **NOR** | `~(A \| B)` (Bitwise NOR) |
| `4'b1101` | **NAND** | `~(A & B)` (Bitwise NAND) |
| `4'b1110` | **XNOR** | `~(A ^ B)` (Bitwise XNOR) |
| `4'b1111` | **Preset** | Forces output to `8'b11111111` |

### Academic Citation
> Kamaraj, A. "Design of 8-Bit Arithmetic Processor Unit based on Reversible Logic." *Semantic Scholar*, 2011. 
> [Source Publication Figure & Reference](https://www.semanticscholar.org/paper/Design-of-8-Bit-Arithmetic-Processor-Unit-based-on-A.Kamaraj/42036b44f966dc0366857ee91e5f0ec0b8391ff6/figure/0)

---

## Verification & Tools
* **Development Environment:** EDA Playground
* **Simulation Engine:** Icarus Verilog
* **Waveform Viewer:** EPWave

The project contains a complete verification suite (`ALU_tb.v`) that asserts individual test vectors across all 16 execution states. Hardware stability is verified by tracking functional changes in signal transitions and printing binary validation logs to the console compiler output.

## How to Run
1. Upload `ALU.v` and `ALU_tb.v` to EDA Playground.
2. Select **Icarus Verilog** as your simulator tool engine.
3. Check **Open EPWave after run** to visually inspect timing lines.
4. Click **Run** to execute the test suite and inspect console output logs.
