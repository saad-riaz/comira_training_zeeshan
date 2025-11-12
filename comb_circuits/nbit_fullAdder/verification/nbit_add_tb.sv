module nbit_Add_tb();

  logic [3:0] A, B;
  logic Cin, Cout;
  logic [3:0] Sum;

  nbitAdd #(4) Adder(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));

  function void check_result;
    input logic [3:0] A, B;
    input logic Cin;
    input logic [3:0] Sum;
    input logic Cout;
    logic [4:0] expected;

    expected = A + B + Cin;

    $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b, expected Sum = %b, expected Cout = %b", A, B, Cin, Sum, Cout, expected[3:0], expected[4]);

    if (Sum === expected[3:0] && Cout === expected[4])
      $display("PASS");
    else
      $display("FAIL");
  endfunction

  initial begin
    $dumpfile("nbit_add_vcd.vcd");   // name of the VCD file to generate
    $dumpvars(0, nbit_Add_tb);   // dump all signals in testbench hierarchy
  end

  initial begin

    $display("Applying four different sets of input values");

    A = 4'b0001 ; B = 4'b0010 ; Cin = 1'b0; #10; check_result(A, B, Cin, Sum, Cout);
    A = 4'b0011 ; B = 4'b0100 ; Cin = 1'b1; #10; check_result(A, B, Cin, Sum, Cout);
    A = 4'b0101 ; B = 4'b0110 ; Cin = 1'b0; #10; check_result(A, B, Cin, Sum, Cout);
    A = 4'b1111 ; B = 4'b1111 ; Cin = 1'b0; #10; check_result(A, B, Cin, Sum, Cout);

    $stop;

  end

endmodule
