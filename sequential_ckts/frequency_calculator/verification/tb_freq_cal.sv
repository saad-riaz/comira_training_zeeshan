module tb_freq_cal #(parameter SIG_HALF_FREQ = 10ns)();

  localparam CLK_HALF_PERIOD = 5ns;
  localparam FREQ = 1/(2*(CLK_HALF_PERIOD));

  logic clk, rst;
  logic signal;
  static int frequency;

  freq_cal #(FREQ) dut(.clk(clk), .rst(rst), .signal(signal), .frequency(frequency));

  initial 
    clk = 1'b0;

  always clk = #CLK_HALF_PERIOD ~clk;

  initial begin
    rst = 1'b1; #(2*CLK_HALF_PERIOD);
    rst = 1'b0;
  end

  initial
    signal = 1'b0;

  always signal = #SIG_HALF_FREQ ~signal;

  initial begin
    #1100ns;

    $display("Signal frequency is : %0dMHz", frequency);
    $stop;
  end

endmodule
