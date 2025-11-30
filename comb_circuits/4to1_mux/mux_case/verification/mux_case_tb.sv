module mux_case_tb();

  logic [3:0] d_in;
  logic [1:0] select;
  logic [0:0] d_out;

  mux_case dut(.d_in(d_in), .select(select), .d_out(d_out));

  // Checking function block
  function void check_mux;
    input logic [3:0] d_in;
    input logic [1:0] select;
    input logic d_out;
    logic expected;
    expected = d_in[select];

    $display("select = %b, d_out = %b, expected = %b", select, d_out, expected);
    if (d_out === expected)
      $display("PASS");
    else
      $display("FAIL");
  endfunction
 
  initial begin
    $dumpfile("muxx_case_vcd.vcd");   // name of the VCD file to generate
    $dumpvars(0, mux_case_tb);   // dump all signals in testbench hierarchy
  end

  initial begin

    $display("Lets provide an input of '00_11' to mux");

    d_in = 4'b00_11;

    // looping through all select combinations
    for(int count = 3; count >= 0; count--) begin
      select = count[1:0]; #10;
      check_mux(d_in, select, d_out);
    end

    #10;
    $stop;

  end

endmodule
