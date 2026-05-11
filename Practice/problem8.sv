`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2026 22:00:07
// Design Name: 
// Module Name: problem8
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

//There is an 8-bit vector (bit[7:0] data_in) which takes some random value. Write a 
//constraint for (data_in) should be 5-with respect to the previous value of data_in.

module problem8(  );
    class packet;
        rand bit[7:0] d;
        static bit[7:0] prev = 0; // Use static to share across instances
        static int count = 0;     // Track number of randomizations
        
        constraint c{
            d inside {[1:50]};
            (count > 0) -> ($countones(prev ^ d) == 5); // Only apply after first call
        }
        
        function void pre_randomize();
            if (count > 0) begin
                prev = d; // Capture the *previous* value of d
            end
            count++;
        endfunction
    endclass
    
    packet p;
    initial begin
        p = new();
        repeat(5) begin
            assert(p.randomize());
            $display("Value ==> %b", p.d);
        end
    end
endmodule   
