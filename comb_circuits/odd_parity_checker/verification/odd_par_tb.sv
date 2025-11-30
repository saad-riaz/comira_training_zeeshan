module odd_par_tb();

  logic [15:0] data_in;
  logic [0:0] parity;

  odd_parity dut(.data_in(data_in), .parity(parity));

  function void check_parity;
    input logic [15:0] data_in;
    input logic parity;
    logic expected;

    expected = ~(^data_in);

    $display("data = %b, parity = %b, expected = %b", data_in, parity, expected);

    if (parity === expected)
      $display("PASS");
    else
      $display("FAIL");
  endfunction

  initial begin
    $dumpfile("odd_parity.vcd");   // name of the VCD file to generate
    $dumpvars(0, odd_par_tb);   // dump all signals in testbench hierarchy
  end

  initial begin

    $display("Sending a set of 5 data values to the design and checking if testcase passes or fails");

    data_in = 16'b0101_0111_0110_1011; #10; check_parity(data_in, parity);
    data_in = 16'b0111_0111_1110_1011; #10; check_parity(data_in, parity);
    data_in = 16'b1101_0101_0110_1010; #10; check_parity(data_in, parity);
    data_in = 16'b0101_1101_0100_1010; #10; check_parity(data_in, parity);
    data_in = 16'b1001_1101_0110_1111; #10; check_parity(data_in, parity);

    #100;
    $stop;

  end

endmodule
