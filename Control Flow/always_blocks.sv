// SystemVerilog example demonstrating always_comb, always_latch, always_ff, and conventional always blocks

module always_blocks_demo (
  input  logic clk,
  input  logic rst_n,
  input  logic latch_enable,
  input  logic a,
  input  logic b,
  input  logic [1:0] sel,
  output logic out_comb_modern,
  output logic out_comb_classic,
  output logic out_latch,
  output logic out_ff_modern,
  output reg   out_ff_classic
);

  // ==========================================================================
  // 1. Modern Combinational Logic: always_comb
  // ==========================================================================
  // Advantages over conventional always @(*):
  // - Automatically senses variables read in functions called inside the block.
  // - Guarantees execution at time 0 (initialization), preventing mismatch.
  // - Variables assigned in always_comb cannot be assigned by any other process (multiple-driver protection).
  // - Synthesis tools enforce that it generates pure combinational logic (no latches).
  always_comb begin
    if (sel == 2'b00)
      out_comb_modern = a & b;
    else if (sel == 2'b01)
      out_comb_modern = a | b;
    else
      out_comb_modern = a ^ b; // Enforces that all paths assign out_comb_modern (prevents latches)
  end


  // ==========================================================================
  // 2. Conventional Combinational Logic: always @(*)
  // ==========================================================================
  // Limitations:
  // - Does not evaluate at time 0 unless one of the sensitive signals changes.
  // - Does not automatically add signals inside function calls to the sensitivity list.
  // - Allows multiple processes to write to 'out_comb_classic' (can cause race conditions).
  // - Synthesis tools might not complain if you accidentally infer a latch (e.g., missing else).
  always @(*) begin
    case (sel)
      2'b00:   out_comb_classic = a & b;
      2'b01:   out_comb_classic = a | b;
      default: out_comb_classic = a ^ b;
    endcase
  end


  // ==========================================================================
  // 3. Modern Latch Logic: always_latch
  // ==========================================================================
  // - Used specifically to model level-sensitive latch logic.
  // - Like always_comb, it automatically generates a sensitivity list based on variables read.
  // - Synthesis tools and linters enforce that the block actually represents latch logic
  //   (i.e. contains paths where output holds its previous value, like a missing 'else').
  // - Protects against multiple-driver issues.
  always_latch begin
    if (latch_enable) begin
      out_latch = out_comb_modern;
    end
    // Latch is inferred here because there is no 'else' clause.
    // If latch_enable is low, out_latch retains its previous state.
  end


  // ==========================================================================
  // 4. Modern Sequential Logic (Flip-Flops): always_ff
  // ==========================================================================
  // Advantages:
  // - Synthesis and simulation tools enforce that the block only contains sequential logic.
  // - Requires an event control expression (like @(posedge clk) or @(negedge rst_n)).
  // - Restricts writing to variables to prevent simulator race conditions.
  // - Only non-blocking assignments (<=) should be used inside always_ff for sequential outputs.
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      out_ff_modern <= 1'b0;
    end else begin
      out_ff_modern <= out_comb_modern;
    end
  end


  // ==========================================================================
  // 5. Conventional Sequential Logic: always @(posedge clk)
  // ==========================================================================
  // Limitations:
  // - Lacks compiler checks to ensure it only represents sequential logic.
  // - You could accidentally write combinational logic here, or use blocking (=)
  //   assignments which lead to simulation-synthesis mismatches.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      out_ff_classic <= 1'b0;
    end else begin
      out_ff_classic <= out_comb_classic;
    end
  end

endmodule
