// Verilog code to detect any change in a 32-bit wide signal. It should generate a one-shot signal after detecting a change.

module change_detect(
  input logic clk, rst,
  input logic sig,
  output logic detection
);

  logic sig_reg;

  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      sig_reg <= 0;

    else
      sig_reg <= sig;
  end

  assign detection = sig_reg ^ sig;

endmodule
