# Scientific Calculator

This repository contains the design and implementation of a Scientific Calculator using Vivado. The project demonstrates the use of hardware description languages (HDLs)—such as Verilog or VHDL—in developing and simulating a scientific calculator on FPGA hardware. The calculator supports basic arithmetic operations along with a selection of advanced mathematical functions typically found in a scientific calculator.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [How to Run](#how-to-run)
- [Vivado Implementation](#vivado-implementation)
- [Screenshots / Simulation Results](#screenshots--simulation-results)
- [License](#license)
- [Acknowledgements](#acknowledgements)

---

## Overview

The Scientific Calculator project is a digital design implemented and simulated using Vivado Design Suite. The goal of the project is to provide hands-on experience in hardware programming for mathematical operations and to demonstrate the workflow from coding to simulation and synthesis in FPGA development environments.

This calculator can handle a variety of operations such as addition, subtraction, multiplication, division, and may include advanced operations like exponentiation, trigonometric functions (sin, cos, tan), logarithmic functions, and square root (depending on your HDL implementation).

## Features

- **Basic Arithmetic Operations**  
  - Addition (+)
  - Subtraction (-)
  - Multiplication (×)
  - Division (÷)

- **Advanced Functions**  
  (Supported features may vary depending on your design)
  - Exponentiation (x^y)
  - Square root (√x)
  - Trigonometric functions (sin, cos, tan)
  - Logarithmic functions (log)

- **FPGA Implementation**  
  - Written in HDL (Verilog/VHDL)
  - Synthesizable for deployment on FPGA
  - Testbench and simulation support

- **Vivado Project**  
  - Source files, constraints, simulation scripts compatible with Xilinx Vivado Design Suite.

## Project Structure

```
scientific_calculator/
│
├── src/                  # HDL source files (Verilog/VHDL)
├── tb/                   # Testbench files for simulation
├── constraints/          # XDC (constraints) files
├── simulation/           # Simulation outputs and scripts
├── vivado_project/       # Vivado-specific project files
└── README.md
```

- **src/**: Contains the main calculator logic implemented in HDL.
- **tb/**: Includes testbenches for verifying the functionality of individual modules and the overall calculator.
- **constraints/**: Contains constraint files (.xdc) to map the design onto FPGA pins.
- **simulation/**: May include scripts and result files generated during simulation.
- **vivado_project/**: Vivado project files, such as project settings and logs.

## How to Run

### Prerequisites

- Xilinx Vivado Design Suite (version as per your implementation)
- Compatible FPGA development board (e.g., Xilinx Spartan, Artix series)
- Source files (provided in this repository)

### Steps

1. **Clone the repository**

    ```bash
    git clone https://github.com/230140111021tej/scientific_calculator.git
    cd scientific_calculator
    ```

2. **Open Vivado**

    - Launch Vivado Design Suite.
    - Create a new project or open the provided project in `vivado_project/`.

3. **Add Source Files**

    - Add the HDL source files from `src/` and testbenches from `tb/` to your project.

4. **Set Up Constraints**

    - Import constraint files from `constraints/` as per your FPGA board.

5. **Synthesize and Implement**

    - Run synthesis and implementation.
    - Review any warnings or errors and resolve as necessary.

6. **Simulation**

    - Simulate your design using the testbenches.
    - Review waveform outputs to verify correct functionality.

7. **Generate Bitstream & Deploy**

    - After successful implementation, generate the bitstream.
    - Program your FPGA board using the generated bitstream.

## Vivado Implementation

This project was fully designed, simulated, and synthesized using Xilinx Vivado. The Vivado toolchain provides an integrated flow from RTL design entry and simulation to device programming.

**Key Vivado tasks performed:**
- RTL design entry using HDL
- Functional and timing simulation
- Synthesis and implementation targeting a specific FPGA
- Timing analysis and resource utilization checking
- Bitstream generation and hardware programming

> **Note:** If any IP cores or additional Vivado-specific modules were used in the design, their details should be provided here along with instructions for their configuration.

## Screenshots / Simulation Results

<!-- If you have any waveform screenshots, simulation images, or hardware test photos, include them here. Example placeholder: -->
```text
[Insert Vivado simulation waveform screenshots or FPGA implementation photos here]
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- Developed by [230140111021tej](https://github.com/230140111021tej)
- Thanks to Xilinx for Vivado Design Suite and FPGA hardware documentation.

---

For questions or contributions, please submit an issue or pull request on GitHub.
