`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 23:47:54
// Design Name: 
// Module Name: p_197
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



class BusTran;
	bit[31:0] addr,crc,data[8];
function calc_crc(data);
	crc=addr^data;
	$display("CRC:%d",crc);
endfunction:calc_crc
function display;
	$display("BusTran:%h",addr);
endfunction:display
endclass:BusTran

program p_197;	//module p_197
initial
begin
BusTran b;
b=new;
b.addr=32'h42;
b.display();
for(int i=0;i<=7;i++)
begin
b.data[i]=i;
b.calc_crc(b.data[i]);
end
end
endprogram  //endmodule

