module frequen_cal(
  input logic clk, rst,
  input logic signal,
  output logic [7:0] period
);

  logic [7:0] counter;
  logic prev_sig, curr_sig;
  logic measuring;

  // Counter increment and Signal period calculating block
  always_ff @(posedge clk) begin
    if(rst) begin
      prev_sig <= '0;
      curr_sig <= '0;
      measuring <= '0;
      period <= '0;
      counter <= 1;
    end

    else begin
    // Record latest level of the unknown signal inside the cascaded flip-flop
    // structure on every clock cycle
      prev_sig <= curr_sig;
      curr_sig <= signal;

      if(measuring)
        counter <= counter + 1;

      // case of rising edge of signal
      if(!prev_sig && curr_sig) begin
        measuring <= '1;

        if(measuring) begin
          counter <= 1;
          period <= counter;
        end
      end
    end
  end

endmodule
