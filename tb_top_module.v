`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tb_top_module
// Description: Automated Testbench for the Complete Warning System
//////////////////////////////////////////////////////////////////////////////////

module tb_top_module();

    // 1. Declare signals to connect to the DUT (Device Under Test)
    reg clk;
    reg rst;
    reg [7:0] temp_value;
    reg signed [7:0] vib_value;

    wire normal_led;
    wire repair_led;
    wire change_led;

    // 2. Instantiate the top_module
    top_module uut (
        .clk(clk),
        .rst(rst),
        .temp_value(temp_value),
        .vib_value(vib_value),
        .normal_led(normal_led),
        .repair_led(repair_led),
        .change_led(change_led)
    );

    // 3. Generate the 100MHz Base Clock (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // 4. Automated Stimulus
    initial begin
        // Initialize Inputs
        rst = 1;
        temp_value = 8'd0;
        vib_value = 8'sd0;

        // Wait 100ns, then release reset
        #100;
        rst = 0;

        $display("--- Starting Simulation ---");

        // ----------------------------------------------------
        // SCENARIO 1: Healthy Operation
        // Expected: normal_led = 1 constantly
        // ----------------------------------------------------
        $display("Time %0t: SCENARIO 1 - Healthy", $time);
        temp_value = 8'd100; // < 191
        vib_value  = 8'sd50; // < 119
        #1000; // Wait 10 virtual ticks

        // ----------------------------------------------------
        // SCENARIO 2: Temperature Danger Only
        // Expected: Escapes healthy -> triggers repair_led
        // ----------------------------------------------------
        $display("Time %0t: SCENARIO 2 - High Temp", $time);
        rst = 1; #100; rst = 0; // Reset counters
        
        temp_value = 8'd200; // > 191 (DANGER)
        vib_value  = 8'sd50; // < 119 (SAFE)
        
        // Wait 2500ns (25 virtual ticks) to observe it cross the
        // 5-tick, 10-tick, and 20-tick thresholds over time.
        #2500; 

        // ----------------------------------------------------
        // SCENARIO 3: Both Sensors in Danger (The Ultimate Test)
        // Expected: 
        // 0-5 ticks: normal_led = 1
        // 5-10 ticks: normal_led = 1 (Low+Low condition)
        // 10-20 ticks: repair_led = 1
        // 20+ ticks: change_led = 1 (High+High condition)
        // ----------------------------------------------------
        $display("Time %0t: SCENARIO 3 - Both Sensors Danger", $time);
        rst = 1; #100; rst = 0; // Reset counters
        
        temp_value = 8'd210; // > 191 (DANGER)
        vib_value  = 8'sd125; // > 119 (DANGER)
        
        #2500; // Wait enough time for all 3 warnings to trigger

        // ----------------------------------------------------
        // SCENARIO 4: Recovery
        // Expected: Instantly drop warnings and return to normal_led
        // ----------------------------------------------------
        $display("Time %0t: SCENARIO 4 - Recovery to Safe", $time);
        temp_value = 8'd100;
        vib_value  = 8'sd50;
        
        #500;

        $display("Time %0t: Simulation Complete!", $time);
        
        // Stop the simulation automatically
        $finish; 
    end

endmodule