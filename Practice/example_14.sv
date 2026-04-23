`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 23:03:17
// Design Name: 
// Module Name: example_14
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


module example_14();

string d[1:5]='{"a","b","c","d","e"};
string p[];
int dyna[],d2[];

initial begin
	p={d[1:3],"hello",d[4:5]};
$display(p);
end

initial begin
	dyna=new[5];
foreach(dyna[j])
	dyna[j]=j;
	d2=dyna;

d2[0]=5;
$display(dyna[0],d2[0]);
$display(dyna,d2);
dyna=new[20](dyna);
$display(dyna);
dyna=new[100];

$display(dyna);
dyna.delete();

end
endmodule
