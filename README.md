# Traffic Light Controller – Verilog Implementation

This repository contains a Verilog-based **Traffic Light Controller (TLC)** using a **Finite State Machine (FSM)** with counters to control timing for Green, Yellow, and Red signals on multiple roads.

Both **RTL design** and **testbench** are included, along with waveform generation using GTKWave (`dump.vcd`).

---

## 📌 Features

- FSM-based controller with 6 states
- Timing controlled by a 5-bit counter (`count`)
- Clock-driven sequential FSM
- Fully asynchronous reset support
- Testbench with:
  - Colored textual output:
    - `000` – OFF  
    - `001` – GREEN  
    - `010` – YELLOW  
    - `100` – RED  
  - Full signal monitoring (`$monitor`)  
  - VCD waveform dump for GTKWave

---

## 🚦 State Timing

| State | Road Signals | Duration (Clock Cycles) |
|-------|-------------|--------------------------|
| s0    | M1, M2 GREEN; MT, S RED  | 8 cycles |
| s1    | M1 GREEN → M2 YELLOW transition | 3 cycles |
| s2    | M1, MT GREEN; M2 RED, S Red | 8 cycles |
| s3    | MT,M1 GREEN → MT,M1 YELLOW transition | 3 cycles |
| s4    | S Green | others RED | 8 cycles |
| s5    | S Yellow | 3 cycles | ----> again s0
---

## 📝 RTL Design Notes

- **Counter Initialization**:  

```verilog
if(rst) begin
    current_state <= s0;
    count <= -1; // ensures first state lasts full cycle
end

## 📁 Repository Contents
| File | Description |
|------|-------------|
| `Design code.v` | RTL Verilog Code |
| `TB.v` | Testbench Code |
| `waveform.png` | waveform dump file |
| `Output` | simulation output |
| `Schematic` | schematic view |

---

## 🛠 Tools Used
- Verilog Simulator (EDA Playground/Xilinx Vivado)

---

## 👩‍💻 Author
**Tamizharasan**  
VLSI Enthusiast | Digital Design Learner  
More designs coming soon… 😊

---
