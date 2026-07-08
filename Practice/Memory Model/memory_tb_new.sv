`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 23:39:33
// Design Name: 
// Module Name: memory_tb_new
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

module memory_tb_new (memory_intf.TB m1);

 timeunit 1ns;	timeprecision 1ns;
 localparam bit debug =1;	localparam int WWIDTH=8;	localparam int AWIDTH=5;

 logic [WWIDTH-1:0]data_w;

assign m1.data=m1.read?'z:data_w;

task write_mem(input [AWIDTH-1:0]waddr,
			input [WWIDTH-1:0]wdata,
			input debug =0
		  );
 m1.write=0;
 m1.read=0;
 m1.addr=waddr;
 data_w=wdata;
 #5ns m1.write=1;

 if(debug ==1)
	$display("%t: write address: %d, data=%h",$time,waddr,wdata);
 #5 m1.write=0;
endtask

task read_mem(input [AWIDTH-1:0]raddr, output [AWIDTH-1:0] rdata, input debug=0);
 m1.write=0;
 m1.read=1;
 m1.addr=raddr;
#5ns rdata=m1.data;
if(debug==1)
	$display("%t, read address:%d, data=%h",$time,raddr,rdata);
#5ns m1.read=0;
endtask

function void print_status(input int unsigned status);
	$display("Memory Test %s with %d errors",status?"FAILED":"PASSED",status);
 if(status !=0)
  $finish;
endfunction

initial begin
 logic [WWIDTH-1:0]data_read;
 int unsigned errors;

 $timeformat(-9,0,"ns",6);

 $display("CLEAR THE MEMORY FIRST");
 errors=0;
 for(int i=0;i<=2**AWIDTH-1;++i)
	write_mem(i,0,0);
 for(int i=0;i<=2**AWIDTH-1;++i)
 begin
	read_mem(i,data_read,0);
	if(data_read !==0)
	++errors;
 end

 print_status(errors);
	$display("TEST DATA = ADDRESS");
 errors=0;

 for(int i=0;i<=2**AWIDTH-1;++i)
	write_mem(i,i,debug);
 for(int i=0;i<=2**AWIDTH-1;++i)
 begin
	read_mem(i,data_read,debug);
	if(data_read !==i)
	++errors;
 end

print_status(errors);

$finish(0);
end
endmodule:memory_tb_new

//Top Module
module top;
 timeunit 1ns;	timeprecision 1ns;
 localparam int unsigned W=8;	localparam int unsigned A=5;

  memory_intf #(W,A) m1();
  memory_new #(W,A) m2(m1);
  memory_tb_new m3(m1);
endmodule

