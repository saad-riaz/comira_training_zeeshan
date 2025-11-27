// 16-bit Parallel-In-Serial-Out circuit 

module piso_2(
  input logic clk, rst,
  input logic load_shift,
  input logic [15:0] pin,
  output logic sout
);

  logic [15:0] shift_reg;

  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      shift_reg <= 0;

    else if(load_shift)
      shift_reg <= pin;

    else
      shift_reg <= {shift_reg[14:0], 1'b0};
  end

  assign sout = shift_reg[15];

endmodule
