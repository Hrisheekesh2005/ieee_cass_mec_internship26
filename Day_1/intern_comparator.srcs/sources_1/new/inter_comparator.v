`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 15:42:57
// Design Name: 
// Module Name: inter_comparator
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


module inter_comparator(
    input a,
    input b,
    output y0,
    output y1,
    output y2
    );
    
    assign y0= ~(a^b);
    assign y1= a&~b;
    assign y2= ~a&b;
endmodule
