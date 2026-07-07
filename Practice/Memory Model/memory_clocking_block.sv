
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 23:54:14
// Design Name: 
// Module Name: memory_clocking_block
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


//Memory model with clocking block
module memory_clocking_block #(parameter int unsigned DW=8, parameter int unsigned AW=5) (memory_cb_interface dut_cb);
timeunit 1ns;
timeprecision 1ns;

logic[DW-1:0]mem[2**AW];

always_ff @(posedge dut_cb.clk iff(dut_cb.write && !dut_cb.read))
	mem[dut_cb.addr] <=dut_cb.data_in;

always_ff @(posedge dut_cb.clk iff(dut_cb.read && !dut_cb.write))
	dut_cb.data_out <= mem[dut_cb.addr];

endmodule:memory_clocking_block

//Memory_intermediate_test
module memory_intermediate_test #(parameter int unsigned DW=8,
				 parameter int unsigned AW=5,
				 parameter bit DEBUG =0)
			  (memory_cb_interface test_cb
			);
timeunit 1ns;
timeprecision 1ns;

task write_mem(input[AW-1:0]waddr,input[DW-1:0]wdata,input debug);
	test_cb.cb.write<=1;
	test_cb.cb.read<=0;
	test_cb.cb.addr<=waddr;
	test_cb.cb.data_in<=wdata;
	@(test_cb.cb);

test_cb.cb.write<=0;
if(debug==1)
	$display("%t:write-address :%d Data:%h",$time,waddr,wdata);
endtask 

task read_mem(input [AW-1:0]raddr, output [DW-1:0]rdata, input debug);
	test_cb.cb.read<=1;
	test_cb.cb.write<=0;
	test_cb.cb.addr<=raddr;
	@(test_cb.cb);

	//test_cb.cb.read<=0;

	rdata<=test_cb.cb.data_out;
	if(debug ==1)
	@(test_cb.cb);

$display("%t:read-address:%d data:%h",$time,raddr,rdata);
endtask

function void printstatus(input int unsigned status);
	$display("Memory test %s with %0d errors", status?"FAILED":"PASSED",status);
if(status !=0)
$finish;
endfunction

initial begin

 logic[DW-1:0]data_r;
 int unsigned errors;
	$timeformat(-9,1,"ns",9);
@(test_cb.cb);
	$display("Clearing the Memory");
errors=0;

for(int unsigned i=0;i<=2**AW-1;++i)
	write_mem(i,0,DEBUG);
for(int unsigned i=0;i<=2**AW-1;i=i+1)
begin
	read_mem(i,data_r,DEBUG);
	if(data_r !==0)
	++errors;
end
printstatus(errors);

$display("TEST DATA=ADDRESS");
 errors=0;
 for(int unsigned i=0;i<2**AW-1;++i)
	write_mem(i,i,DEBUG);
 for(int unsigned i=0;i<=2**AW-1;i=i+1)
 begin
	read_mem(i,data_r,DEBUG);
	if(data_r !==i)
	++errors;
 end

printstatus(errors);
$finish(0);

end
endmodule:memory_intermediate_test

//Top_level_Module
module top_level_clocking_block;
timeunit 1ns;
timeprecision 1ns;

localparam time PERIOD =10;
localparam int unsigned DWIDTH=8;
localparam int unsigned AWIDTH=5;
localparam bit DEBUG =1;
bit clk;

memory_cb_interface #(DWIDTH, AWIDTH, DEBUG)inter(clk);
memory_clocking_block#(	DWIDTH,AWIDTH) memory(inter);
memory_intermediate_test#(DWIDTH,AWIDTH,DEBUG)memory_test(inter);

initial clk=0;
always #(PERIOD/2) clk=~clk;

endmodule:top_level_clocking_block

