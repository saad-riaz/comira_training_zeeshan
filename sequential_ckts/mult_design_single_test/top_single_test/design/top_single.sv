module top_single(
  input logic clk, rst, enable,
  input logic signal,
  input logic [31:0] data_in,
  output logic posedge_detection, negedge_detection, change_detection,
  output logic pulse,
  output logic [31:0] data_out
);

  posedge_detect pos_dut(.clk(clk), .rst(rst), .sig(signal), .detection(posedge_detection));
  negedge_detect neg_dut(.clk(clk), .rst(rst), .sig(signal), .detection(negedge_detection));
  change_detect change_dut(.clk(clk), .rst(rst), .sig(signal), .detection(change_detection));
  pulse_gen pulse_dut(.clk(clk), .rst(rst), .en(enable), .pulse(pulse));
  delay_pipeline pipe_dut(.clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));

endmodule
