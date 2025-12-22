// 8-bit barrel shifter without using a shift operator

module barrel_shift(
  input logic [7:0] data_in,
  input logic [2:0] shift_amount,
  output logic [7:0] data_out
);

  always_comb begin
    case(shift_amount)
      3'd0 : data_out = data_in;
      3'd1 : data_out = {data_in[0], data_in[7:1]};
      3'd2 : data_out = {data_in[1:0], data_in[7:2]};
      3'd3 : data_out = {data_in[2:0], data_in[7:3]};
      3'd4 : data_out = {data_in[3:0], data_in[7:4]};
      3'd5 : data_out = {data_in[4:0], data_in[7:5]};
      3'd6 : data_out = {data_in[5:0], data_in[7:6]};
      3'd7 : data_out = {data_in[6:0], data_in[7]};
      default : data_out = 'bx;
    endcase
  end

endmodule
