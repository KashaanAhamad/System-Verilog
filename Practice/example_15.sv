`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 23:04:27
// Design Name: 
// Module Name: example_15
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module example_15;

reg [7:0] mem[];

initial begin
//Allocate array for 4 location
	$display("setting array size to 4");
mem=new[4];
	$display("Initialize the array with default values");
	
for(int i=0;i<4;i++)begin
	mem[i]=i;
end

//Double the size of the array,with old content still valid
mem=new[8](mem);

$display("Current array size is %d",mem.size());

for(int i=0;i<4;i++)begin
	$display("Value at location %g is %d",i,mem[i]);
end

//Delete array
$display("Deleting the array");
mem.delete();
$display("Current array size is%d",mem.size());
#1 $finish;
end

endmodule
