

// Helper class for demonstrating sorting/manipulation on objects
class Packet;
  int id;
  int size;

  function new(int id, int size);
    this.id = id;
    this.size = size;
  endfunction

  function void display();
    $display("    Packet ID: %0d, Size: %0d", id, size);
  endfunction
endclass


module array_manipulation_tb;

  initial begin
    // Standard test arrays
    int int_arr[6] = '{10, 5, 20, 5, 30, 15};
    int result_queue[$];
    int index_queue[$];
    int reduction_result;
    
    $display("==========================================================================");
    $display(" SYSTEMVERILOG ARRAY MANIPULATION DEMONSTRATION");
    $display("==========================================================================");
    $display("Initial Array: int_arr = %p", int_arr);

    // ===========================================================================
    // 1. ARRAY LOCATOR METHODS
    // ===========================================================================
    // These search/filter arrays and return a queue of matching elements/indices.
    $display("\n--- 1. Array Locator Methods (Mandatory 'with' clause) ---");
    
    // find() - Returns all elements satisfying the expression
    result_queue = int_arr.find(item) with (item > 10);
    $display("  find() with (item > 10)                 : %p", result_queue);

    // find_index() - Returns indices of all elements satisfying the expression
    index_queue = int_arr.find_index(x) with (x == 5);
    $display("  find_index() with (x == 5)              : %p", index_queue);

    // find_first() - Returns the first element satisfying the expression
    result_queue = int_arr.find_first(item) with (item > 15);
    $display("  find_first() with (item > 15)           : %p", result_queue);

    // find_first_index() - Returns the index of the first element satisfying the expression
    index_queue = int_arr.find_first_index(item) with (item > 15);
    $display("  find_first_index() with (item > 15)     : %p", index_queue);

    // find_last() and find_last_index()
    result_queue = int_arr.find_last(item) with (item < 20);
    $display("  find_last() with (item < 20)            : %p", result_queue);


    $display("\n--- 2. Array Locator Methods (Optional 'with' clause) ---");
    
    // min() and max() - Returns queue containing min/max values
    result_queue = int_arr.min();
    $display("  min() [No 'with' clause]                : %p", result_queue);
    
    result_queue = int_arr.max();
    $display("  max() [No 'with' clause]                : %p", result_queue);

    // unique() - Returns all unique elements (first occurrence kept)
    result_queue = int_arr.unique();
    $display("  unique() [No 'with' clause]             : %p", result_queue);

    // unique_index() - Returns indices of unique elements
    index_queue = int_arr.unique_index();
    $display("  unique_index() [No 'with' clause]       : %p", index_queue);


    // Optional 'with' clause on min/max/unique
    // Let's find elements that have unique values modulo 10
    result_queue = int_arr.unique(item) with (item % 10);
    $display("  unique(item) with (item %% 10)           : %p (filters based on expression key)", result_queue);


    // ===========================================================================
    // 2. ARRAY REDUCTION METHODS
    // ===========================================================================
    // Reduce array into a single scalar value.
    $display("\n--- 3. Array Reduction Methods ---");
    
    // sum() - Computes the sum of elements
    reduction_result = int_arr.sum();
    $display("  sum()                                   : %0d", reduction_result);

    // product() - Computes product of elements
    reduction_result = int_arr.product();
    $display("  product()                               : %0d", reduction_result);

    // and(), or(), xor() - Bitwise reductions
    reduction_result = int_arr.and();
    $display("  and() (bitwise AND of all elements)     : %0d", reduction_result);

    // IMPORTANT Gotcha: Bit width matching during sum reduction
    begin
      byte byte_arr[4] = '{200, 100, 50, 20}; // Sum = 370 (exceeds 8-bit byte limit of signed byte: -128 to 127)
      int correct_sum;
      byte overflow_sum;
      
      overflow_sum = byte_arr.sum(); // Performs 8-bit addition first, then assigns
      correct_sum = byte_arr.sum(item) with (int'(item)); // Casts elements to int before summing
      
      $display("  [WARNING] byte_arr.sum() (overflowed)   : %0d", overflow_sum);
      $display("  [CORRECT] byte_arr.sum() with (int'(x)) : %0d", correct_sum);
    end


    // ===========================================================================
    // 3. ARRAY ORDERING METHODS
    // ===========================================================================
    $display("\n--- 4. Array Ordering Methods ---");
    
    // sort() - Sorts in ascending order (Modifies the array in-place)
    int_arr.sort();
    $display("  sort() (Ascending)                      : %p", int_arr);

    // rsort() - Sorts in descending order (in-place)
    int_arr.rsort();
    $display("  rsort() (Descending)                    : %p", int_arr);

    // reverse() - Reverses element order (in-place)
    int_arr.reverse();
    $display("  reverse()                               : %p", int_arr);

    // shuffle() - Randomly shuffles elements (in-place)
    int_arr.shuffle();
    $display("  shuffle() (Randomized)                  : %p", int_arr);


    // ===========================================================================
    // 4. ARRAY ORDERING ON CLASSES (OBJECTS)
    // ===========================================================================
    $display("\n--- 5. Array Ordering on Classes ---");
    begin
      Packet packet_list[4];
      packet_list[0] = new(3, 1500);
      packet_list[1] = new(1, 64);
      packet_list[2] = new(4, 512);
      packet_list[3] = new(2, 128);

      $display("  Original Class Array:");
      foreach (packet_list[i]) packet_list[i].display();

      // Sort objects by their member variable 'size'
      // Note: A 'with' clause is mandatory when sorting arrays of classes!
      packet_list.sort(p) with (p.size);
      $display("  Sorted by 'p.size' ascending:");
      foreach (packet_list[i]) packet_list[i].display();

      // Sort objects by their member variable 'id' descending
      packet_list.rsort(p) with (p.id);
      $display("  Sorted by 'p.id' descending (rsort):");
      foreach (packet_list[i]) packet_list[i].display();
    end

    $display("==========================================================================");
  end

endmodule
