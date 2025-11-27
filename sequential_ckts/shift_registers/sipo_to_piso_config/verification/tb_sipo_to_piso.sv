module tb_sipo_to_piso();

  logic clk, rst;
  logic serial_in, serial_out;
  logic filled_up;

  sipo_to_piso dut(.clk(clk), .rst(rst), .serial_in(serial_in), .serial_out(serial_out), .filled_up(filled_up));

  initial
    clk = 1'b0;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #5ns;
    rst = 1'b0;
  end

  initial begin
    #5ns;

    repeat(32) begin
      serial_in = $urandom_range(0, 1); #10ns;
    end

    #350ns;
    $stop;
  end

endmodule
