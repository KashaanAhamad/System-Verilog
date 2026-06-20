
module unpacked_array_tb;

  // ===========================================================================
  // 1. SINGLE-DIMENSIONAL UNPACKED ARRAY
  // ===========================================================================
  // - Dimension is specified AFTER the variable name.
  // - Memory Layout: Stored in independent memory locations (aligned to word boundaries).
  // - Cannot be assigned directly to a single integer or scalar vector without casting.
  int unpacked_1d [4]; // 4 elements of type 'int', indices 0, 1, 2, 3
  
  // Alternative syntax (same behavior)
  int unpacked_1d_alt [0:3];


  // ===========================================================================
  // 2. MULTI-DIMENSIONAL UNPACKED ARRAY
  // ===========================================================================
  // - Multiple dimensions specified AFTER the variable name.
  // - Indexing order: Left-most index after the variable name is resolved first.
  // - Declaring a 2x3 matrix:
  byte unpacked_2d [2][3]; // 2 rows, 3 columns


  // ===========================================================================
  // 3. MIXED PACKED + UNPACKED ARRAY (Crucial Concept)
  // ===========================================================================
  // - Syntax: BaseType [Packed_Dims] VarName [Unpacked_Dims];
  // - Resolving order:
  //   1. First, index the UNPACKED dimensions (from left to right, after variable name).
  //   2. Next, index the PACKED dimensions (from left to right, before variable name).
  //
  // In `bit [3:0][7:0] mixed_array [2:0];`:
  // - Unpacked Dimension: [2:0] (3 elements)
  // - Packed Base Type: [3:0][7:0] (4 elements of 8-bits = 32-bit flat vector)
  // - Total bits: 3 * 32 = 96 bits.
  //
  // Memory Layout:
  //  mixed_array[2] -> [ 32-bit packed word: [3] (8-bit) | [2] (8-bit) | [1] (8-bit) | [0] (8-bit) ]  (stored at memory addr A)
  //  mixed_array[1] -> [ 32-bit packed word: [3] (8-bit) | [2] (8-bit) | [1] (8-bit) | [0] (8-bit) ]  (stored at memory addr B)
  //  mixed_array[0] -> [ 32-bit packed word: [3] (8-bit) | [2] (8-bit) | [1] (8-bit) | [0] (8-bit) ]  (stored at memory addr C)
  bit [3:0][7:0] mixed_array [2:0];


  initial begin
    $display("==========================================================================");
    $display(" SYSTEMVERILOG UNPACKED & MIXED ARRAYS DEMONSTRATION");
    $display("==========================================================================");

    // -------------------------------------------------------------------------
    // A. Unpacked Array Initialization & Assignments
    // -------------------------------------------------------------------------
    $display("\n--- 1. Unpacked Array Initialization ---");
    // Assigning using assignment patterns '{ ... }
    unpacked_1d = '{10, 20, 30, 40};
    $display("  unpacked_1d = %p", unpacked_1d);

    // Assigning with replications or default values
    unpacked_1d_alt = '{default: -1}; // initializes all elements to -1
    $display("  unpacked_1d_alt (default assignment) = %p", unpacked_1d_alt);

    // -------------------------------------------------------------------------
    // B. Multi-Dimensional Unpacked Array Indexing
    // -------------------------------------------------------------------------
    $display("\n--- 2. Multi-Dimensional Unpacked Array ---");
    unpacked_2d = '{ '{8'h11, 8'h12, 8'h13}, 
                     '{8'h21, 8'h22, 8'h23} };
                     
    $display("  unpacked_2d [2][3] = %p", unpacked_2d);
    $display("  unpacked_2d[0]     = %p (First row)", unpacked_2d[0]);
    $display("  unpacked_2d[1][2]  = 8'h%h (Element at Row 1, Col 2)", unpacked_2d[1][2]);


    // -------------------------------------------------------------------------
    // C. Mixed Packed + Unpacked Array Resolution & Bit Slicing
    // -------------------------------------------------------------------------
    $display("\n--- 3. Mixed Packed + Unpacked Array Demo ---");
    // Initializing the 3 elements of the unpacked dimension (each is a 32-bit packed value)
    mixed_array[2] = 32'hAAAA_BBBB;
    mixed_array[1] = 32'hCCCC_DDDD;
    mixed_array[0] = 32'hEEEE_FFFF;

    $display("  mixed_array = %p", mixed_array);
    
    // Let's resolve indexes step by step:
    // Step 1: Access the unpacked dimension index 1
    $display("  mixed_array[1]       = 32'h%h (unpacked element 1)", mixed_array[1]);

    // Step 2: Access the packed dimension [3] (MSB byte) of index 1
    $display("  mixed_array[1][3]    = 8'h%h   (packed element [3] of element 1)", mixed_array[1][3]);

    // Step 3: Access bit [7] (MSB) of the above byte
    $display("  mixed_array[1][3][7] = %b      (bit [7] of the byte)", mixed_array[1][3][7]);


    // -------------------------------------------------------------------------
    // D. Storage Layout Differences Summarized
    // -------------------------------------------------------------------------
    $display("\n==========================================================================");
    $display(" COMPARISON: PACKED VS UNPACKED ARRAYS");
    $display("==========================================================================");
    $display(" Feature               | Packed Array               | Unpacked Array");
    $display("--------------------------------------------------------------------------");
    $display(" Declaration Position  | Before Variable Name       | After Variable Name");
    $display(" Memory Layout         | Contiguous block of bits   | Discontiguous / Aligned words");
    $display(" Operations            | Arithmetic/Bitwise on whole| Access elements individually");
    $display(" Base Type Restriction | Only bit, logic, reg, etc. | Any type (classes, strings, etc.)");
    $display(" Assignment Pattern    | Simple value (e.g. 32'hA)  | Requires '{val1, val2...}");
    $display("==========================================================================");
  end

endmodule
