module tb_piso_to_sipo();

  logic clk, rst;
  logic load_shift;
  logic complete;
  logic [15:0] pin, pout;

  piso_to_sipo dut(.clk(clk), .rst(rst), .load_shift(load_shift), .pin(pin), .pout(pout), .complete(complete));

  initial
    clk = 1'b0;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #3ns;
    rst = 1'b0;
  end

  task word_transfer();
    if(!rst && complete) begin
      load_shift <= 1'b1;
      pin <= $random;
    end

    else
      load_shift <= 1'b0;
  endtask

  initial begin
    #5ns;
    pin = $random;

    load_shift = 1'b1; #10ns;
    load_shift = 1'b0;
  end

  initial begin
    #1000ns;
    $stop;
  end

  initial begin
    forever begin
      @(posedge clk);
        word_transfer();
    end
  end

endmodule
