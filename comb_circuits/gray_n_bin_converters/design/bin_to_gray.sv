// a. Write a binary-to-gray converter.

module bin_to_gray #(parameter N = 4)(
  input logic [N-1 : 0] binary,
  output logic [N-1 : 0] gray
);

  int i;

  always_comb begin
    gray[N-1] = binary[N-1];

    for(i = N-2 ; i >= 0 ; i--) begin
      gray[i] = binary[i] ^ binary[i+1];
    end
  end

endmodule 
