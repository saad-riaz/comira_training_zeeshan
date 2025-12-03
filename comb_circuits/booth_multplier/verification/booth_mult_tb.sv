module booth_mult_tb();

  logic signed [7:0] multiplicand, multiplier;
  logic signed [15:0] product;

  booth_mult dut(.multiplicand(multiplicand), .multiplier(multiplier), .product(product));

  // Checking function block for monitoring results
  function void check_booth;
    input logic signed [7:0] multiplicand, multiplier;
    input logic signed [15:0] product;
    logic signed [15:0] expected;

    expected = multiplicand * multiplier;

    $display("multiplicand = %0d, multiplier = %0d, product = %0d, expected = %0d", multiplicand, multiplier, product, expected);

    if (product === expected)
      $display("PASS");
    else
      $display("FAIL");
  endfunction

  initial begin
    $dumpfile("booth_mult_vcd.vcd");   // name of the VCD file to generate
    $dumpvars(0, booth_mult_tb);   // dump all signals in testbench hierarchy
  end

  initial begin

    $display("Applying 6 essential test cases to Booth multiplier");

    multiplicand = 8'sd127; multiplier = -8'sd1; #10; check_booth(multiplicand, multiplier, product); 
    multiplicand = 8'sd0;   multiplier = 8'sd85;  #10; check_booth(multiplicand, multiplier, product);
    multiplicand = -8'sd128; multiplier = 8'sd1;  #10; check_booth(multiplicand, multiplier, product);
    multiplicand = 8'sd64;  multiplier = 8'sd2;   #10; check_booth(multiplicand, multiplier, product); 
    multiplicand = 8'sd5;   multiplier = 8'sd5;   #10; check_booth(multiplicand, multiplier, product); 
    multiplicand = 8'sd100; multiplier = 8'sd1;   #10; check_booth(multiplicand, multiplier, product);

    #10;
    $stop;

  end

endmodule

