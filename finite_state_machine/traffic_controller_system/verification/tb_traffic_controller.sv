module tb_traffic_controller();

  logic clk, rst;
  logic sen_train, sen_sub_highway;
  logic [1:0] main_traffic_lights;
  logic [2:0] sub_traffic_lights;

  traffic_controller #(20) dut (.clk(clk), .rst(rst), .sen_train(sen_train), .sen_sub_highway(sen_sub_highway),
                                .main_traffic_lights(main_traffic_lights), .sub_traffic_lights(sub_traffic_lights));

  initial
    clk = 1'b0;

  always clk = #5ns ~clk;

  initial begin
    rst = 1'b1; #3ns;
    rst = 1'b0;
  end

  task state_display();
    if({sen_train, sen_sub_highway} == 2'b10) begin
      $display("Train is passing on track, while no traffic is present on subhighway");
      $display("Main Highway :: RED : %0d, GREEN : %0d", main_traffic_lights[1], main_traffic_lights[0]);
      $display("Sub Highway :: RED : %0d, YELLOW : %0d, GREEN : %0d", sub_traffic_lights[2], sub_traffic_lights[1], sub_traffic_lights[0]);
    end

    else if({sen_train, sen_sub_highway} == 2'b11) begin
      $display("Train is passing on track, while traffic is present on subhighway");
      $display("Main Highway :: RED : %0d, GREEN : %0d", main_traffic_lights[1], main_traffic_lights[0]);
      $display("Sub Highway :: RED : %0d, YELLOW : %0d, GREEN : %0d", sub_traffic_lights[2], sub_traffic_lights[1], sub_traffic_lights[0]);
    end

    else if({sen_train, sen_sub_highway} == 2'b01) begin
      $display("Train is not passing on track, while traffic is present on subhighway");
      $display("Main Highway :: RED : %0d, GREEN : %0d", main_traffic_lights[1], main_traffic_lights[0]);
      $display("Sub Highway :: RED : %0d, YELLOW : %0d, GREEN : %0d", sub_traffic_lights[2], sub_traffic_lights[1], sub_traffic_lights[0]);
    end

    else begin
      $display("Train is not passing on track, while traffic is not present on subhighway");
      $display("Main Highway :: RED : %0d, GREEN : %0d", main_traffic_lights[1], main_traffic_lights[0]);
      $display("Sub Highway :: RED : %0d, YELLOW : %0d, GREEN : %0d", sub_traffic_lights[2], sub_traffic_lights[1], sub_traffic_lights[0]);
    end
  endtask

  initial begin
    #5ns;

    for(int i=3 ; i>=0 ; i--) begin
      {sen_train, sen_sub_highway} = i;
      #400ns;
    end

    #10ns;
    $stop;
  end

  initial begin
    #5ns;
    forever begin
      @(posedge clk); begin
        state_display();
        #205ns;
      end
    end
  end

endmodule
