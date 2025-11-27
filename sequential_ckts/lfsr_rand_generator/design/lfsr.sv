// random number generator using LFSR

module lfsr(
  input logic clk, rst,
  input logic load_seed,
  input logic [7:0] seed,
  output logic [7:0] rand_num
);


  logic [7:0] lfsr_reg;
  logic feedback;


  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      lfsr_reg <= 0;

    else if(load_seed)
      lfsr_reg <= seed;

    else
      lfsr_reg <= {lfsr_reg[6:0], feedback};
  end

  assign feedback = lfsr_reg[7] ^ lfsr_reg[5] ^ lfsr_reg[4] ^ lfsr_reg[3]; // xor-ed the taps (7, 5, 4, 3) from a primitive polinomial expression
  assign rand_num = lfsr_reg;


endmodule
