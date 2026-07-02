`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026
// Design Name: 
// Module Name: system_top
// Project Name: 
// Target Devices: xc7s5ocsga324-1 (Spartan-7)
// Tool Versions: Vivado
// Description: Complete integration of the 100MHz to 1Hz clock divider, 
//              temperature/vibration comparators, warning generator, 
//              and final decision logic.
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module(
    input  wire clk,            // 100 MHz base clock from FPGA
    input  wire rst,
    input  wire [7:0] temp_value,
    input  wire signed [7:0] vib_value, // Explicitly signed to match your comparator_vib

    output wire normal_led,
    output wire repair_led,
    output wire change_led
);

// =========================================================
// Internal Interconnect Wires
// =========================================================
wire clk_1hz_sig;       // 1Hz clock from divider to timers
wire temp_comp_sig;     // Temp comparator to warning generator
wire vib_comp_sig;      // Vib comparator to warning generator

wire t_low, t_mid, t_high; // Temp warnings to decision logic
wire v_low, v_mid, v_high; // Vib warnings to decision logic

// =========================================================
// 1. Clock Management
// =========================================================
clock_divider clk_div_inst (
    .clk(clk),
    .rst(rst),
    .clk_1hz(clk_1hz_sig)
);

// =========================================================
// 2. Sensor Comparators
// =========================================================
comparator_temp temp_cmp_inst (
    .temp_value(temp_value),
    .temp_comp(temp_comp_sig)
);

comparator_vib vib_cmp_inst (
    .vib_value(vib_value),
    .vib_comp(vib_comp_sig)
);

// =========================================================
// 3. Combined Warning Generator (Timers)
// =========================================================
warning_generator warn_gen_inst (
    .clk_1hz(clk_1hz_sig),    // Driven by the clock divider
    .rst(rst),
    
    // Inputs from comparators
    .temp_comp(temp_comp_sig),
    .vib_comp(vib_comp_sig),
    
    // Temperature warning outputs
    .temp_low(t_low),
    .temp_mid(t_mid),
    .temp_high(t_high),
    
    // Vibration warning outputs
    .vib_low(v_low),
    .vib_mid(v_mid),
    .vib_high(v_high)
);

// =========================================================
// 4. Final Decision Logic
// =========================================================
decision_logic decision_inst (
    // Inputs from warning generator
    .temp_low(t_low),
    .temp_mid(t_mid),
    .temp_high(t_high),
    
    .vib_low(v_low),
    .vib_mid(v_mid),
    .vib_high(v_high),
    
    // Physical outputs to LEDs
    .normal_led(normal_led),
    .repair_led(repair_led),
    .change_led(change_led)
);

endmodule
