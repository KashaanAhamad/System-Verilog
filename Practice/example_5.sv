`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:49:52
// Design Name: 
// Module Name: example_5
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


module example_5();

string s;
initial begin

s="systemVerilog";
	$display(s.getc(0));
$display(s.toupper());
	s={s,"3.1b"};
	s.putc(s.len()-1,"a");
$display(s.substr(2,5));
my_log($psprintf("%s %5d",s,42));
end

task my_log(string message);
$display("@%0d: %s",$time,message);
endtask

endmodule
