// 8-bit barrel shifter without using a shift operator

module barrel_shift(
  input logic [7:0] data_in,
  input logic [2:0] shift_amount,
  output logic [7:0] data_out
);

  always_comb begin
    case(shift_amount)
      3'd0 : data_out = data_in;
      3'd1 : data_out = {data_in[6:0], 1'b0};
      3'd2 : data_out = {data_in[5:0], 2'b00};
      3'd3 : data_out = {data_in[4:0], 3'b000};
      3'd4 : data_out = {data_in[3:0], 4'b0000};
      3'd5 : data_out = {data_in[2:0], 5'b00000};
      3'd6 : data_out = {data_in[1:0], 6'b000000};
      3'd7 : data_out = {data_in[0],   7'b0000000};
      default : data_out = 8'b00000000;
    endcase
  end

endmodule