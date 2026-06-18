

module string_tb;

  // ---------------------------------------------------------------------------
  // 1. STRING DECLARATIONS
  // ---------------------------------------------------------------------------
  // SystemVerilog strings are dynamic arrays of bytes (ASCII characters).
  // Unlike Verilog packed arrays, SV strings can grow dynamically and don't
  // have a fixed size.
  string str1 = "SystemVerilog";
  string str2 = "Verification";
  string str3; // Defaults to empty string "" (null string, length 0)

  initial begin
    $display("==========================================================================");
    $display(" SYSTEMVERILOG STRINGS DEMONSTRATION");
    $display("==========================================================================");

    // Default Initialization Check
    $display("\n--- 1. Declaration and Initialization ---");
    $display("  str1 = \"%s\"", str1);
    $display("  str2 = \"%s\"", str2);
    $display("  str3 (default) = \"%s\" (length: %0d)", str3, str3.len());

    // ---------------------------------------------------------------------------
    // 2. STRING OPERATORS
    // ---------------------------------------------------------------------------
    $display("\n--- 2. String Operators ---");
    
    // Concatenation ({s1, s2})
    str3 = {str1, " ", str2};
    $display("  Concatenation {str1, \" \", str2} = \"%s\"", str3);

    // Replication ({N{s1}})
    $display("  Replication {3{\"Go!\"}}             = \"%s\"", {3{"Go!"}});

    // Equality and Inequality (==, !=)
    $display("  Is \"%s\" == \"%s\"?                  = %b", str1, "SystemVerilog", (str1 == "SystemVerilog"));
    $display("  Is \"%s\" != \"%s\"?                  = %b", str1, str2, (str1 != str2));

    // Comparison Operators (<, <=, >, >=) - Lexicographical based on ASCII values
    $display("  Is \"Apple\" < \"Banana\"?            = %b", ("Apple" < "Banana"));
    $display("  Is \"apple\" > \"Apple\"?             = %b (ASCII 'a' (97) > 'A' (65))", ("apple" > "Apple"));

    // Indexing (s[i]) - Returns the byte (ASCII code) at index i (0-based)
    $display("  Character at index 0 of \"%s\"     = %c (ASCII: %0d)", str1, str1[0], str1[0]);


    // ---------------------------------------------------------------------------
    // 3. BUILT-IN STRING METHODS
    // ---------------------------------------------------------------------------
    $display("\n--- 3. Built-in String Methods ---");
    
    // len() - Returns length of string
    $display("  str1.len()                     = %0d", str1.len());

    // getc(index) - Returns ASCII code of character at index
    $display("  str1.getc(1)                   = %0d ('%c')", str1.getc(1), str1.getc(1));

    // putc(index, char) - Replaces the character at the specified index
    str3 = "Hello";
    str3.putc(0, "M"); // Replaces 'H' with 'M'
    $display("  str3 after putc(0, \"M\")        = \"%s\"", str3);

    // toupper() and tolower() - Returns converted string (does not modify original)
    $display("  str1.toupper()                 = \"%s\"", str1.toupper());
    $display("  str1.tolower()                 = \"%s\"", str1.tolower());

    // compare(s) - Case-sensitive lexicographical comparison
    // Returns 0 if equal, negative if this < s, positive if this > s
    $display("  \"SV\".compare(\"sv\")             = %0d (Case-sensitive difference)", "SV".compare("sv"));

    // icompare(s) - Case-insensitive lexicographical comparison
    $display("  \"SV\".icompare(\"sv\")            = %0d (Equal case-insensitive)", "SV".icompare("sv"));

    // substr(i, j) - Returns substring from index i to j (inclusive)
    $display("  str1.substr(6, 12)             = \"%s\" (Extracted substring)", str1.substr(6, 12));


    // ---------------------------------------------------------------------------
    // 4. STRING CONVERSION METHODS
    // ---------------------------------------------------------------------------
    $display("\n--- 4. String to Numeric Conversions (ato...) ---");
    
    // atoi() - String to Decimal Integer
    $display("  \"12345\".atoi()                 = %0d", "12345".atoi());

    // atohex() - String to Hexadecimal Integer
    $display("  \"FF\".atohex()                  = %0d (Decimal: 255)", "FF".atohex());

    // atooct() - String to Octal Integer
    $display("  \"77\".atooct()                  = %0d (Decimal: 63)", "77".atooct());

    // atobin() - String to Binary Integer
    $display("  \"1010\".atobin()                = %0d (Decimal: 10)", "1010".atobin());

    // atoreal() - String to Real (float)
    $display("  \"3.14159\".atoreval()           = %0f", "3.14159".atoreal());


    $display("\n--- 5. Numeric to String Conversions (...toa) ---");
    
    // itoa(i) - Decimal Integer to String
    str3.itoa(100);
    $display("  itoa(100)                      = \"%s\"", str3);

    // hextoa(i) - Hexadecimal Integer to String
    str3.hextoa(255);
    $display("  hextoa(255)                    = \"%s\"", str3);

    // octtoa(i) - Octal Integer to String
    str3.octtoa(63);
    $display("  octtoa(63)                     = \"%s\"", str3);

    // bintoa(i) - Binary Integer to String
    str3.bintoa(10);
    $display("  bintoa(10)                     = \"%s\"", str3);

    // realtoa(r) - Real to String
    str3.realtoa(2.718);
    $display("  realtoa(2.718)                 = \"%s\"", str3);

    $display("==========================================================================");
  end

endmodule
