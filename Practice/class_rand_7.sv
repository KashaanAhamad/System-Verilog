`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2026 23:23:47
// Design Name: 
// Module Name: class_rand_7
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


program class_rand_7;
 class Class_t;
  rand int Var1;
  int Var2;
 endclass

class Rand_class;
 rand Class_t Cla; //To randomize Var1, Class_t type declared as rand
 function new();
 Cla=new();
 endfunction
endclass

Rand_class RC =new();

initial repeat(10)
 if(RC.randomize())
  $display("Var1: %0d  Var2: %0d", RC.Cla.Var1, RC.Cla.Var2);
endprogram
