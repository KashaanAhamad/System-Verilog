`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2026 23:34:36
// Design Name: 
// Module Name: rand_p_9
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


class rand_cl;
 rand bit [0:2] Var;
 constraint limit_c{Var <4;}
endclass

program rand_p_9;
 rand_cl obj;
 integer count_0,count_1,count_2,count_3;
 
initial begin
 obj=new();
 count_0=0; count_1=0; count_2=0; count_3=0;
 
repeat(50) begin
 void'(obj.randomize());
 if(obj.Var==0) 
 	count_0++;
 else if(obj.Var==1) 
 	count_1++;
 else if(obj.Var==2) 
 	count_2++;
 else if(obj.Var==3) 
 	count_3++;
end

$display("count_0=%0d, count_1=%0d,count_2=%0d, count_3=%0d",count_0,count_1,count_2,count_3);
end
endprogram
