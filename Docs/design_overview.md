# Parameterized ALU – Design Overview

## 1. Purpose
This project implements a **parameterized Arithmetic Logic Unit (ALU)** in Verilog.
The ALU supports 8 different operations on two N-bit inputs (`a` and `b`), where **N** is configurable using the `WIDTH` parameter (default is 8).

## 2. Features
| Select (`sel`) | Operation      | Description                      |
|----------------|-----------------|----------------------------------|
| 000            | Pass-through    | Output = `a`                     |
| 001            | Addition        | Output = `a + b`                 |
| 010            | Subtraction     | Output = `a - b`                 |
| 011            | Division        | Output = `a / b` (safe)          |
| 100            | Modulus         | Output = `a % b` (safe)          |
| 101            | Shift Left      | Output = `a << 1`                |
| 110            | Shift Right     | Output = `a >> 1`                |
| 111            | Compare (a>b)   | Output = `1` if true else `0`    |

- **Parameter `WIDTH`** controls input width and output width (`WIDTH+1` to handle addition overflow).
- Division and modulus are protected against divide-by-zero.

## 3. Testbench
The testbench:
- Randomizes operands `a` and `b` for several iterations.
- Loops through all 8 operations for each operand pair.
- Uses a fixed **seed** for reproducible random sequences.

Example simulation output:

T=10000 a=19 b=5 sel=001 out=24
T=20000 a=19 b=5 sel=010 out=14


## 4. How to Extend
- Adjust `WIDTH` in the testbench for wider ALUs.
- Add flags for carry, overflow, or signed arithmetic.

## 5. Tools
- **ModelSim** for simulation.
- Compatible with other Verilog simulators.

---
