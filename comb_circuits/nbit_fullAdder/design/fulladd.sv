// single bit full adder circuit.

module fullAdd(
  input logic a,
  input logic b,
  input logic cin,
  output logic sum,
  output logic cout
);

  always_comb begin
    sum = a ^ b ^ cin;
    cout = (a & b) | (b & cin) | (cin & a);
  end

endmodule