`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 22:58:31
// Design Name: 
// Module Name: p_227_1
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


class foo #(int size =3);
 bit [size:0]a;
 task print_1();
  $display("Size of the vector a is %d",$size(a));
 endtask
endclass

program p_227_1();
initial begin
 foo f1;
 foo #(4) f2;
 foo #(5) f3;
 f1=new();
 f2=new();
 f3=new();
f1.print_1();
f2.print_1();
f3.print_1();
end 
endprogram
