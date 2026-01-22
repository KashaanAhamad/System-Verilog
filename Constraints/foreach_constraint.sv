`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2026 23:53:22
// Design Name: 
// Module Name: foreach_constr
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

/*SV provide the support to use foreach loop inside a constraint so that array
 can be constrained
 
 foreach construct iterates over the element of an array and its argument is an 
 identifier that represent the single entity in the array
 */

class FE;
	rand bit[3:0] array[5];
	//Dynamic Arrays/Queues
	rand bit [3:0] darray[];	//Dynamic array -> size unknown
	rand bit [3:0] queues[$];	//queue ->size unknown
	
	//Assign size of queue if unknown
	constraint c_qsize{	queues.size() == 5;}
	
	// Constrain each element of both the arrays
  constraint c_darray  { foreach (darray[i])
    					  darray[i] == i;
                        foreach (queues[i])
                          queues[i] == i + 1;
                      }
                      
     // Size of an array can be assigned using a constraint like
    // we have done for the queue, but let's assign the size before
    // calling randomization
    function new ();
		darray = new[5]; 	// Assign size of dynamic array
	endfunction
	
	constraint c_array{	foreach(array[i]){
						array[i] ==i;
						}
					}	
endclass

//Multidimensional Array/Queues
class multidimension;
	rand bit [4:0][3:0] md_array[2][5];	//multidimension static array
	rand bit [3:0] d_md_array[][];		//multidimension dynamic array
	
	constraint c_d_md_array{	//first assign the size
							d_md_array.size() ==2;
							foreach(d_md_array[i]){
								d_md_array[i].size() inside {[1:5]};
								// Iterate over the second dimension
								foreach(d_md_array[i][j]){
									// Assign constraints for values to the second dimension
									d_md_array[i][j] inside {[1:10]};
									}
							}
						}
	
	constraint c_md_array {
		foreach(md_array[i]){
			foreach(md_array[i][j]){
				foreach(md_array[i][j][k]){
					if(k%2 == 0)
						md_array[i][j][k] == 'hF;
					else
						md_array[i][j][k] == 'h0;
					}
				}
			}
		}
		
	
endclass



module foreach_constr( );
FE fe;
multidimension md;
	initial begin
		fe=new();
		md=new();
		
		fe.randomize();
		md.randomize();
		$display("array=%p",fe.array);
		//dynamic array and queue
		$display("darray=%p queues=%p",fe.darray,fe.queues);
		//Multi dimension array
		$display ("md_array = %p", md.md_array);
		//Multi dimension dynamic array
		$display ("d_md_array = %p", md.d_md_array);
	end
endmodule
