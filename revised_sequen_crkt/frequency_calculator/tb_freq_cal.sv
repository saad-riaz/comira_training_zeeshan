module tb_freq_cal #(parameter SIG_HALF_FREQ = 10ns, CLK_FREQ = 100)();

  localparam CLK_HALF_PERIOD = 5ns;

  logic clk, rst;
  logic signal;
  logic [7:0] period;

  frequen_cal dut(.clk(clk), .rst(rst), .signal(signal), .period(period));

  function int freq_cal(logic [7:0] period);
    return ( CLK_FREQ / period );
  endfunction

  initial 
    clk = 1'b1;

  always clk = #CLK_HALF_PERIOD ~clk;

  initial begin
    rst = 1'b1; #(0.5 * CLK_HALF_PERIOD);
    rst = 1'b0;
  end

  initial
    signal = 1'b0;

  always signal = #SIG_HALF_FREQ ~signal;

  initial begin
    #400ns;

    $display("Signal frequency is : %0dMHz", freq_cal(period));
    $stop;
  end

endmodule
