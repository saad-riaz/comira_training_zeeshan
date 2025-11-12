module nbitAdd #(parameter N = 4)(
  input logic [N-1 : 0] A,
  input logic [N-1 : 0] B,
  input logic Cin,
  output logic [N-1 : 0] Sum,
  output logic Cout
);

  logic [N : 0] Carry;

  assign Carry[0] = Cin;
  assign Cout = Carry[N];

  generate
    for(genvar i = 0 ; i < N ; i++) begin : adders
      fullAdd adder(.a(A[i]), .b(B[i]), .cin(Carry[i]), .sum(Sum[i]), .cout(Carry[i+1]));
    end
  endgenerate

endmodule