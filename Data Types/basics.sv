// =============================================================================

module basics_tb;

  // ---------------------------------------------------------------------------
  // 1. Four-State Data Types (Can have values: 0, 1, X, Z. Default value: X)
  // ---------------------------------------------------------------------------
  
  // logic: 1-bit, user-defined vector size, default unsigned
  logic        var_logic;         // 1-bit unsigned 4-state
  logic [7:0]  var_logic_vec;     // 8-bit unsigned 4-state
  logic signed [7:0] var_logic_signed; // 8-bit signed 4-state
  
  // reg: 1-bit, user-defined vector size, default unsigned (legacy Verilog, similar to logic)
  reg          var_reg;           // 1-bit unsigned 4-state
  
  // integer: 32-bit, default signed
  integer      var_integer;       // 32-bit signed 4-state
  
  // time: 64-bit, default unsigned
  time         var_time;          // 64-bit unsigned 4-state


  // ---------------------------------------------------------------------------
  // 2. Two-State Data Types (Can have values: 0, 1. Default value: 0)
  // ---------------------------------------------------------------------------
  
  // bit: 1-bit, user-defined vector size, default unsigned
  bit          var_bit;           // 1-bit unsigned 2-state
  bit [7:0]    var_bit_vec;       // 8-bit unsigned 2-state
  bit signed [7:0] var_bit_signed; // 8-bit signed 2-state
  
  // byte: 8-bit, default signed (values -128 to 127)
  byte         var_byte;          // 8-bit signed 2-state
  byte unsigned var_byte_unsigned; // 8-bit unsigned 2-state (values 0 to 255)
  
  // shortint: 16-bit, default signed (values -32768 to 32767)
  shortint     var_shortint;      // 16-bit signed 2-state
  
  // int: 32-bit, default signed
  int          var_int;           // 32-bit signed 2-state
  int unsigned var_int_unsigned;  // 32-bit unsigned 2-state
  
  // longint: 64-bit, default signed
  longint      var_longint;       // 64-bit signed 2-state


  // ---------------------------------------------------------------------------
  // 3. Real Data Types (Non-integral 2-state numeric types)
  // ---------------------------------------------------------------------------
  real         var_real;          // Double-precision floating point (64-bit), default 0.0
  shortreal    var_shortreal;     // Single-precision floating point (32-bit), default 0.0


  initial begin
    $display("==========================================================================");
    $display(" SYSTEMVERILOG DATA TYPES SUMMARY & DEMONSTRATION");
    $display("==========================================================================");
    
    //--------------------------------------------------------------------------
    // A. Show Default Values (Uninitialized values right after start)
    //--------------------------------------------------------------------------
    $display("\n--- 1. Default (Uninitialized) Values ---");
    $display("4-State Types (Default is 'x'):");
    $display("  logic              = %b", var_logic);
    $display("  logic [7:0] vector = %b", var_logic_vec);
    $display("  reg                = %b", var_reg);
    $display("  integer            = %0d (or hex %h)", var_integer, var_integer);
    $display("  time               = %0d", var_time);
    
    $display("\n2-State Types (Default is '0'):");
    $display("  bit                = %b", var_bit);
    $display("  bit [7:0] vector   = %b", var_bit_vec);
    $display("  byte               = %0d", var_byte);
    $display("  shortint           = %0d", var_shortint);
    $display("  int                = %0d", var_int);
    $display("  longint            = %0d", var_longint);
    
    $display("\nReal Types (Default is '0.0'):");
    $display("  real               = %0f", var_real);
    $display("  shortreal          = %0f", var_shortreal);

    //--------------------------------------------------------------------------
    // B. Show Signed vs Unsigned behavior (Overflow / Underflow & representation)
    //--------------------------------------------------------------------------
    $display("\n--- 2. Signed vs Unsigned Behavior ---");
    
    // byte (8-bit signed) vs byte unsigned (8-bit unsigned)
    var_byte = 8'hFF;             // All ones binary: 11111111
    var_byte_unsigned = 8'hFF;
    $display("  byte (8-bit signed) for 8'hFF          = %d", var_byte);
    $display("  byte unsigned (8-bit unsigned) for 8'hFF = %d", var_byte_unsigned);
    
    // int (32-bit signed) vs int unsigned (32-bit unsigned)
    var_int = 32'hFFFF_FFFF;
    var_int_unsigned = 32'hFFFF_FFFF;
    $display("  int (32-bit signed) for 32'hFFFF_FFFF          = %d", var_int);
    $display("  int unsigned (32-bit unsigned) for 32'hFFFF_FFFF = %0u", var_int_unsigned);

    // Casting logic or bit dynamically
    var_bit_signed = 8'h80; // MSB is 1: 10000000
    var_bit_vec = 8'h80;
    $display("  bit signed [7:0] for 8'h80 = %d", var_bit_signed);
    $display("  bit [7:0] (unsigned) for 8'h80 = %d", var_bit_vec);

    //--------------------------------------------------------------------------
    // C. 4-State and 2-State Conversion (What happens to X/Z when assigned to 2-State?)
    //--------------------------------------------------------------------------
    $display("\n--- 3. 4-State to 2-State Conversion ---");
    var_logic_vec = 8'b1101_xz01;
    $display("  Assigning 8'b1101_xz01 to 4-state logic:  %b", var_logic_vec);
    
    var_bit_vec = var_logic_vec; // Assigning 4-state to 2-state: X and Z become 0
    $display("  Assigned to 2-state bit vector (X/Z->0): %b", var_bit_vec);

    //--------------------------------------------------------------------------
    // D. Data Types Specification Table (Summary info)
    //--------------------------------------------------------------------------
    $display("\n==========================================================================");
    $display(" Data Type   | Width (Bits) | States  | Default Signed/Unsigned | Default Value");
    $display("==========================================================================");
    $display(" logic       | User-defined | 4-state | Unsigned                | x");
    $display(" reg         | User-defined | 4-state | Unsigned                | x");
    $display(" integer     | 32           | 4-state | Signed                  | x");
    $display(" time        | 64           | 4-state | Unsigned                | x");
    $display(" bit         | User-defined | 2-state | Unsigned                | 0");
    $display(" byte        | 8            | 2-state | Signed                  | 0");
    $display(" shortint    | 16           | 2-state | Signed                  | 0");
    $display(" int         | 32           | 2-state | Signed                  | 0");
    $display(" longint     | 64           | 2-state | Signed                  | 0");
    $display(" real        | 64 (float)   | 2-state | Signed (Floating-point) | 0.0");
    $display(" shortreal   | 32 (float)   | 2-state | Signed (Floating-point) | 0.0");
    $display("==========================================================================");
  end

endmodule
