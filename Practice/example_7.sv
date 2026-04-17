`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:51:33
// Design Name: 
// Module Name: example_7
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


module example_7();

bit [7:0] array[3];
bit arr[3];
int arr1[3];

initial
begin
	array[0]=0;
	array[1]=1;
	array[2]=512;

	$display(array[0],array[1],array[2]);
	
array[2][3]=1;
	$display(array[0],array[1],array[2]);
arr[0]=0;
arr[1]=1;
arr[2]=6;
	$display(arr[0],arr[1],arr[2]);
arr1[0]=15;
arr1[1]=1;
arr1[2]=25;
$display(arr1[0],arr1[1],arr1[2]);

end
endmodule
