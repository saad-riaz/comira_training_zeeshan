module barrel_shift_tb();

  logic [7:0] data_in, data_out;
  logic [2:0] shift_amount;

  barrel_shift dut(.data_in(data_in), .data_out(data_out), .shift_amount(shift_amount));

  // Checking function block for monitoring results
  function void check_shift;
    input logic [7:0] data_in;
    input logic [2:0] shift_amount;
    input logic [7:0] data_out;
    logic [7:0] expected;

    expected = data_in << shift_amount;

    $display("shift_amount = %0d, data_out = %b, expected = %b", shift_amount, data_out, expected);

    if (data_out === expected)
      $display("PASS");
    else
      $display("FAIL");
  endfunction

  initial begin
    $dumpfile("barrel_shift_vcd.vcd");   // name of the VCD file to generate
    $dumpvars(0, barrel_shift_tb);   // dump all signals in testbench hierarchy
  end

  initial begin

    $display("Applying input data of all 1's");

    data_in = 8'b1111_1111;

    shift_amount = 3'd0; #10; check_shift(data_in, shift_amount, data_out);
    shift_amount = 3'd3; #10; check_shift(data_in, shift_amount, data_out);
    shift_amount = 3'd5; #10; check_shift(data_in, shift_amount, data_out);
    shift_amount = 3'd7; #10; check_shift(data_in, shift_amount, data_out);

    $finish;

  end

endmodule
