module booth_mult (
  input  logic signed [7:0] multiplicand,
  input  logic signed [7:0] multiplier,
  output logic signed [15:0] product
);

  logic signed [16:0] P;
  logic signed [16:0] A, S;
  integer i;

  always_comb begin
    A = $signed({multiplicand, 9'b0}); 
    S = $signed({-multiplicand, 9'b0}); 
    P = $signed({8'b0, multiplier, 1'b0});

    for (i = 0; i < 8; i++) begin
      case (P[1:0])
        2'b01: P = $signed(P + A);
        2'b10: P = $signed(P + S);
        default: ; // no operation
      endcase
      P = $signed(P) >>> 1; 
    end

    product = $signed(P[16:1]); 
  end

endmodule

