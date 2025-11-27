// 16-bit Parallel-Out-Serial-In circuit

module sipo_2(
  input logic clk, rst,
  input logic sin,
  output logic [15:0] pout,
  output logic fill_up
);

  logic [15:0] shift_reg;
  logic [3:0] flag_counter;

  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      shift_reg <= 0;
      flag_counter <= 0;
      fill_up <= 1'b0;
    end

    else begin
      shift_reg <= {shift_reg[14:0], sin};

      if(flag_counter == 4'd15) begin
        fill_up <= 1'b1;
        flag_counter <= 0;
      end

      else begin
        fill_up <= 1'b0;
        flag_counter <= flag_counter + 1;
      end
    end
  end

  assign pout = shift_reg;

endmodule
