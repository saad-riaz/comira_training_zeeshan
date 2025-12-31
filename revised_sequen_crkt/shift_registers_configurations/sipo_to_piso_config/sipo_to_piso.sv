module sipo_to_piso(
  input logic clk, rst,
  input logic fill_up,
  input logic serial_in,
  output logic serial_out
);

  logic load_n_shift;
  logic [15:0] parallel_data;

  sipo_2 dut_1(.clk(clk), .rst(rst), .sin(serial_in), .pout(parallel_data));
  piso_2 dut_2(.clk(clk), .rst(rst), .load_shift(fill_up), .pin(parallel_data), .sout(serial_out));

endmodule
