`timescale 1ns/1ps

module counter_tb;
	reg clk;
	reg rst;
	reg up_down;
	wire [7:0] count;
	
	//DUT Instantiation
	counter dut (
    		.clk(clk),
   		.rst(rst),
    		.up_down(up_down),
    		.count(count)
);

	// Clock Generation (10 ns period)
	always #5 clk = ~clk;

	// Stimulus
	initial begin
    		clk = 0;
   		// Initialize
    		rst     = 1;
    	repeat(10) @(posedge clk);
    
    		rst = 0;
		up_down = 1;
		//Count UP for 10 cycles
		repeat(20)@(posedge clk);
		
		up_down=0;
		repeat(20)@(posedge clk);

	//Finish simulation
		#20;
		$finish;
end
endmodule
	
