`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2026 23:09:58
// Design Name: 
// Module Name: rand_mo
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


class rand_mo;
 rand integer Var1;
 rand integer Var2;
 constraint Var_1 {Var1 == 20;}
 constraint Var_2 {Var2 == 10;}

endclass

program rand_mo_p_38;

 rand_mo obj =new();
 initial begin 
 void'(obj.randomize()); //By default all constraint are active
 $display("Var1 : %d Var2: %d",obj.Var1,obj.Var2);
 obj.constraint_mode(0); //Both constraint Var_1,Var_2 are turned off
 void'(obj.randomize());
 $display("Var1 : %d Var2: %d",obj.Var1,obj.Var2);

obj.constraint_mode(1); //Both constraint Var_1,vAR_2 ARE TURNED ON
void'(obj.randomize());
$display("Var1 : %d Var2: %d",obj.Var1,obj.Var2);
end

endprogram
