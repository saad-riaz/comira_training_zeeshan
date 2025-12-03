// implement a delay pipeline for 32-bit data for N Delay cycles.

module delay_pipeline #(parameter N = 4)(
  input logic clk, rst,
  input logic [31:0] data_in,
  output logic [31:0] data_out
);

  logic [31:0] pipe_reg [N-1 : 0];

  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      for(int i=N-1 ; i>=0 ; i--) begin
        pipe_reg[i] <= 0;
      end
    end

    else begin
      pipe_reg[N-1] <= data_in;

      for(int i=N-1 ; i>=1 ; i--) begin
        pipe_reg[i-1] <= pipe_reg[i];
      end
    end
  end

  assign data_out = pipe_reg[0];

endmodule
