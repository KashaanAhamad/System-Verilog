// SystemVerilog example demonstrating 'unique if' and 'priority if'

module unique_priority_tb;

  logic [2:0] select;
  
  initial begin
    $display("==================================================");
    $display("1. Demonstrating 'unique if' behavior:");
    $display("==================================================");
    
    // Case A: Exactly one condition is true (Normal behavior)
    select = 3'b001;
    $display("\n--- Case A: select = %b (Exactly one match) ---", select);
    unique if (select[0]) begin
      $display("Branch 1 executed: select[0] is high");
    end else if (select[1]) begin
      $display("Branch 2 executed: select[1] is high");
    end else if (select[2]) begin
      $display("Branch 3 executed: select[2] is high");
    end else begin
      $display("Else branch executed: None are high");
    end

    // Case B: No conditions are true (Without else - leads to a warning/violation)
    select = 3'b000;
    $display("\n--- Case B: select = %b (No match, no else) ---", select);
    $display("[Simulator should print a violation warning for unique if here]");
    unique if (select[0]) begin
      $display("Branch 1 executed");
    end else if (select[1]) begin
      $display("Branch 2 executed");
    end else if (select[2]) begin
      $display("Branch 3 executed");
    end
    
    // Case C: Multiple conditions are true (Leads to a warning/violation)
    select = 3'b011;
    $display("\n--- Case C: select = %b (Multiple matches) ---", select);
    $display("[Simulator should print a violation warning for unique if here]");
    unique if (select[0]) begin
      $display("Branch 1 executed: select[0] is high");
    end else if (select[1]) begin
      $display("Branch 2 executed: select[1] is high");
    end else if (select[2]) begin
      $display("Branch 3 executed: select[2] is high");
    end


    $display("\n==================================================");
    $display("2. Demonstrating 'priority if' behavior:");
    $display("==================================================");

    // Case D: Multiple conditions are true (First matching branch executes, no warning)
    select = 3'b011;
    $display("\n--- Case D: select = %b (Multiple matches, priority evaluated) ---", select);
    $display("[Evaluated sequentially. No warning for multiple matches.]");
    priority if (select[0]) begin
      $display("Branch 1 executed: select[0] is high");
    end else if (select[1]) begin
      $display("Branch 2 executed: select[1] is high");
    end else if (select[2]) begin
      $display("Branch 3 executed: select[2] is high");
    end

    // Case E: No conditions are true (Without else - leads to a warning/violation)
    select = 3'b000;
    $display("\n--- Case E: select = %b (No match, no else) ---", select);
    $display("[Simulator should print a violation warning for priority if here]");
    priority if (select[0]) begin
      $display("Branch 1 executed");
    end else if (select[1]) begin
      $display("Branch 2 executed");
    end else if (select[2]) begin
      $display("Branch 3 executed");
    end

    $display("\n==================================================");
    $display("Summary of Rules:");
    $display("- unique if:   Must match EXACTLY one condition. Warns if 0 or >1 matches.");
    $display("- priority if: Must match AT LEAST one condition. Warns if 0 matches.");
    $display("==================================================");
    $finish;
  end

endmodule
