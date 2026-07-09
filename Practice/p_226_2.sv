`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2026 23:54:25
// Design Name: 
// Module Name: p_226_2
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


virtual class Parent;
 virtual task print_1();
  $display("Parent Class");
 endtask
endclass

class subclass extends Parent;
 task print_1();
  $display("Subclass class");
 endtask
endclass

program p_226_2;
 subclass ea;
 Parent a;

initial begin
ea=new();
a=ea;
ea.print_1();
a.print_1();
//a=new(); //this will not work as the class is virtual
//a.print_1();
end
endprogram
