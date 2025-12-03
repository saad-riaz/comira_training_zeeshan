// Verilog code to detect the Negedge of a 1-bit signal sig. It should generate a one-shot signal after detecting a negedge.

module negedge_detect(
  input logic clk, rst,
  input logic sig,
  output logic detection
);

  logic sig_reg;

  always_ff @(posedge clk) begin
    if(rst)
      sig_reg <= 0;

    else
      sig_reg <= sig;
  end

  assign detection = sig_reg & (~sig);

endmodule
