`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2026 22:53:40
// Design Name: 
// Module Name: p_226
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


class Parent;
 virtual task print_1();
  $display("Parent Class");
 endtask
endclass

class subclass extends Parent;
 task print_1();
  $display("This is Extended Parent Class");
 endtask
endclass

program p_226;
 subclass ea;
 Parent d;

initial begin
 d=new();
 d.print_1();
 ea=new();
 ea.print_1();
// d=ea;
 d.print_1();
end
endprogram
