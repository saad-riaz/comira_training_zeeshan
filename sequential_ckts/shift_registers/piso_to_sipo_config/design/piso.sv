// 16-bit Parallel-In-Serial-Out circuit 

module piso(
  input logic clk, rst,
  input logic load_shift,
  input logic [15:0] pin,
  output logic sout,
  output logic complete
);

  logic [15:0] shift_reg;
  logic [3:0] flag_counter;


  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      shift_reg <= 0;
      flag_counter <= 0;
    end

    else if(load_shift)
      shift_reg <= pin;

    else begin
      shift_reg <= {shift_reg[14:0], 1'b0};

      if(flag_counter == 4'd15)
        flag_counter <= 0;

      else
        flag_counter <= flag_counter + 1;
    end
  end


  assign sout = shift_reg[15];
  assign complete = (flag_counter == 4'd15) ? 1'b1 : 1'b0;

endmodule
