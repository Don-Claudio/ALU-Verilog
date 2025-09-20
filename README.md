# Parameterized Verilog ALU

A synthesizable **Arithmetic Logic Unit (ALU)** written in Verilog HDL.  
This ALU is **parameterized by data width**, allowing you to quickly scale from
8-bit to N-bit operations. A simple self-checking testbench is included and can
be simulated using **ModelSim/QuestaSim** or any Verilog simulator.

---

## 📁 Directory Structure
alu-verilog/
├─ rtl/ # RTL (Register Transfer Level) source files
│ └─ alu.v # Parameterized ALU module
├─ tb/ # Testbench files
│ └─ alu_tb.v # Testbench for functional verification
├─ sim/ # ModelSim project files and simulation outputs (not tracked by Git)
└─ docs/ # Optional documentation, waveforms, or notes

---

## 🛠️ Features
- **Parameterizable Width**: Default `WIDTH = 8`, can be changed at instantiation.
- **Supported Operations** (select signal `sel[2:0]`):
  | `sel` | Operation          | Notes                          |
  |------ |-------------------- |---------------------------------|
  | 000   | Pass-through `a`   | Zero-extended to WIDTH+1        |
  | 001   | Addition `a + b`   | WIDTH+1 output for carry        |
  | 010   | Subtraction `a - b`| WIDTH+1 output for borrow       |
  | 011   | Division `a / b`   | Safe divide (returns 0 if b=0)  |
  | 100   | Modulus `a % b`    | Returns 0 if b=0                |
  | 101   | Shift Left `a << 1`| Logical shift                   |
  | 110   | Shift Right `a >> 1`| Logical shift                  |
  | 111   | Compare `a > b`    | Returns 1 if true, else 0       |

---

## ⚡ Quick Simulation (ModelSim)

1. **Clone or download this repo**  
   ```bash
   git clone https://github.com/<your_username>/alu-verilog.git
   cd alu-verilog

## ⚡ Compile and simulate
vlib work
vlog rtl/alu.v tb/alu_tb.v
vsim work.alu_tb
add wave *
run -all

## ⚡ 📝 License

This project is released under the MIT License.
Feel free to use it for learning, teaching, or your own projects.

## ⚡ 🚀 Author

Claudio Kimani – Verification Enthusiast
Created as a portfolio project while transitioning into hardware verification.
