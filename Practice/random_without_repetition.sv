`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2026 23:15:54
// Design Name: 
// Module Name: random_without_repetition
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


module random_without_repetition();
 integer num,i,j,index;
 integer arr[9:0];
 
 reg ind[9:0];
 reg got;
 
 initial begin
  index=0;
  for(i=0;i<10;i=i+1)
  begin
   arr[i]=i;
   ind[i]=1;
  end

for(j=0;j<10;j=j+1)
begin
 got=0;
 while(got==0)
 begin
   index= {$random}%10;
   if(ind[index]==1)
   begin
     ind[index]=0;
     got=1;
     num=arr[index];
   end
 end
$write("   | num=%2d |",num);
end
end

endmodule
