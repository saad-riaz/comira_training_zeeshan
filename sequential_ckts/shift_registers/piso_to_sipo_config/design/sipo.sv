// 16-bit Parallel-Out-Serial-In circuit

module sipo(
  input logic clk, rst,
  input logic sin,
  output logic [15:0] pout
);

  logic [15:0] shift_reg;

  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      shift_reg <= 0;

    else
      shift_reg <= {shift_reg[14:0], sin};
  end

  assign pout = shift_reg;

endmodule
