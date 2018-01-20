`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:45:19 10/30/2017
// Design Name:   cu
// Module Name:   C:/Users/Mohammed Khandwawala/Desktop/desktop/test/cutest.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cutest;

	// Inputs
	reg clk;
	reg [16:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	cu uut (
		.clk(clk), 
		.instruction(instruction)
	);
	initial begin
		clk=0;
		forever begin
		#10;
		clk=~clk;
		end
	end
	initial begin
		// Initialize Inputs
		clk=0;
		instruction = 17'b01110000100000011;

		// Wait 100 ns for global reset to finish
		#100;
		instruction = 17'b01110000000000001;
		#100;
		instruction = 17'b00001000100000010;
		#100;
		instruction = 17'b01111001011111111;
		#100;
		instruction = 17'b010000001001000000;
		#100;
		// Add stimulus here

	end
      
endmodule

