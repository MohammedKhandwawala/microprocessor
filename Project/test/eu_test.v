`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:41:51 10/18/2017
// Design Name:   eu
// Module Name:   C:/Users/Mohammed Khandwawala/Desktop/desktop/test/EU_test.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EU_test;

	// Inputs
	reg clk;
	reg [7:0] A;
	reg [7:0] B;
	reg [3:0] opcode;
	reg [7:0] address;
	reg readEnable;
	reg writeEnable;
	reg [7:0] dataCopy;

	// Outputs
	wire [7:0] ANS;
	wire [3:0] FL;
	wire [7:0] data;
	
	
	
	// Instantiate the Unit Under Test (UUT)
	eu uut (
		.clk(clk), 
		.A(A), 
		.B(B), 
		.ans(ANS), 
		.FL(FL), 
		.opcode(opcode), 
		.address(address), 
		.readEnable(readEnable), 
		.writeEnable(writeEnable), 
		.dataCopy(dataCopy), 
		.data(data)
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
		A = 0;
		B = 0;
		opcode = 0001;
		address = 0;
		readEnable = 0;
		writeEnable = 1;
		dataCopy = 3;

		// Wait 100 ns for global reset to finish
		#100;
		A = 0;
		B = 0;
		opcode = 0001;
		address = 1;
		readEnable = 0;
		writeEnable = 1;
		dataCopy = 4;
		#100;
		A = 0;
		B = 0;
		opcode = 0001;
		address = 2;
		readEnable = 0;
		writeEnable = 0;
		dataCopy = 0;

		/*#100;
		
		A = 0;
		B = 0;
		opcode = 0;
		address = 0;
		readEnable = 0;
		writeEnable = 0;
		dataCopy = 0;

		#100;
		
		A = 0;
		B = 0;
		opcode = 0;
		address = 0;
		readEnable = 0;
		writeEnable = 0;
		dataCopy = 0;
*/
		// Add stimulus here

	end
      
endmodule

