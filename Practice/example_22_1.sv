`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:10:23
// Design Name: 
// Module Name: example_22_1
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


module ex22_1();
//size of every element in union must be same
//type of element may differ

typedef union packed{
logic [7:0] a;
byte b;
bit [7:0] c;
}my_data_union;

my_data_union abc;
initial begin
	abc.c='{254};
	$display(abc);//pointer reference
	
	$display("c=%d ",abc.c);
	abc.a=123;
	
	$display("a value is %d",abc.a);
	$display("b value is %d",abc.b);
	abc.a=8'b01xz01xz;
	$display("a value is %b",abc.a);
	$display("b value is %b",abc.b);
	
end
endmodule