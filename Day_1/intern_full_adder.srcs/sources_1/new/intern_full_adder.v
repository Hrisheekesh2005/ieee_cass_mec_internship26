`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 11:27:29
// Design Name: 
// Module Name: intern_full_adder
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


module intern_full_adder(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
  assign s=a^b^cin;
  assign cout= (a&b)|(b&cin)|(a&cin);  
endmodule
