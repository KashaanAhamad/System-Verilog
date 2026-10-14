`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2026 17:35:30
// Design Name: 
// Module Name: aob
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

program aob;

  bit [2:0] y;

  // Queue containing values to be sampled
  bit [2:0] values[$] = '{3, 5, 6};

  covergroup cg;

    cover_point_y: coverpoint y {
      bins a[] = {[0:7]};
      // Alternative: bins a[4] = {[0:7]};
    }

  endgroup

  cg cg_inst = new();

  initial begin
    foreach (values[i]) begin
      y = values[i];
      cg_inst.sample();
    end
  end

endprogram
