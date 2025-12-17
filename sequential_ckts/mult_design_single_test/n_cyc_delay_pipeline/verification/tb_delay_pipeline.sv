module tb_delay_pipeline();

  logic clk, rst;
  logic [3:0] data_in, data_out;

  delay_pipeline #(4) dut (.clk(clk), .rst(rst), .data_in(data_in), .data_out(data_out));

  initial
    clk = 1'b1;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #10ns;
    rst = 1'b0;
  end

  initial begin
    #10ns;
    repeat(10) begin
      data_in = $urandom; #10ns;
    end

    #20ns;
    $stop;
  end

endmodule
