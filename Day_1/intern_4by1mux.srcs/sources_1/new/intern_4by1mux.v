`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 14:56:37
// Design Name: 
// Module Name: intern_4by1mux
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


module intern_4by1mux(
    input i0,
    input i1,
    input i2,
    input i3,
    input s0,
    input s1,
    output y
    );
    wire w1,w2;
    intern_2by1mux M1(
    .a(i0),
    .b(i1),
    .s(s0),
    .y(w1)
    );
    
    intern_2by1mux M2(
    .a(i2),
    .b(i3),
    .s(s0),
    .y(w2)
    );
     intern_2by1mux M3(
    .a(w1),
    .b(w2),
    .s(s1),
    .y(y)
    );
    
endmodule
