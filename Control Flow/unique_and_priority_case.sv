// SystemVerilog example demonstrating 'unique case' and 'priority case'

module unique_priority_case_tb;

  logic [2:0] select;

  initial begin
    $display("==================================================");
    $display("1. Demonstrating 'unique case' behavior:");
    $display("==================================================");

    // Case A: Exactly one item matches (Normal behavior)
    select = 3'b010;
    $display("\n--- Case A: select = %b (Exactly one match) ---", select);
    unique case (select)
      3'b001:  $display("Matched 001");
      3'b010:  $display("Matched 010");
      3'b100:  $display("Matched 100");
      default: $display("Matched default");
    endcase

    // Case B: No items match (Without default - leads to a warning/violation)
    select = 3'b111;
    $display("\n--- Case B: select = %b (No match, no default) ---", select);
    $display("[Simulator should print a violation warning for unique case here]");
    unique case (select)
      3'b001: $display("Matched 001");
      3'b010: $display("Matched 010");
      3'b100: $display("Matched 100");
    endcase

    // Case C: Multiple items match (Leads to a warning/violation)
    // Note: To match multiple items in a case statement, we can use overlapping pattern values
    // or variables in a unique case inside simulators supporting it, but usually, case items with
    // overlapping constant values (like duplicate case items) are compile errors.
    // However, with case expressions that can overlap during runtime evaluation (e.g. using 'unique case inside'
    // or logic variables with wildcards/don't cares), overlap can happen.
    // Let's use 'unique case inside' or overlapping ranges/wildcards to show multiple matches at runtime.
    select = 3'b011;
    $display("\n--- Case C: select = %b (Multiple matches in unique case inside) ---", select);
    $display("[Simulator should print a violation warning for unique case here]");
    unique case (select) inside
      3'b01?:  $display("Matched 01? (matches 010, 011)");
      3'b?11:  $display("Matched ?11 (matches 011, 111)");
      default: $display("Matched default");
    endcase


    $display("\n==================================================");
    $display("2. Demonstrating 'priority case' behavior:");
    $display("==================================================");

    // Case D: Multiple items match (First matching branch executes, no warning)
    select = 3'b011;
    $display("\n--- Case D: select = %b (Multiple matches, priority evaluated) ---", select);
    $display("[Evaluated sequentially. No warning for multiple matches.]");
    priority case (select) inside
      3'b01?:  $display("Matched 01? (First match)");
      3'b?11:  $display("Matched ?11 (Second match)");
      default: $display("Matched default");
    endcase

    // Case E: No items match (Without default - leads to a warning/violation)
    select = 3'b000;
    $display("\n--- Case E: select = %b (No match, no default) ---", select);
    $display("[Simulator should print a violation warning for priority case here]");
    priority case (select)
      3'b001: $display("Matched 001");
      3'b010: $display("Matched 010");
      3'b100: $display("Matched 100");
    endcase

    $display("\n==================================================");
    $display("Summary of Rules:");
    $display("- unique case:   Must match EXACTLY one item. Warns if 0 or >1 matches.");
    $display("- priority case: Must match AT LEAST one item. Warns if 0 matches.");
    $display("==================================================");
    $finish;
  end

endmodule
