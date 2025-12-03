module gray_n_bin_tb();

  logic [3:0] binary_in;
  logic [3:0] gray;
  logic [3:0] binary_out;

  bin_to_gray #(4) dut_1(.gray(gray), .binary(binary_in));
  gray_to_bin #(4) dut_2(.gray(gray), .binary(binary_out));

  // Checking function block for monitoring results
  function void check_gray;
    input logic [3:0] binary_in;
    input logic [3:0] binary_out;
    input logic [3:0] gray;

    $display("binary_in = %b, gray = %b, binary_out = %b", binary_in, gray, binary_out);

    if (binary_out === binary_in)
      $display("PASS");
    else
      $display("FAIL");
  endfunction

  initial begin
    $dumpfile("gray_bin_vcd.vcd");   // name of the VCD file to generate
    $dumpvars(0, gray_n_bin_tb);   // dump all signals in testbench hierarchy
  end

  initial begin

    $display("Applying a set of three binary values to achieve same as output");

    binary_in = 4'b1011; #10; check_gray(binary_in, binary_out, gray);
    binary_in = 4'b1000; #10; check_gray(binary_in, binary_out, gray);
    binary_in = 4'b1111; #10; check_gray(binary_in, binary_out, gray);

    $stop;

  end

endmodule
