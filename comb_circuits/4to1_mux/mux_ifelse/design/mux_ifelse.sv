module mux_ifelse(
  input logic [3:0] d_in,
  input logic [1:0] select,
  output logic d_out
);

  always_comb begin
    if(select == 2'b00)      d_out = d_in[0];
    else if(select == 2'b01) d_out = d_in[1];
    else if(select == 2'b10) d_out = d_in[2];
    else if(select == 2'b11) d_out = d_in[3];
    else 			               d_out = 'bx;
  end

endmodule
