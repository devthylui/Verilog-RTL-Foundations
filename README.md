# Verilog HDL & Digital Logic

This repository documents my transition from theoretical digital logic to practical RTL design. It serves as a structured library of core components implemented in **Verilog HDL**, focusing on the fundamental design-to-synthesis flow for CPLD platforms.

## 🛠️ Tools & Technologies
- **Hardware:** Intel MAX II EPM240T100C5 CPLD
- **Synthesis:** Intel Quartus Prime Lite
- **Simulation:** ModelSim (Directed Testbenches)
- **Language:** Verilog HDL (IEEE 1364-2001)

## 🚀 CPLD Hardware Implementation
While this repository contains various logic exercises, the following modules have been fully synthesized, pin-mapped, and hardware-verified on the **MAX II** platform to demonstrate an understanding of hardware constraints and resource utilization:

* **2-bit ALU**: Arithmetic and logic implementation with an external circuit for physical I/O.
* **Hexadecimal to 7-Segment Decoder**: Combinational logic for full numeric and alpha (A-F) display.
* **Up/Down Counters**: Asynchronous ripple counters interfaced with 7-segment hardware.
* **State Diagram FSM**: Sequence detection and control logic implementation.
* **SRAM Logic**: Basic memory read/write cycle modeling.

## 📂 Repository Structure
*Note: Each directory includes functional RTL and corresponding directed testbenches.*

### [00 Verification Methodology](./00%20Verification%20Methodology)
- Directed testbench development, task/function usage, and hierarchical module instantiation.

### [01 Language Foundations](./01%20Language%20Foundations)
- Syntax and semantics: Blocking vs. Non-blocking assignments and coding standards.

### [02 Modeling Techniques](./02%20Modeling%20Techniques)
- Structural (Gate-level), Dataflow (`assign`), and Behavioral (`always`) modeling styles.

### [03 Basic Components](./03%20Basic%20Components)
- Fundamental building blocks: Flip-Flops (JK, D, T), Counters, and Decoders.

### [04 Intermediate Modules](./04%20Intermediate%20Modules)
- Integrated logic: 2-bit ALU, SRAM modeling, and FSM.

## 📊 Verification & Documentation
To ensure a consistent design flow, projects include:
- **Functional Simulation**: ModelSim transcripts documenting logic results and comparison remarks.
- **Waveform Analysis**: Timing diagrams verifying signal transitions.
- **Synthesis Reports**: Quartus Flow Summaries detailing Logic Element (LE) count and pin utilization for the hardware-targeted modules listed above.

---

### Contact & Portfolio
For inquiries regarding my RTL workflow, feel free to connect via LinkedIn.

**LinkedIn:** [www.linkedin.com/in/jrnestortappa](https://www.linkedin.com/in/jrnestortappa)
