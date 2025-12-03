// calculate the frequency of the input signal, signal?s frequency can be from 1MHz to 50MHz.

module freq_cal #(parameter FREQ = 100)(
  input logic clk, rst,
  input logic signal,
  output logic [5:0] frequency
);

  logic [6:0] count_clk;
  logic [6:0] count_sig;
  logic [6:0] freq;

  always_ff @(negedge clk or posedge rst) begin
    if(rst)
      count_clk <= 0;

    else if(count_clk == 7'd100) begin
      frequency <= freq;
      count_clk <= count_clk;
    end

    else
      count_clk <= count_clk + 1;
    end

  always_ff @(negedge signal or posedge rst) begin
    if(rst)
      count_sig <= 0;

    else if(count_clk == 7'd100)
      count_sig <= count_sig;

    else
      count_sig <= count_sig + 1;
    end

  assign freq = ((100 * count_sig) / count_clk);

endmodule
