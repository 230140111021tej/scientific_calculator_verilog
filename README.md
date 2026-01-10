# 🧮 Scientific Calculator on FPGA (Vivado, Verilog)

This repository contains the design, simulation, and schematic visualization of a **scientific calculator** fully described in Verilog and engineered for FPGA implementation. The design was constructed and validated using **Xilinx Vivado**, with simulation using Icarus Verilog and GTKWave.

---

## At a Glance

A modular, fully testbenched scientific calculator with arithmetic (add, sub, mul, div), scientific (power, square, sqrt, trig), and combinational logic (ALU) operations, all in Verilog HDL and ready for FPGA synthesis.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Directory Structure](#directory-structure)
- [Module Architecture](#module-architecture)
- [Testbench](#testbench)
- [Vivado & Simulation Results](#vivado--simulation-results)
- [How to Run the Project](#how-to-run-the-project)
- [Screenshots](#screenshots)
- [License](#license)
- [Acknowledgements](#acknowledgements)

---

## Project Overview

Implements a scientific calculator on FPGA using Verilog HDL. Supports both **basic arithmetic** and a range of **scientific functions** (power, square, square root, trigonometric operations) through modular RTL. All key development, validation, and waveform/RTL/technology views done using Vivado, Icarus Verilog, and GTKWave.

---

## Features

- **Arithmetic:** Addition, Subtraction, Multiplication, Division
- **Scientific:** Power (`a^b`), Square, Square Root, Sine, Cosine, Tangent (LUT-based, fixed-point)
- **Combinational ALU:** Bitwise AND, OR, XOR, NOT
- **Systematic Testbench:** Comprehensive verification
- **RTL & Technology Schematics:** From Vivado
- **Simulation Outputs:** CLI and waveform visuals

---

## Directory Structure

```
scientific_calculator_verilog/
│
├── Images/
│   ├── Gtkwave_output.png
│   ├── Iverilog_Output.png
│   ├── RTL Schematic.png
│   ├── Technology Scematic.png   # (RECOMMENDED: Rename to Technology Schematic.png)
│   └── Vivado_output.png
├── calc.v            # Source: All computation modules and top controller
├── testbench.v       # Systematic testbench
├── LICENSE.md
└── README.md
```

---

## Module Architecture

All logic is in `calc.v`.  
**Top-level module:** `sc` (scientific calculator controller).

- **sc:** Top module (multi-op, multi-input select)
- **alu:** Arithmetic/bitwise logic
- **square/sqrt:** Integer square/root
- **power:** Exponential calculation (integer only)
- **trig_lut, trig_lut_cos, trig_lut_tan:** Fixed-point lookup for `sin`, `cos`, `tan`

#### Operation Select (`op_code`)
| op_code | Operation         | Details                      |
|---------|-------------------|------------------------------|
| 0000    | Addition          | a + b                        |
| 0001    | Multiplication    | a * b                        |
| 0010    | Square            | a × a                        |
| 0011    | Square root       | sqrt(a) (perfect squares)    |
| 0100    | Power             | a ^ b                        |
| 0101    | Sine              | angle, output ×1000          |
| 0110    | Cosine            | angle, output ×1000          |
| 0111    | Tangent           | angle, output ×1000          |

---

## Testbench

`testbench.v` provides:
- Stimulus for all operations
- Checks for basic/scientific/trig functions
- VCD generation for waveform
- Console print of result for each test case

Example Simulation Output:
```
Addition: 10 + 20 = 30
Multiplication: 7 * 6 = 42
...
Sine: sin(30 deg) = 500 (scaled ×1000)
```

---

## Vivado & Simulation Results

**Figure 1: Icarus Verilog Output**  
![Icarus Verilog Output](Images/Iverilog_Output.png)

&nbsp;

**Figure 2: GTKWave Output**  
![GTKWave Output](Images/Gtkwave_output.png)

&nbsp;

**Figure 3: Vivado Output**  
![Vivado Output](Images/Vivado_output.png)

&nbsp;

**Figure 4: Vivado RTL Schematic**  
![RTL Schematic](Images/RTL%20Schematic.png)

&nbsp;

**Figure 5: Vivado Technology Schematic**  
![Technology Schematic](Images/Technology%20Scematic.png)
<!-- If filename renamed, update to Technology Schematic.png -->

&nbsp;

*These visuals validate all simulated and hardware-mapped operations.*

---

## How to Run the Project

### Prerequisites

- Xilinx Vivado
- Icarus Verilog, GTKWave

### 1. Clone Repository

```sh
git clone https://github.com/230140111021tej/scientific_calculator_verilog.git
cd scientific_calculator_verilog
```

### 2. Simulate (Open-Source)

```sh
iverilog -o sim_out testbench.v
vvp sim_out
gtkwave wave.vcd &
```

### 3. Vivado Flow

- Add `calc.v` and `testbench.v` in Vivado as sources
- Run behavioral simulation and synthesis
- View output, RTL schematic, and technology schematic in GUI

---

## Screenshots

All result images are found in [`Images/`](./Images/):

- **CLI & Waveform Simulation:**  
  GTKWave & Icarus Verilog, shown in `Gtkwave_output.png` and `Iverilog_Output.png`
- **Vivado Output:**  
  `Vivado_output.png`
- **Schematic Views:**  
  `RTL Schematic.png`, `Technology Scematic.png`

---

## License

Licensed under the [MIT License](LICENSE.md).

---

## Acknowledgements

- [230140111021tej](https://github.com/230140111021tej)
- Tools: Xilinx Vivado, Icarus Verilog, GTKWave

---

_For questions or improvements, open an issue or PR in this repo!_
