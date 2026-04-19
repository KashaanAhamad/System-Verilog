`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:58:49
// Design Name: 
// Module Name: example_9
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


module example_9();

int array1[4]='{3,2,4,2};
int md[2][3]='{'{0,1,2},'{3,4,5}};

initial
begin
	$display("%p",array1);

	array1[0:2]='{5,6,7};
	$display("%p",array1);
array1='{3,8,8,8};
//array1= '{'{3},'{3{8}}};

	$display("%p",array1);

	$display("%p %p",md[0],md[1]);
end

endmodule
