`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 23:07:25
// Design Name: 
// Module Name: example_13
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


module example_13();

//typedef bit [3:0] memory[0:255] mem_t;
bit [3:0] memory [0:255];
bit [1:2][7:0] word[0:3][4:1];
bit [3:0][7:0] array [0:255];
int d;
bit [63:0] a;
logic [63:0] b;
wire [3:0][7:0] c[0:15];


initial begin

$display($dimensions(memory));


$display($unpacked_dimensions(memory));


$display($left(word,1));


$display($left(word,2));
$display($left(word,3));
$display($left(word,4));
$display($right(word,3));

$display($right(word,4));
$display($low(word,1));
$display($low(word,2));

$display($low(word,1));
$display($low(word,2));

d=$dimension(array);

if(d>0)begin
for(int j=$right(array,1);j>=$low(array,1);j+=$increment(array,1))
begin
	$display(j);
end
end

$display($bits(a));
$display($bits(b));
$display($bits(c));
$display($bits(a)+$bits(b));

end
endmodule