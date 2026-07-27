`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.07.2026 23:32:44
// Design Name: 
// Module Name: event_wait
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


module event_wait;
 event a;
 initial begin
 repeat(4)
 #20 ->a;
 end

always begin
 @a;
 $display("time=%t one:: Event A is triggered",$time);
 end

always begin
 wait(a.triggered);
 $display("time =%t TWO :: EVENT A is triggered",$time);
#1;
end
endmodule

