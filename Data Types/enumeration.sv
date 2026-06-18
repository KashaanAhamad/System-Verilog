
    
module enumeration_tb;

  // ===========================================================================
  // 1. DIFFERENT TYPE OF ENUM DECLARATIONS
  // ===========================================================================

  // A. Anonymous Enum (Direct declaration of variable, not reusable)
  //    - Discouraged in industry because you cannot pass it to functions/ports easily.
  enum { RED, GREEN, BLUE } primary_color;

  // B. Typedef Enum (Industry Best Practice)
  //    - Highly reusable, clean, and supports type-checking.
  typedef enum { IDLE, SETUP, ACCESS, HOLD } state_t;
  state_t current_state, next_state;

  // C. Enum with Explicit Base Types
  //    - Crucial for synthesis to define physical hardware width (defaults to 'int' which is 32-bit).
  //    - logic base type allows 4-state values (X, Z).
  typedef enum logic [1:0] {
    OP_ADD = 2'b00,
    OP_SUB = 2'b01,
    OP_MUL = 2'b10,
    OP_DIV = 2'b11
  } op_code_t;

  // D. Enum with Explicit/Custom Value Assignments
  //    - Constants don't have to be sequential. Missing values auto-increment from previous.
  typedef enum {
    RESET = 0,
    START = 10,
    RUN   = 11, // Auto-assigned previous + 1 = 11
    STOP  = 20
  } cmd_t;

  // E. Enum with Range / Auto-generated Member Names (Less known/used)
  //    - Creates identifiers: S0, S1, S2
  typedef enum { S[3] } auto_state_3_t; // S0 = 0, S1 = 1, S2 = 2
  //    - Creates identifiers with specific range: ST2, ST3, ST4
  typedef enum { ST[2:4] } auto_state_range_t; 


  initial begin
    state_t state;
    cmd_t command;
    auto_state_3_t auto_state;
    
    $display("==========================================================================");
    $display(" SYSTEMVERILOG ENUMERATIONS DEMONSTRATION");
    $display("==========================================================================");

    // Default Value Check
    // Enums default to the value of the first member (index 0)
    $display("\n--- 1. Default Initial Values ---");
    $display("  default state_t (IDLE = 0)         = %s (%0d)", state.name(), state);
    $display("  default cmd_t (RESET = 0)          = %s (%0d)", command.name(), command);
    $display("  default auto_state_3_t (S0 = 0)    = %s (%0d)", auto_state.name(), auto_state);

    // ===========================================================================
    // 2. BUILT-IN ENUM METHODS (Demonstrated)
    // ===========================================================================
    $display("\n--- 2. Built-in Enum Methods Demo ---");
    state = SETUP;
    
    // A. num() - Returns the number of elements in the enum.
    $display("  state.num()   = %0d (Total elements in state_t)", state.num());

    // B. name() - Returns the string representation of the current value.
    //    [Highly Used in Industry for Debug/Logs/Assertions]
    $display("  state.name()  = %s (String name of current value)", state.name());

    // C. first() - Returns the first element of the enum.
    $display("  state.first() = %s (%0d)", state.first().name(), state.first());

    // D. last() - Returns the last element of the enum.
    $display("  state.last()  = %s (%0d)", state.last().name(), state.last());

    // E. next() - Returns the next element. Wraps around to first() if at last().
    //    - next(N) returns Nth next element (lesser known).
    $display("  state.next()  = %s (%0d)", state.next().name(), state.next());
    $display("  state.next(2) = %s (%0d) [2 steps forward]", state.next(2).name(), state.next(2));

    // F. prev() - Returns the previous element. Wraps around to last() if at first().
    //    - prev(N) returns Nth previous element.
    $display("  state.prev()  = %s (%0d)", state.prev().name(), state.prev());

    // ===========================================================================
    // 3. INDUSTRY USAGE ANALYSIS (Prints & Guide)
    // ===========================================================================
    $display("\n==========================================================================");
    $display(" INDUSTRY USAGE MATRIX FOR ENUMS");
    $display("==========================================================================");
    $display(" Feature / Method | Popularity  | Main Use Case & Explanation");
    $display("--------------------------------------------------------------------------");
    $display(" typedef enum     | Ubiquitous  | Reusable type definitions (Standard for design/DV)");
    $display(" logic [N-1:0]    | Essential   | Synthesis constraint (Forces exact hardware bits)");
    $display(" .name()          | Heavy       | Debugging, $display logs, UVM reporting, Assertions");
    $display(" .first()/.next() | Medium      | Loop iteration (Iterating all states in testbenches)");
    $display(" .num()           | Low         | Dynamic sizing or boundary checks in testbenches");
    $display(" .next(N) / .prev()| Low (Rare) | Infrequently used sequence calculations");
    $display(" Anonymous enum   | Discouraged | Leads to type incompatibility between modules");
    $display("==========================================================================");

    // Iterating through all values of state_t using enum methods (Common DV pattern)
    $display("\n--- 4. Industry Loop Pattern (Iterating all enum states) ---");
    state = state.first();
    for (int i = 0; i < state.num(); i++) begin
      $display("  State Index %0d: %s (Value: %0d)", i, state.name(), state);
      state = state.next();
    end
  end

endmodule
