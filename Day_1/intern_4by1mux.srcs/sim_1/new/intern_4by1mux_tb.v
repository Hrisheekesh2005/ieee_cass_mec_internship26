`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 15:02:45
// Design Name: 
// Module Name: intern_4by1mux_tb
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


`timescale 1ns/1ps

module intern_4by1mux_tb;

reg i0,i1,i2,i3;
reg s0,s1;
wire y;

intern_4by1mux uut(
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .s0(s0),
    .s1(s1),
    .y(y)
);

initial begin

    i0=0; i1=1; i2=0; i3=1;

    s1=0; s0=0; #10;
    s1=0; s0=1; #10;
    s1=1; s0=0; #10;
    s1=1; s0=1; #10;

    $finish;
end

initial begin
    $monitor("s1=%b s0=%b y=%b",s1,s0,y);
end

endmodule