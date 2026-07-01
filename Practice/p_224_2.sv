`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 23:08:15
// Design Name: 
// Module Name: p_224_2
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


program p_224_2;
 class A;
   integer data;
   local integer addr;
   protected integer cmd;
   static integer cred;
 function new();
  begin
   data=100;
   addr=200;
   cmd=1;
   cred=10;
  end
 endfunction

 task printA();
  $write("value of data %0d in A\n",data);
  $write("value of ADDR %0d in A\n",ADDR);
  $write("value of cmd %0d in A\n",cmd);
 endtask
endclass

class B extends A;
 task printB();
  begin
	$write("Value of data %0d in B\n",data);
//Below line will give compile error
//$write("Value of addr %0d in B\n",addr);
$write("value of cmd %0d in B\n",cmd);
end
endtask
endclass

class C;
A a;
B b;
function new();
 begin
  a=new();
  b=new();
  b.data=2;
end
endfunction
task printC();
 $write("vlue of data %0d in c\n",a.data);
 $write("value of data %0d in C\n",b.data);
//Below line will give compile error
//$write("value of addr %0d in C\n",a.addr);

//$write("value of cmd %0d in C\n",a.cmd);
//$write("value of addr %0d in C\n",b.addr);
//$write("value of cmd %0d in C\n",b.cmd);

endtask
endclass

initial begin
C c=new();

c.a.printA();
c.b.printB();
c.printC();

 $write("value of credits is %0d \n",c.a.cred);
 $write("value of credits is %0d \n",c.b.cred);
 c.a.cred++;
 $write("value of credits is %0d \n",c.a.cred);
 $write("value of credits is %0d \n",c.b.cred);
 c.b.cred++;
 $write("value of credits is %0d \n",c.a.cred);
 $write("value of credits is %0d \n",c.b.cred);
end
endprogram

