module tb_div_by_5();

  logic clk, rst;
  logic in_bit;
  logic is_divisible;
  logic [9:0] in_bin_value = 10'b0010101010; // the sequence was provided in the question

  div_by_5 dut (.clk(clk), .rst(rst), .in_bit(in_bit), .is_divisible(is_divisible));

  initial
    clk = 1'b0;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #3ns;
    rst = 1'b0;
  end

  initial begin
    #5ns;

    foreach(in_bin_value[i]) begin
      in_bit = in_bin_value[i]; #10ns;
    end

    #20ns;
    $stop;
  end

  initial begin
    forever begin
      @(posedge clk);
        $display("input : %0d, output : %0d", in_bit, is_divisible);
    end
  end

endmodule
