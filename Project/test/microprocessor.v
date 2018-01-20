`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:31:50 11/04/2017 
// Design Name: 
// Module Name:    microprocessor 
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

module microprocessor(clk);
input clk;
wire [16:0] programmem [31:0];
reg [4:0] programcounter = 5'b00000;
reg En = 1;
wire [4:0] flag;
reg [4:0] delay = 5'b00000;
reg [4:0] temp ;
reg [2:0] temp1 ;

//assign	programmem[0] = 17'b01110000100000010;
		
//assign	programmem[1] = 17'b01110000000000001;
		
//assign	programmem[2] = 17'b00001000100000010;

//assign	programmem[3] = 17'b01111001011111111;

//assign	programmem[4] = 17'b10001001001010011;
		
//assign	programmem[4] = 17'b10000000101000000;	

assign programmem[0] = 17'b01110000100000100;

assign programmem[1] = 17'b01110001000000001;

assign programmem[2] = 17'b01110010000000001;

assign programmem[3] = 17'b00011000100100011;

assign programmem[4] = 17'b1000000110010xxxx;

assign programmem[5] = 17'b00010000101000000;

assign programmem[6] = 17'b1000000000001xxxx;

assign programmem[7] = 17'b0010000010100xxxx;

assign programmem[8] = 17'b1111100000100xxxx;

/*assign programmem[8] = 17'b1000000110010xxxx;

assign programmem[9] = 17'b00010000101000000;

assign programmem[10] = 17'b1000000000001xxxx;

assign programmem[11] = 17'b0010000010100xxxx;

assign programmem[12] = 17'b1000000110010xxxx;

assign programmem[13] = 17'b00010000101000000;

assign programmem[14] = 17'b1000000000001xxxx;

assign programmem[15] = 17'b0010000010100xxxx;

assign programmem[16] = 17'b1000001010110xxxx;*/
always @(posedge clk && delay<31)
begin 
		delay=delay+1;
end

always @(posedge delay[4] && programcounter<9)
begin
	delay =5'b00000;
	programcounter=programcounter+1;
	En=0;
end
always @(posedge delay[4] && programcounter<9)
begin	
	temp = programmem[programcounter-1][8:4];
	temp1 = programmem[programcounter-1][11:9];
	if(programmem[programcounter-1][16:12]==5'b11111)
	begin
		if(flag[temp1]==0) programcounter=temp;
	end

end

cu cu1(.clk(clk),.instruction(programmem[programcounter-1]),.fl(flag));
endmodule
