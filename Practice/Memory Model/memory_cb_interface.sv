`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.06.2026 23:56:43
// Design Name: 
// Module Name: memory_cb_interface
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


interface memory_cb_interface #(parameter int unsigned DW=8,
							    parameter int unsigned AW=5, 
							    parameter bit DEBUG=0)
								(input bit clk);
timeunit 1ns;
timeprecision 1ns;
logic[DW-1:0] data_out;
logic[DW-1:0] data_in;
logic[AW-1:0] addr;
logic write;
logic read;

	clocking cb@(negedge clk);
		default input #1step output #0;
		input data_out;
		output data_in;
		output addr;
		output write;
		output read;
	endclocking
endinterface


