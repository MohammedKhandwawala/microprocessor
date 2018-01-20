`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:45:26 11/04/2017
// Design Name:   microprocessor
// Module Name:   C:/Users/Mohammed Khandwawala/Desktop/desktop/test/microtest.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: microprocessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module microtest;

	// Inputs
	reg clk;
	// Outputs
	//reg [2:0] delay;
	// Instantiate the Unit Under Test (UUT)
	microprocessor uut (
		.clk(clk)
	);

	initial begin
		clk=0;
		forever begin
		#1
		clk = ~clk;
		end
		end		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

      
endmodule

