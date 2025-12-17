module piso_to_sipo(
  input logic clk, rst,
  input logic load_shift,
  input logic [15:0] pin,
  output logic [15:0] pout,
  output logic complete
);

  logic serial;

  piso dut1(.clk(clk), .rst(rst), .load_shift(load_shift), .pin(pin), .sout(serial), .complete(complete));
  sipo dut2(.clk(clk), .rst(rst), .sin(serial), .pout(pout));

endmodule
