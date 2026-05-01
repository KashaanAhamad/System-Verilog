`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:07:13
// Design Name: 
// Module Name: example_21
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


module example_21();
int d[]='{9,1,8,3,4,4}, tq[$];
int q[$]='{1,3,5,7,4,3};
int f[6] ='{1,6,2,6,8,6};

int count,total;
string s[]={"hellow","sad","world"};
logic [4:1] b=4'bxz01;
byte b2[] ={1,2,3,4};
int y;

initial begin
	tq=d.find with(item>3);
	tq=d.find_index with (item>99);
	tq=d.find_first_index with (item ==8);
	tq= d.find_last_index with (item==4);
	$display(q.sum,q,product);
	
	tq=q.min();
	tq=q.max();
	tq=f.unique();
	count = d.sum with (item>7);//count =d.sum with (int'(item>7))
	total=d.sum with ((item>7)*item);
	count=d.sum with (item<8);
	total=d.sum with (item<8?item:0);
	count=d.sum with ((item ==4)?1:0);
	s.reverse;
	//b.reverse;//does b becomes 4'b10xz? NO
	q.sort;
	
	y=b2.sum;//1+2+3+4
	y=b2.product;//1*2*3*4
	y=b2.xor with (item +4);//5^6^7^8
end
endmodule
