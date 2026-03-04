`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2026 13:03:28
// Design Name: 
// Module Name: array_of_Object
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
//FIXED SIZE ARRAY

// Define the Packet class
class Packet;
    int count;
    // Constructor to initialize count
    function new(int c = 0);
        count = c;
    endfunction
endclass


module array_of_Object( );

 	// Fixed array
    Packet fixed_array[5];

    // Dynamic array
    Packet dynamic_array[];

    // Associative array
    Packet assoc_array[string];
    
    initial begin
        //---------------- FIXED ARRAY ----------------//
        $display("\n--- Fixed Array Example ---");

        // Initialize fixed array
        for (int i = 0; i < 5; i++) begin
            fixed_array[i] = new(i * 10);
        end

        // Display fixed array values
        for (int i = 0; i < 5; i++) begin
            $display("fixed_array[%0d].count = %0d", i, fixed_array[i].count);
        end

        // Example of accessing a null element if not initialized (would cause an error if dereferenced)
        // assert(fixed_array[0] != null); // Check if initialized
        
        
         //---------------- DYNAMIC ARRAY ----------------//
        $display("\n--- Dynamic Array Example ---");

        // Allocate dynamic array
        dynamic_array = new[3];

        // Initialize elements
        for (int i = 0; i < dynamic_array.size(); i++) begin
            dynamic_array[i] = new(i + 1);
        end

        // Display values
        foreach (dynamic_array[i]) begin
            $display("dynamic_array[%0d].count = %0d", i, dynamic_array[i].count);
        end
    end
    

    initial begin
        $display(" --- Dynamic Array Example ---");

        // Initialize the dynamic array with a specific size
        dynamic_array = new[3]; // Creates space for 3 Packet references

        // Initialize each element of the dynamic array
        for (int i = 0; i < dynamic_array.size(); i++) begin
            dynamic_array[i] = new(i + 1); // Create new Packet objects
        end

        // Access and display data
        foreach (dynamic_array[i]) begin
            $display("dynamic_array[%0d].count = %0d", i, dynamic_array[i].count);
             
            
        //---------------- ASSOCIATIVE ARRAY ----------------//
        $display("\n--- Associative Array Example ---");

        // Assign values
        assoc_array["packet_A"] = new(50);
        assoc_array["packet_B"] = new(75);
        assoc_array["packet_C"] = new(100);

        // Access elements
        $display("assoc_array[packet_A].count = %0d", assoc_array["packet_A"].count);
        $display("assoc_array[packet_C].count = %0d", assoc_array["packet_C"].count);

        // Iterate associative array
        foreach (assoc_array[k]) begin
            $display("Key: %s, Count: %0d", k, assoc_array[k].count);
        end

        // Check existence
        if (assoc_array.exists("packet_B")) begin
            $display("Packet_B exists in the associative array.");
        end       
    end
end
    
endmodule
