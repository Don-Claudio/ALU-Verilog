# Simulation Guide – Parameterized ALU

This folder contains instructions to compile and run the ALU design using **ModelSim**.

## 1. Directory Layout
alu-verilog/
├─ rtl/ # RTL source (alu.v)
├─ tb/ # Testbench (alu_tb.v)
├─ sim/ # This folder (simulation instructions & project files)
└─ docs/ # Documentation & waveforms


## 2. Compile the Design
From a ModelSim **Transcript** window (or terminal):

In the same folder (for example the TB folder), create one library:
Compile both files into it:

```vlog +acc ../../rtl/alu.v alu_tb.v
(REmember, the compilation order matters. Compile the module before teh testbench)

```vlog +acc ../../rtl/alu.v alu_tb.v

## 3.Simulate
```vsim work.alu_tb
```add wave *
```run 300ns

This adds all signals to the Wave window and runs the simulation.

## 4. Notes
- The `.wlf` waveform database is **not tracked** in Git.  
- For reproducible random sequences, a fixed seed is used in the testbench.

---


