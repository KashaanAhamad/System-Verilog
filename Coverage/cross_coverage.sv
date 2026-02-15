`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.02.2026 03:05:19
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

//Functional coverage aims to measure the completeness of verification by tracking scenarios 
//defined in a test plan and ensuring all valid and invalid design conditions are exercised.

//What is Cross Coverage?
//Cross coverage extends functional Coverage by observing the interaction or combination os states
//between two or more coverage points or variables. Instead of just covering individual values,
//it captures whether specific combination of these values have occured.

//1) When a variable is included in a cross statement, SystemVerilog implicitly creates a coverpoint 
//for that variable.
//2) Expressions, however, cannot be directly used in a cross; they must first be explicitly defined 
//as coverpoints.
//3) All coverpoints participating in a cross must belong to the same covergroup.

//SYNTAX: [cross_identifier: ] cross <cp_item1>, <cp_item2>, cp_itemN [iff <condition>];

module cross_coverage(  );

reg clk = 0;
int master_id;
int slave_id;

  always #5 clk = ~clk;
  
covergroup master_slave_interaction @(posedge clk);
	master_id_cp: coverpoint master_id {
		bins master0 ={0};
		bins master1 ={1};
		bins master2 ={2};
		bins master3 ={3};
	}
	
	slave_id_cp: coverpoint slave_id {
    bins slave0 = {0};
    bins slave1 = {1};
    bins slave2 = {2};
    bins slave3 = {3};
  }
  
  ms_cross: cross master_id_cp, slave_id_cp; // Cross coverage declaration

//If both coverpoints have 4 bins, their cross will result in 16 cross product bins 
//(e.g., <master0, slave0>, <master0, slave1>, ..., <master3, slave3>), each counting 
//a specific master-slave interaction.


//User- Define Cross Coverage
//our intrested Scenario--> 1)master 0 accessing slave 1,  2) Any master accessing slave 3
	ms2_cross: cross master_id_cp, slave_id_cp {
		bins master0_slave1	= binsof(master_id_cp.master0) && binsof(slave_id_cp.slave1);
		bins any_master_slave3	= binsof(master_id_cp) &&  binsof(slave_id_cp.slave3);
		// 'intersect' is equivalent to '&&' for binsof expressions
		}
endgroup

master_slave_interaction ms_cg;

  initial begin
    ms_cg = new();
    repeat (10) begin
      @(posedge clk);
      master_id = $urandom_range(0,3);
      slave_id  = $urandom_range(0,3);
    end
  end

endmodule
