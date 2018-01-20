`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:10:45 10/26/2017 
// Design Name: 
// Module Name:    cu 
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
module cu(clk,instruction,fl);
input [16:0] instruction;
input clk;
reg [7:0]Main[255:0];
wire [7:0] data;
reg [1:0] enable;
reg enable2;
reg enable4;
reg [1:0]enable3;
reg [7:0] temp1;
reg [7:0] temp2;
reg [3:0] temp3;
reg [3:0] temp4;
wire [7:0] ANS; 
output [4:0] fl;
//output reg finish;
wire finish1;
wire finish2;
always@(posedge clk)
begin
case (instruction[16:12])
	5'b10001 :begin
						temp3 = instruction[11:8]; 
						temp2 = instruction[7:0];
						enable = 2'b10;
						enable2 = 1;
				 end
	5'b10000 :begin
						temp3 = instruction[11:8];
						temp1 = instruction[7:0];
						enable = 2'b10;
						enable4 = 1;
				end
	5'b01111 :begin 
						temp3 = instruction[11:8];
						temp1 = instruction[7:0];
						enable = 2'b10;
				end
   5'b01101 :begin
						temp1 = instruction[7:0];
						temp2=Main[temp1];
						temp3=instruction[11:8];
						enable=2'b01;
				end
	5'b01110 :begin
						temp2=instruction[7:0];
						temp3=instruction[11:8];
						enable=2'b01;
				end
	5'b10010 :begin 
						temp1 = instruction[7:0];
						temp3=instruction[11:8];
						enable=2'b10;
				end
	default: begin
						temp1=instruction[15:12];
						temp2=instruction[11:8];
						temp3=instruction[7:4];
						temp4=instruction[3:0];
						enable=2'b00;
				end
	endcase	
end

eu eu1(.clk(clk),.A(instruction[11:8]),.B(instruction[7:4]),.C(instruction[3:0]),.ans(ANS),.FL(fl),.opcode(instruction[15:12]),.address(temp3),.readEnable(enable[1]),.writeEnable(enable[0]),.dataCopy(temp2),.data(data),.En(enable));

always @(posedge clk &&(instruction[16:12] == 5'b01111))
begin
	Main[temp1]=data;
end
always @(posedge clk && instruction[16:12] == 5'b10001 && enable2 == 1)
begin
	if(enable2==1) temp3 = data[3:0];
	enable = 2'b01;
	enable2 = 0;
end
always @(posedge clk && instruction[16:12] == 5'b10000 && enable4 == 1)
begin
	enable = 2'b01;
	temp3 = temp1[7:4];
	temp2 = data;
	enable4 = 0;
end
endmodule
