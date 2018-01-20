`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:23:26 10/18/2017 
// Design Name: 
// Module Name:    EU 
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
module eu(
clk,A,B,C,ans,FL,opcode,
address,
readEnable,
writeEnable,
dataCopy,
data,
En
);
input clk;
input [1:0] En;
input [3:0] A;
input [3:0] B;
input [3:0] C;
output [7:0] ans;
output [4:0] FL;
input [3:0] opcode;
input [3:0] address;
output reg [7:0] data;
input [7:0] dataCopy; 
input readEnable;
input writeEnable;
reg [7:0]M[5:0];
reg enable;
//output reg finish;
//output reg finish2;

ALU alu(.clk(clk),.A(M[A]),.B(M[B]),.ANS(ans),.FL(FL),.opcode(opcode),.En(enable));

always @(*)
begin
data=dataCopy;
end
always @(posedge clk && (En[0] | En[1]))
begin
	if (readEnable) begin data = M[address]; enable=0;//assign finish2=1 ;
	end
	else if (writeEnable) begin M[address] = data;  enable=0;//assign finish2=1 ;
	end
end
always @(posedge clk && (~En[1] & ~En[0]))
begin
	if (~readEnable & ~writeEnable) enable =1;
end


always @(posedge clk &&(~En[1] & ~En[0]))
begin
	M[C]=ans;
end

endmodule