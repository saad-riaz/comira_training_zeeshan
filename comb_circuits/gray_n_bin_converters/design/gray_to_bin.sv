// b. Write a gray-to-binary converter.

module gray_to_bin #(parameter N = 4)(
  input logic [N-1 : 0] gray,
  output logic [N-1 : 0] binary
);

  int i;

  always_comb begin
    binary[N-1] = gray[N-1];

    for(i = N-2 ; i >= 0 ; i--) begin
      binary[i] = gray[i] ^ binary[i+1];
    end
  end

endmodule
