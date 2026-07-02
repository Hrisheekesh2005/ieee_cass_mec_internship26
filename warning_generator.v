`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 15:24:40
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(

    input clk,          // 100 MHz
    input rst,
    output reg clk_1hz

);

reg [26:0] count;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        count   <= 0;
        clk_1hz <= 0;
    end

    else
    begin

        if(count == 4)
        begin
            count   <= 0;
            clk_1hz <= ~clk_1hz;
        end

        else
            count <= count + 1;

    end

end

endmodule
