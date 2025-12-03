// a circuit which gives out one pulse after every 100 ns time.

module pulse_gen(
  input logic clk, rst,
  input logic en,
  output logic pulse
);

  logic [3:0] count;
  logic pulse_sig;

  always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
      count <= 0;
      pulse_sig <= 1'b0;
    end

    else if(count == 4'd9) begin
      count <= 0;
      pulse_sig <= 1'b1;
    end

    else begin
      count <= count + 1;
      pulse_sig <= 1'b0;
    end
  end

  assign pulse = en ? pulse_sig : 1'bz;

endmodule
