`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2026 22:47:31
// Design Name: 
// Module Name: example_4
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


module example_4();

typedef enum {WAIT, LOAD, READY} state_t;

state_t state =state.first();
state_t next_state;

initial
begin
	state =state.next();
end

always@(state)
begin
	$display("Current state is %s = %d",state.name(),state);
	$display("Current next state is %s = %d",next_state.name(),next_state);
case(state)
	WAIT: next_state=LOAD;
	LOAD: next_state=READY;
	READY:next_state=WAIT;
endcase

	$display("Derived next state is %s = %d",next_state.name(),next_state);
end
endmodule
