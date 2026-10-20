`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2026 17:15:30
// Design Name: 
// Module Name: cross_coverage
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



program cross_coverage;

  bit [1:0] y;
  bit [1:0] z;

  // Queues containing values to be sampled
  bit [1:0] y_values[$] = '{1, 3};
  bit [1:0] z_values[$] = '{1, 2};

  covergroup cg;

    cover_point_y : coverpoint y;
    cover_point_z : coverpoint z;

    // Cross coverage between the two coverpoints
    cross_yz : cross cover_point_y, cover_point_z;

  endgroup

  cg cg_inst = new();

  initial begin
    foreach (y_values[i]) begin
      y = y_values[i];
      z = z_values[i];
      cg_inst.sample();
    end
  end

endprogram
