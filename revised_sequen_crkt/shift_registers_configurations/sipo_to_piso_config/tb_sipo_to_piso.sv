module tb_sipo_to_piso();

  logic clk, rst;
  logic serial_in, serial_out;
  logic fill_up;

  logic [4:0] count = '0;

  sipo_to_piso dut(.clk(clk), .rst(rst), .serial_in(serial_in), .serial_out(serial_out), .fill_up(fill_up));

  initial
    clk = 1'b1;

  always clk = #5ns ~clk;

  initial begin
    rst = '1; #10ns;
    rst = '0;
  end

  task data_transfer();
    @(posedge clk) begin
      if(rst) begin
	      count <= '0;
	      fill_up <= '0;
      end

      else begin
        serial_in <= $urandom_range(0,1);

        if(count == 5'd16) begin
	        count <= '0;
	        fill_up <= 1;
        end

        else begin
          count <= count + 1;
          fill_up <= '0;
        end
      end
    end
  endtask

  initial begin
    forever data_transfer();
  end
    
  initial begin
    #700ns;
    $stop;
  end

endmodule
