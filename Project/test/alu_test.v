`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:03:37 10/18/2017
// Design Name:   ALU
// Module Name:   C:/Users/Mohammed Khandwawala/Desktop/desktop/test/alu_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [3:0] opcode;
	reg clk;
	reg En;

	// Outputs
	wire [7:0] ANS;
	wire [3:0] FL;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ANS(ANS), 
		.FL(FL), 
		.opcode(opcode), 
		.clk(clk), 
		.En(En)
	);

	initial begin
		// Initialize Inputs
		A = 4;
		B = 3;
		opcode = 0001;
		clk = 0;
		En = 0;

		// Wait 100 ns for global reset to finish
		#100;
        clk = 1;
		  #100;
		  En=1;
		  #100;
		  clk=0;
		  #100;
		  clk=1;
		// Add stimulus here

	end
      
endmodule

