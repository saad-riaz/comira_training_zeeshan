// Design a circuit that finds the Odd parity of a 16-bit number.

module odd_parity(
  input logic [15:0] data_in,
  output logic parity
);

  always_comb begin
    parity = ~(^data_in);
  end

endmodule
