# Peak Detector with Peak-to-Peak Interval Measurement | RTL-to-GDSII ASIC Design Flow

## Project Overview

This project implements a digital Peak Detector capable of identifying the highest value in a continuously incoming 8-bit signal stream and measuring the time interval between successive peak updates.

The design was developed in Verilog HDL and implemented through a complete ASIC design flow including RTL Design, Functional Verification, Logic Synthesis, Floorplanning, Placement, Clock Tree Synthesis (CTS), Routing, and Signoff Analysis using Cadence EDA tools.

The project demonstrates how a real-time signal monitoring system can be transformed from behavioral RTL code into a synthesizable and physically implementable ASIC design.

---

## Problem Statement

Many signal-processing applications require continuous monitoring of incoming data streams to identify significant events.

Examples include:

- ECG R-Peak Detection
- Biomedical Signal Monitoring
- Sensor Data Analysis
- Event Detection Systems
- Industrial Monitoring Systems

The objective of this project is to:

1. Detect new maximum values (peaks) in an incoming signal.
2. Store the latest peak value.
3. Measure the number of clock cycles elapsed between consecutive peak detections.
4. Generate a hardware-efficient architecture suitable for ASIC implementation.

---

## Design Specifications

| Parameter | Value |
|------------|----------|
| Input Width | 8-bit |
| Peak Register Width | 8-bit |
| Interval Counter Width | 16-bit |
| Clock Divider | Parameterized |
| Design Style | Synchronous Digital Design |
| HDL | Verilog |
| Target Flow | ASIC RTL-to-GDSII |

---

## System Architecture

### 1. Clock Divider

The Clock Divider generates a periodic clock enable pulse.

**Functions:**

- Reduces effective sampling rate
- Controls peak evaluation timing
- Provides configurable division ratio

**Inputs:**

- clk
- rst_n

**Output:**

- clk_en

---

### 2. Peak Tracker Core

The Peak Tracker performs:

- Continuous monitoring of input samples
- Comparison with previously stored peak value
- Peak register update
- Peak interval calculation

**Inputs:**

- clk
- rst_n
- data_in[7:0]

**Outputs:**

- peak[7:0]
- interval[15:0]
- clk_en_out

---

## Working Principle

### Step 1

A timer continuously increments every clock cycle.

### Step 2

Whenever the clock divider generates a clock enable pulse, the incoming data sample is evaluated.

### Step 3

If:

```text
data_in > current_peak
```

then:

- Peak register is updated
- Interval register stores elapsed clock count
- Timer resets to zero

### Step 4

The process repeats continuously for all incoming samples.

---

## RTL Design

### Source Files

#### clk_divider.v

Generates periodic clock enable pulses.

#### peak_tracker_top.v

Implements:

- Peak detection logic
- Timer logic
- Peak interval measurement

#### peak_tracker_top_main.v

Top-level ASIC wrapper containing:

- Input Pads
- Output Pads
- Clock Buffer
- Core Design Integration

---

## Functional Verification

A dedicated Verilog testbench was developed to verify:

- Reset functionality
- Peak detection accuracy
- Peak update operation
- Interval measurement correctness
- Clock divider operation

Simulation was performed using Cadence Xcelium.

---

## ASIC Implementation Flow

### Stage 1: RTL Simulation

**Tool:** Cadence Xcelium

**Outputs:**

- Functional Waveforms
- RTL Verification Results

---

### Stage 2: Logic Synthesis

**Tool:** Cadence Genus

**Generated Reports:**

- Area Report
- Timing Report
- Power Report
- Gate Count Report
- Synthesized Netlist
- SDF File

---

### Stage 3: Floorplanning

**Tool:** Cadence Innovus

**Activities:**

- Core area generation
- IO placement
- Power ring creation
- Power pad assignment

---

### Stage 4: Placement

**Activities:**

- Standard cell placement
- Congestion optimization
- Timing optimization

---

### Stage 5: Clock Tree Synthesis (CTS)

**Activities:**

- Clock buffer insertion
- Clock skew reduction
- Timing balancing

---

### Stage 6: Routing

**Activities:**

- Global Routing
- Detailed Routing
- Design Rule Compliance

---

### Stage 7: Signoff

**Generated Reports:**

- Timing Closure Reports
- DRC Verification
- Connectivity Verification
- Final Physical Design Reports

---

## Project Directory Structure

```text
Peak-Detector/
│
├── RTL/
│   ├── clk_divider.v
│   ├── peak_tracker_top.v
│   └── peak_tracker_top_main.v
│
├── Testbench/
│   └── tb_peak_tracker.v
│
├── Documentation/
│   └── Team_6_IC_Internship_Project.pdf
│
└── README.md

```

---

## Tools Used

| Tool | Purpose |
|--------|----------|
| Verilog HDL | RTL Design |
| Cadence Xcelium | Functional Simulation |
| Cadence Genus | Logic Synthesis |
| Cadence Innovus | Physical Design |
| Git | Version Control |
| GitHub | Project Management |

---

## Project Results

The design was successfully:

- ✔ RTL Simulated
- ✔ Functionally Verified
- ✔ Synthesized using Cadence Genus
- ✔ Floorplanned using Cadence Innovus
- ✔ Placed and Optimized
- ✔ Clock Tree Synthesized
- ✔ Routed
- ✔ Verified through ASIC Physical Design Flow

---

## Internship Context

This project was developed as part of the **IEEE CASS Kerala Chapter Summer Internship on Digital IC Design Using Cadence Tools (2026)**.

The internship provided hands-on exposure to the complete ASIC RTL-to-GDSII implementation flow using industry-standard Cadence EDA tools, enabling practical experience in:

- RTL Design
- Functional Verification
- Logic Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis
- Routing
- Physical Verification

---

## Author

**Hrisheekesh Narayan P E**

B.Tech Electronics and Communication Engineering  
Cochin University of Science and Technology (CUSAT)  
Kerala, India

---
Team:
Jacob
Avanthika
## License

This project is intended for educational and academic purposes.
