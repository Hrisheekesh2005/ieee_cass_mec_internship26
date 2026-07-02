`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 15:26:16
// Design Name: 
// Module Name: comparator_temp
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


module comparator_temp(

    input [7:0] temp_value,
    output temp_comp

);

parameter TEMP_THRESHOLD = 8'd191;

assign temp_comp = (temp_value > TEMP_THRESHOLD);

endmodule
