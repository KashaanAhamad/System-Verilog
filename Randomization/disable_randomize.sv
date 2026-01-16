`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2026 01:22:29
// Design Name: 
// Module Name: disable_randomize
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

/*
Randomization of variable in a class can be disable using rand_mode() method. 
This is similar to constraint_mode() method used to disable constraints.
Disable randome variable is treated as the same as if they had not been declared rand or randc
*/

/*
rand_mode can be called both as function or task. Current state of variable will be returned
if it is called as function.
*/
/*Disable randomize
[class_object].[variable_name].rand_mode(0);

Enable randomize
[class_object].[variable_name].rand_mode(1);
*/

class fruit;
rand bit [3:0] var1;
randc bit [1:0] var2;

endclass

module disable_randomize();
initial begin
	fruit f=new();
	
	$display ("Before randomization var1=%0d var2=%0d", f.var1, f.var2);
	
	// rand_mode() is called as a function which returns the state of the given variable
    // If it is enabled, then print a statement
    if (f.var1.rand_mode())
    	if (f.var2.rand_mode())
      		$display ("Randomization of all variables enabled");
	
	f.randomize();
	$display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
	
	
	// Turn off randomization for var1
    f.var1.rand_mode (0);
    
    // Print if var1 has randomization enabled/disabled
    if (f.var1.rand_mode())
      $display ("Randomization of var1 enabled");
    else
      $display ("Randomization of var1 disabled");

    f.randomize();

    $display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
    
    //This will disable all random variable in the object
    f.rand_mode(0);
    $display("Randomization of all Variable disable");
    f.randomize();
    $display ("After randomization var1=%0d var2=%0d", f.var1, f.var2);
end
endmodule
