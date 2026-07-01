`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2026 23:10:47
// Design Name: 
// Module Name: p_225
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


module p_225;
class polygon;
  protected int width;
  protected int height;
  function void set_values(int a,int b);
    width=a; height=b;
  endfunction
 virtual function int area();
 endfunction
endclass

class rectangle extends polygon;
 function int area();
  area=(width*height);
 endfunction
endclass

class triangle extends polygon;
 function int area();
  area=(width*height/2);
 endfunction
endclass

polygon poly[5];
rectangle rect=new;
triangle trig=new;

initial begin
poly[0]=rect;
poly[1]=trig;
poly[0].set_values(3,6);
//invoking rectangle method
$display(poly[0].area());
poly[1].set_values(3,6);
//invoking trinagle method
$display(poly[1].area());
end
endmodule
