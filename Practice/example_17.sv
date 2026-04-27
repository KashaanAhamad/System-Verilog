`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.04.2026 13:02:28
// Design Name: 
// Module Name: example_17
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


module example_17();
//Queue is declared with $ in array size
integer queue[$] ={0,1,2,3,4};
integer i;

task print_queue;
	integer i;
	$write("Queue contains:");
	for(i =0;i<queue.size();i++)begin
		$write("%g",queue[i]);
	end
$write("\n");
endtask

initial begin
$display("Initial value of queue");
print_queue;

//Insert new element at begin of queue
queue={5,queue};
$display("New element added using concatenation");
print_queue;

//inset using method at beginning
queue.push_front(6);
$display("use push front to add new element");
print_queue;

//inset using method at end
queue.push_back(7);
$display("use push back to add new element");
print_queue;

//using insert to insert, here 1 is index and 8 is value
queue.insert(1,8);
$display("use insert(indexd,value) to add new val ");
print_queue;

//get first queue element method at beginning
i=queue.pop_front();
$display("Element popped using pop_front ");
print_queue;

//het last queue element method at end
i=queue.pop_back();
$display("element poped using pop back"); 
print_queue;

//delete element at index 4 in queue
queue.delete(4);
$display("deleted element at index 4");
print_queue;

#1 $finish;
end
endmodule
