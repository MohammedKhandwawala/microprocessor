`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:52 10/18/2017 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:34 10/12/2017 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(A,B,ANS,FL,opcode,clk,En);

input En;
input clk;
input [7:0] A;
input [7:0] B;
output reg[7:0] ANS;
output reg[4:0] FL;
input [3:0] opcode;
reg [8:0] tmp; 
reg [15:0] temp;

/* The following module implements a simple ALU which supplies answer of the operation in the ARS reg and manipulates values of the FL flag reg
	1.FL[0]:CARRY/BORROW/OVERFLOW BIT
	2.FL[1]:SHIFT OUT BIT
	3.FL[2]:ZERO OUTPUT BIT
	4.FL[3]:Check if A<B
	5.FL[4]:Check if A==B
*/
always @(posedge clk && En)
begin
 case (opcode)
   4'b0001 :begin
					//Does A+B and stores value in ANS along with set FL[0] ( CARRY/BORROW/OVERFLOW BIT )
					assign tmp = A + B;
					assign ANS = tmp [7:0]; 
					if(tmp[8]==1) begin FL= 5'b10000; end
					else begin FL=4'b0000; end
					$display("Addition operation"); 
				end
	4'b0010 :begin 
					//Does A-B stores in ANS and if A<B sets FL[0] and if A==B sets FL[2]
				   assign tmp = A - B;  
				   assign ANS = tmp [7:0];
				   if(A<B) FL=5'b10000;
				   else if (A==B) FL=5'b00100;
				   else assign FL=5'b00000;
					$display("Subtraction operation");
				end
	4'b0011 :begin
					//Does A*B stores in ANS and if A*B overflows sets FL[0]
					assign temp = A*B;
					assign ANS = temp [7:0];
					assign tmp=temp[15:8];
					if(tmp!=8'b0)  FL=5'b10000;
					else FL=5'b00000;
					$display("Multiplication operation");
				end
	4'b0100: begin
					//Compares A,B if A<B set FL[3] else if A==B set FL[2,3] 
					assign ANS = 8'bXXXXXXXX;
					if(A<B) assign FL=5'b00010;
					else if(A==B) assign FL=5'b00001;
					else assign FL=5'b00000;
					$display("Comparison operation");
				end
	4'b0101: begin
					//Assigns ANS as A+1 ans sets Fl[0] f overflow
				   assign tmp=A+1;
					assign ANS = tmp[7:0];
					if(tmp[8]==1) assign FL=5'b10000;
					else assign FL=5'b00000;
					$display("Increment operation");
				end
	4'b0110: begin
					//Compares A,B if A<B set FL[3] else if A==B set FL[3,4]
					assign ANS=A-1;
					if(A==0) assign FL=5'b00100;
					else assign FL=5'b00000;
					$display("Decrement operation");
				end
	4'b0111: begin
					//shifts A by 1 bit left and puts shifted value to FL[1]
					assign ANS=A<<1;
					if(A[7]==1) assign FL=5'b01000;
					else assign FL=5'b00000;
					$display("Left Shift operation");
				end
	4'b1000:	begin
					//shifts A by 1 bit right and puts shifted value to FL[1]
					assign ANS=A>>1;
					if(A[0]==1) assign FL=5'b01000;
					else assign FL=5'b00000;
					$display("Right Shift operation");
				end
   4'b1001 : begin ANS = (A % B);FL=0; $display("Modulo Division operation"); 
	end
   4'b1010 : begin ANS = (A & B);FL=0; $display("Bit-wise AND operation"); 
	end
   4'b1011 : begin ANS = (A | B);FL=0; $display("Bit-wise OR operation"); 
	end
   4'b1100 : begin ANS = (A ^ B);FL=0; $display("Bit-wise XOR operation"); 
	end
   default:  begin ANS = 8'bXXXXXXXX;FL=5'bXXXXX; end
 endcase
 if(ANS==0) FL=FL|5'b00100;
end
	//assign a=1;
endmodule 