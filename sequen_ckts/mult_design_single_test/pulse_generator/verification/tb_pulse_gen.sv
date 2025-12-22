module tb_pulse_gen();

  logic clk, rst;
  logic en, pulse;

  pulse_gen dut(.clk(clk), .rst(rst), .en(en), .pulse(pulse));

  initial
    clk = 1'b1;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #10ns;
    rst = 1'b0;
  end

  initial begin
    en = 1'b1;

    #200ns;
    $stop;
  end

endmodule
