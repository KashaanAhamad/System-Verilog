`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:09:16
// Design Name: 
// Module Name: example_22
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


module example_22();
typedef struct packed{
	int a;
	byte b;
	bit [7:0] c;
}my_data_struct;

my_data_struct abc;

initial begin
	abc ='{1234,8'b10,8'h20};
	$display(abc);//pointer reference
	
	$display("a=%d , b=%d, c=%d",abc.a,abc.b,abc.c);
	abc.a=123;
	$display("a value is %d",abc.a);
	abc='{a:1234,default:8'h20};
	$display(abc);
end
endmodule