// Verilog code to detect the positive edge of a 1-bit signal sig. It should generate a one-shot signal after detecting a positive edge.

module posedge_detect(
  input logic clk, rst,
  input logic sig,
  output logic detection
);

  logic sig_reg;

  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      sig_reg <= 0;
    end

    else
      sig_reg <= sig;
  end

  assign detection = (~sig_reg) & sig;

endmodule
