// Implement a 4x1 multiplexer using case

module mux_case(
  input logic [3:0] d_in,
  input logic [1:0] select,
  output logic d_out
);

  always_comb begin
    case(select)
      2'b00 : d_out = d_in[0];
      2'b01 : d_out = d_in[1];
      2'b10 : d_out = d_in[2];
      2'b11 : d_out = d_in[3];
      default : d_out = 'bx;
    endcase
  end

endmodule
