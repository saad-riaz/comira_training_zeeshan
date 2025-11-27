module tb_change_detect();

  logic clk, rst;
  logic sig;
  logic detection;

  change_detect dut(.clk(clk), .rst(rst), .sig(sig), .detection(detection));

  initial
    clk = 1'b1;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #10ns;
    rst = 1'b0;
  end

  initial begin
    #10ns;

    repeat(25) begin
      sig = $urandom_range(0,1); #10ns;
    end

    #20ns;
    $stop;
  end

endmodule
