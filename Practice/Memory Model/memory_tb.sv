
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 23:12:46
// Design Name: 
// Module Name: memory_tb
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


module memory_tb;
 timeunit 1ns;
 timeprecision 1ns;
 
 wire logic [7:0]data; 
 var logic read,write;
 var logic [4:0] addr;

localparam bit debug=1;
localparam int WWIDTH=8;
localparam int AWIDTH=5;

memory #(WWIDTH,AWIDTH) memo(.*);

logic [WWIDTH-1:0] data_w;

assign data =read ? 'z:data_w;

task write_mem(input [AWIDTH-1:0] waddr,
	input [WWIDTH-1:0] wdata,
	input debug=0
   );

 write=0;
 read=0;
 addr=waddr;
 data_w=wdata;
 
 #5ns write=1;

 if(debug ==1)
	$display("%t, write address:%d, data=%h",$time,waddr,wdata);
 #5ns write =0;
endtask

task read_mem( input [AWIDTH-1:0] raddr,
     		   output [WWIDTH-1:0] rdata,
			   input debug =0
			 );
 write =0;
 read=1;
 addr=raddr;
 #5ns rdata =data;

 if(debug==1)
	$display("%t,read address:%d, data:%h",$time,raddr,rdata);
 #5ns read=0;
endtask

function void print_status(input int unsigned status);
	$display("Memory Test %s with %0d errors",status?"FAILED":"PASSED",status);
if(status !=0)
 $finish;

 endfunction

initial begin
  logic [WWIDTH-1:0] data_read;
  int unsigned errors;
  $timeformat(-9,0,"ns",6);
  $display("CLEAR THE MEMORY FIRST");
  errors=0;

 for(int i=0;i<=2**AWIDTH-1;++i)
	write_mem(i,0,1);//made change in last argument
 for(int i=0;i<=2**AWIDTH-1;++i)
 begin
	read_mem(i,data_read,0);
	if(data_read !==0)
	++errors;
 end
print_status(errors);
	$display("TEST DATA=ADDRESS");
errors=0;
 for(int i=0;i<=2**AWIDTH-1;++i)
	write_mem(i,i,debug);
 for(int i=0;i<=2**AWIDTH-1;++i)
 begin
	read_mem(i,data_read,debug);
 if(data_read !== i)
 ++errors;
 end
print_status(errors);
 $finish(0);
end
endmodule:memory_tb
