
module packed_array_tb;

  // ===========================================================================
  // 1. SINGLE-DIMENSIONAL PACKED ARRAY
  // ===========================================================================
  // - A single dimension specified BEFORE the variable name.
  // - Actually just a standard bit-vector or bus.
  // - Total bits = 8.
  bit [7:0] single_pack; // bits 7 to 0


  // ===========================================================================
  // 2. MULTI-DIMENSIONAL PACKED ARRAY
  // ===========================================================================
  // - Multiple dimensions specified BEFORE the variable name.
  // - Contiguous memory layout (flat bit vector).
  // - Declaration: BaseType [Dim1][Dim2]...[DimN] VarName;
  // - Order of indexing:
  //   - Left-most dimension (closest to base type) is the slowest-varying (most significant slice).
  //   - Right-most dimension (closest to variable name) is the fastest-varying (least significant slice).
  //
  // In `bit [3:0][7:0] multi_pack;`:
  // - It represents 4 parts, each part is 8-bits wide.
  // - Total bits = 4 * 8 = 32 bits.
  // - Memory Layout (Flat representation):
  //   -----------------------------------------------------------------
  //   |  multi_pack[3]  |  multi_pack[2]  |  multi_pack[1]  |  multi_pack[0]  |
  //   |  Bits [31:24]   |  Bits [23:16]   |  Bits [15:8]    |  Bits [7:0]     |
  //   -----------------------------------------------------------------
  bit [3:0][7:0] multi_pack;


  // A 3D Packed Array
  // - 2 blocks, each containing 3 rows, each row containing 4 bits.
  // - Total bits = 2 * 3 * 4 = 24 bits.
  // - Memory layout is continuous: Block 1 (MSB) -> Block 0 (LSB)
  bit [1:0][2:0][3:0] array_3d;


  initial begin
    $display("==========================================================================");
    $display(" SYSTEMVERILOG PACKED ARRAYS DEMONSTRATION");
    $display("==========================================================================");

    // -------------------------------------------------------------------------
    // A. Single-Dimensional Packed Array Demo
    // -------------------------------------------------------------------------
    $display("\n--- 1. Single Dimensional Packed Array ---");
    single_pack = 8'b1100_1010;
    $display("  single_pack = %b (Hex: %h, Dec: %0d)", single_pack, single_pack, single_pack);
    $display("  Bit 7 (MSB) = %b, Bit 0 (LSB) = %b", single_pack[7], single_pack[0]);


    // -------------------------------------------------------------------------
    // B. Multi-Dimensional Packed Array & Data Storage Layout
    // -------------------------------------------------------------------------
    $display("\n--- 2. Multi-Dimensional Packed Array ---");
    $display("  Declaration: bit [3:0][7:0] multi_pack;");
    $display("  Total size in bits: %0d bits", $bits(multi_pack)); // Will print 32

    // Assigning to individual 8-bit slices
    multi_pack[3] = 8'hAA; // MSB block (Bits [31:24])
    multi_pack[2] = 8'hBB; // (Bits [23:16])
    multi_pack[1] = 8'hCC; // (Bits [15:8])
    multi_pack[0] = 8'hDD; // LSB block (Bits [7:0])

    // Print values
    $display("  multi_pack[3] = 8'h%h", multi_pack[3]);
    $display("  multi_pack[2] = 8'h%h", multi_pack[2]);
    $display("  multi_pack[1] = 8'h%h", multi_pack[1]);
    $display("  multi_pack[0] = 8'h%h", multi_pack[0]);

    // Show flat/contiguous representation (Because it's a packed array, it can be accessed as a whole 32-bit vector!)
    $display("  Entire 32-bit vector (multi_pack)      = 32'h%h", multi_pack);
    $display("  Binary representation of entire vector  = %b", multi_pack);

    // Direct assignment as a single 32-bit value
    multi_pack = 32'h11223344;
    $display("\n  After assigning 32'h11223344 directly to multi_pack:");
    $display("    multi_pack[3] = 8'h%h", multi_pack[3]);
    $display("    multi_pack[2] = 8'h%h", multi_pack[2]);
    $display("    multi_pack[1] = 8'h%h", multi_pack[1]);
    $display("    multi_pack[0] = 8'h%h", multi_pack[0]);


    // -------------------------------------------------------------------------
    // C. 3D Packed Array Indexing Demo
    // -------------------------------------------------------------------------
    $display("\n--- 3. 3-Dimensional Packed Array (2 * 3 * 4 = 24 bits) ---");
    // Assigning flat 24-bit value: 24'hA_B_C_D_E_F (each hex char is 4 bits)
    array_3d = 24'hABCDEF;
    $display("  array_3d flat value = 24'h%h", array_3d);
    
    // Display elements
    $display("  array_3d[1] (MSB block, 12 bits)      = %h (expected ABC)", array_3d[1]);
    $display("  array_3d[0] (LSB block, 12 bits)      = %h (expected DEF)", array_3d[0]);
    $display("  array_3d[1][0] (Row 0 of Block 1, 4 bits) = %h (expected C)", array_3d[1][0]);
    $display("  array_3d[0][2] (Row 2 of Block 0, 4 bits) = %h (expected D)", array_3d[0][2]);
    $display("  array_3d[0][0][3] (MSB bit of Row 0, Block 0) = %b (MSB of F -> 1'b1)", array_3d[0][0][3]);

    $display("==========================================================================");
  end

endmodule
