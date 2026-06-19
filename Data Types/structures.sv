
module structures_tb;

  // ===========================================================================
  // 1. UNPACKED STRUCTURE
  // ===========================================================================
  // - Memory Layout: Implementation-dependent (compiler handles alignment). 
  //   Members are NOT stored contiguously in a single bit-stream.
  // - Allowed Types: Any data type (including strings, real numbers, objects, etc.)
  // - Default: If "packed" is not specified, a struct is UNPACKED.
  struct {
    byte         id;
    string       name;
    real         score;
  } unpacked_student;


  // ===========================================================================
  // 2. TYPEDEF STRUCTURE (Industry Standard)
  // ===========================================================================
  // Creates a user-defined reusable type.
  typedef struct {
    int          id;
    bit [7:0]    age;
  } person_t;

  person_t employee1, employee2;


  // ===========================================================================
  // 3. PACKED STRUCTURE
  // ===========================================================================
  // - Memory Layout: Contiguous allocation of bits. Act as a single bit-vector.
  // - Mapping: The first declared member is the most significant bits (MSB).
  // - Restrictions: Only packed data types (bit, logic, reg, other packed structs)
  //   with explicit dimensions are allowed. Strings, real, or unpacked arrays are forbidden.
  // - Benefits: Can perform bitwise operations, arithmetic, and assignments as a 
  //   whole or slice it. Very useful for hardware packets, registers, and headers.
  typedef struct packed {
    bit [7:0]    opcode;  // MSB: Bits [15:8]
    bit [7:0]    address; // LSB: Bits [7:0]
  } packet_t;             // Total size = 8 + 8 = 16 bits

  packet_t my_packet;


  // ===========================================================================
  // 4. ARRAY OF STRUCTURES
  // ===========================================================================
  // Creating an unpacked array containing structure elements.
  person_t database[3]; 

  initial begin
    $display("==========================================================================");
    $display(" SYSTEMVERILOG STRUCTURES DEMONSTRATION");
    $display("==========================================================================");

    // -------------------------------------------------------------------------
    // A. Working with Unpacked Structures
    // -------------------------------------------------------------------------
    $display("\n--- 1. Unpacked Structure ---");
    // Assigning elements individually
    unpacked_student.id = 8'h0A;
    unpacked_student.name = "Alice";
    unpacked_student.score = 95.5;
    $display("  Student ID: %0d, Name: %s, Score: %0.1f", 
             unpacked_student.id, unpacked_student.name, unpacked_student.score);
    
    // Assigning using a member pattern (assignment pattern '{})
    unpacked_student = '{id: 8'h0B, name: "Bob", score: 88.0};
    $display("  After Pattern Assignment -> Student ID: %0d, Name: %s, Score: %0.1f", 
             unpacked_student.id, unpacked_student.name, unpacked_student.score);

    // -------------------------------------------------------------------------
    // B. Working with Packed Structures (Data Arrangement & Storage)
    // -------------------------------------------------------------------------
    $display("\n--- 2. Packed Structure & Storage Layout ---");
    // Size check
    $display("  Size of packet_t struct in bits: %0d", $bits(packet_t)); // Will output 16
    
    // Member-wise assignment
    my_packet.opcode  = 8'hAA;
    my_packet.address = 8'h55;
    
    // Since it's packed, we can display and treat it like a single 16-bit register/vector!
    $display("  my_packet.opcode  = 8'h%h", my_packet.opcode);
    $display("  my_packet.address = 8'h%h", my_packet.address);
    $display("  Treating as single vector -> my_packet = 16'h%h", my_packet);
    $display("  Binary Representation    -> my_packet = %b", my_packet);

    // Direct assignment to the packed struct as a bit vector
    my_packet = 16'hF0F0;
    $display("  After assigning 16'hF0F0 to entire packed struct:");
    $display("    opcode  (MSB) = 8'h%h", my_packet.opcode);
    $display("    address (LSB) = 8'h%h", my_packet.address);

    // -------------------------------------------------------------------------
    // C. Arrays of Structures
    // -------------------------------------------------------------------------
    $display("\n--- 3. Array of Structures ---");
    // Initialize the array of structures
    database[0] = '{id: 101, age: 25};
    database[1] = '{id: 102, age: 30};
    database[2] = '{id: 103, age: 22};

    foreach (database[i]) begin
      $display("  Employee [%0d] -> ID: %0d, Age: %0d", i, database[i].id, database[i].age);
    end

    $display("==========================================================================");
  end

endmodule
