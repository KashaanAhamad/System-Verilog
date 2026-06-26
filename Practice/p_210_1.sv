`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2026 22:33:22
// Design Name: 
// Module Name: p_210_1
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


program p_210_1;
class Transaction;
   
 static int count =0;
 int id;
   function new();
	id=count++;
   endfunction
   
   function destructor();
	count--;
   endfunction
endclass

Transaction b1,b2,b3;
initial begin
 b1=new;	//first instance, id=0
 $display(b1.id,b1.count);

b2=new;	//second instance id=1
$display(b2.id,b2.count);

b3=new;
b2.destructor();
b2=null;

$display(b3.id,b3.count);
$display(b2.id);

end
endprogram

