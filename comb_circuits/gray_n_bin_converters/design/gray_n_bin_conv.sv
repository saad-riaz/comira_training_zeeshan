module gray_n_bin_conv(
  input logic [3:0] binary_in,
  output logic [3:0] binary_out
);

  logic [3:0] gray;

  bin_to_gray #(4) dut1(.binary(binary_in), .gray(gray));
  gray_to_bin #(4) dut2(.binary(binary_out), .gray(gray));

endmodule
