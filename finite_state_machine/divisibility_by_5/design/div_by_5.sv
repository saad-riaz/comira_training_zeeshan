//  Finite State Machine to detect if the input stream contains a number divisible by 5

module div_by_5(
  input logic clk, rst,
  input logic in_bit,
  output logic is_divisible
);

  typedef enum logic [2:0] {Rem0, Rem1, Rem2, Rem3, Rem4} state;
  state curr_state;

  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      curr_state <= Rem0;

    else begin
      case(curr_state)
        Rem0 : curr_state <= in_bit ? Rem1 : Rem0;
        Rem1 : curr_state <= in_bit ? Rem3 : Rem2;
        Rem2 : curr_state <= in_bit ? Rem0 : Rem4;
        Rem3 : curr_state <= in_bit ? Rem2 : Rem1;
        Rem4 : curr_state <= in_bit ? Rem4 : Rem3;
        default : curr_state <= Rem0;
      endcase
    end
  end
/*
always_comb begin
case(curr_state)
Idle : next_state = in_bit ? Rem1 : Rem0;
Rem0 : next_state = in_bit ? Rem1 : Rem0;
Rem1 : next_state = in_bit ? Rem3 : Rem2;
Rem2 : next_state = in_bit ? Rem0 : Rem4;
Rem3 : next_state = in_bit ? Rem2 : Rem1;
Rem4 : next_state = in_bit ? Rem4 : Rem3;
default : next_state = Idle;
endcase
end
*/
  always_comb begin
    case(curr_state)
      Rem0 : is_divisible = 1'b1;
      default : is_divisible = 1'b0;
    endcase
  end

endmodule
