module tb_piso_to_sipo();

  logic clk, rst;
  logic load_shift;
  logic [15:0] pin, pout;

  logic [4:0] count = 0;

  piso_to_sipo dut(.clk(clk), .rst(rst), .load_shift(load_shift), .pin(pin), .pout(pout));

  initial
    clk = 1'b1;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #3ns;
    rst = 1'b0;
  end

  task word_transfer();
    @(posedge clk) begin
      if(rst)
	      count <= '0;

      else if(!rst && count == 5'd16) begin
	      count <= '0;
	      load_shift <= '1;
	      pin = $random;
      end

      else begin
	      count <= count + 1;
	      load_shift <= '0;
      end
    end
  endtask

  initial begin
    #10ns;

    pin = $random;

    load_shift = 1'b1; #10ns;
    load_shift = 1'b0;
  end

  initial begin
    #600ns;
    $stop;
  end

  initial begin
    forever word_transfer();
  end

endmodule
