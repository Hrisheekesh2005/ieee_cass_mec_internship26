`timescale 1 ns/10 ps
module counter_main(
    input  clk_pad,
    input  rst_pad,       // Synchronous reset
    input  up_down_pad,
    output [7:0] count_pad
);
wire clk,rst,up_down;
wire counter_clk;
reg [7:0]count;

//PAD
pc3d01 pc3d01_1 (.PAD(clk_pad), .CIN(counter_clk));
pc3c01 pc3c01_1 (.CCLK(counter_clk), .CP(clk)); 
pc3d01 pc3d01_2 (.PAD(rst_pad), .CIN(rst));
pc3d01 pc3d01_3 (.PAD(up_down_pad), .CIN(up_down));

pc3o05 pc3o05_1 (.I(count[0]), .PAD(count_pad[0]));
pc3o05 pc3o05_2 (.I(count[1]), .PAD(count_pad[1]));
pc3o05 pc3o05_3 (.I(count[2]), .PAD(count_pad[2]));
pc3o05 pc3o05_4 (.I(count[3]), .PAD(count_pad[3]));

pc3o05 pc3o05_5 (.I(count[4]), .PAD(count_pad[4]));
pc3o05 pc3o05_6 (.I(count[5]), .PAD(count_pad[5]));
pc3o05 pc3o05_7 (.I(count[6]), .PAD(count_pad[6]));
pc3o05 pc3o05_8 (.I(count[7]), .PAD(count_pad[7]));

always @(posedge clk) begin
    if (rst)
        count <= 8'b00000000;
    else if (up_down)
        count <= count + 1'b1;   // Count up
    else
        count <= count - 1'b1;   // Count down
end
endmodule
