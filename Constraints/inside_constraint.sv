`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.01.2026 22:14:44
// Design Name: 
// Module Name: inside_constraint
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

/*The 'inside' keyword	in SV allows to check if a given value lies within the range specified
using the inside Phrase.
This can also be used inside 'If' and other conditional stmt in addition to begin used as a 
constraint.

SYNTAX: [Variable name] inside {<values or range>}

Inverted "Inside"
!([variable_name] inside {<values or ranges>})
*/

//m_var inside {10,20,15}
//m_var inside {[10:100]}

module inside_constraint();
    bit [3:0] m_data;
 	bit flag;
	bit [3:0]i_m_data;
	BIT i_flag;
	
	initial begin
	for(int i=0;i<10;i++)begin
		m_data=$random;
		i_m_data=$random;
		
		//Used in ternary operator
		flag= m_data inside {[4:9]} ?1:0; 
		i_flag= !(i_m_data inside {[4:9]}) ?1:0; 
		
		$display ("m_data=%0d INSIDE [4:9], flag=%0d", i_m_data, i_flag);
		//Used in 'if-else' operator
		if (m_data inside {[4:9]})
			$display ("m_data=%0d INSIDE [4:9], flag=%0d", m_data, flag);
			else
				$display ("m_data=%0d outside [4:9], flag=%0d", m_data, flag);
		end
		
		

	end
endmodule
