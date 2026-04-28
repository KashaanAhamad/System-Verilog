`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:05:52
// Design Name: 
// Module Name: example_20
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


module ex20();
bit on[10];
int summ;
int d[]='{9,1,8,3,4,4};
initial begin
	foreach(on[i])
		on[i]=i;//0,1,0,1,0,1
$display(on.sum);//1
summ=on.sum;
$display(summ);//summ=1 or summ=5?
end

initial begin
	d.reverse();
	$display(d);
	d.sort();
	$display(d);
	d.rsort();
	$display(d);
	d.shuffle();
	$display(d);
	d.shuffle();
	$display(d);

end
endmodule
