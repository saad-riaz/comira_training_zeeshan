module sipo_to_piso(
  input logic clk, rst,
  input logic serial_in,
  output logic serial_out,
  output logic filled_up
);

  logic load_n_shift;
  logic [15:0] parallel_data;

  sipo_2 dut_1(.clk(clk), .rst(rst), .sin(serial_in), .pout(parallel_data), .fill_up(load_n_shift));
  piso_2 dut_2(.clk(clk), .rst(rst), .load_shift(load_n_shift), .pin(parallel_data), .sout(serial_out));

  assign filled_up = load_n_shift;

endmodule
