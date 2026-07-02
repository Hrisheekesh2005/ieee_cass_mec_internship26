`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 14:43:58
// Design Name: 
// Module Name: intern_mux2by1_tb
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


`timescale 1ns / 1ps

module mux2x1_tb;

reg a, b, s;
wire y;

intern_2by1mux uut (
    .a(a),
    .b(b),
    .s(s),
    .y(y)
);

initial begin
    a=0; b=0; s=0; #10;
    a=0; b=1; s=0; #10;
    a=1; b=0; s=0; #10;
    a=1; b=1; s=0; #10;

    a=0; b=0; s=1; #10;
    a=0; b=1; s=1; #10;
    a=1; b=0; s=1; #10;
    a=1; b=1; s=1; #10;

    $finish;
end

initial begin
    $monitor("a=%b b=%b s=%b y=%b", a, b, s, y);
end

endmodule
