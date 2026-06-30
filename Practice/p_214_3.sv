`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2026 23:52:59
// Design Name: 
// Module Name: p_214_3
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


class foo;
	int N=3;
 	function int fetch_N();
	return N;
	endfunction
endclass
class bar extends foo;
int N=4;
function int fetch_N();
 return N;
endfunction
function int fetch_N1();
 return super.N;
endfunction
endclass

module p_214_3;
initial begin
  bar e=new;
 // foo b=e;//Note same object!
  $display(b.fetch_N());
  $display(e.fetch_N());
  $display(e.fetch_N1());
end
endmodule

