`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 07:53:39
// Design Name: 
// Module Name: decision_logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decision_logic(

    input temp_low,
    input temp_mid,
    input temp_high,

    input vib_low,
    input vib_mid,
    input vib_high,

    output reg normal_led,
    output reg repair_led,
    output reg change_led

);

always @(*)
begin

    normal_led = 0;
    repair_led = 0;
    change_led = 0;

    // Healthy condition
    if( !(temp_low|temp_mid|temp_high|
          vib_low|vib_mid|vib_high) )
    begin
        normal_led = 1;
    end

    // Low + Low
    else if(temp_low && vib_low)
    begin
        normal_led = 1;
    end

    // Change Needed Cases
    else if( (temp_mid && vib_high) ||
             (temp_high && vib_mid) ||
             (temp_high && vib_high) )
    begin
        change_led = 1;
    end

    // Remaining valid cases
    else
    begin
        repair_led = 1;
    end

end

endmodule
