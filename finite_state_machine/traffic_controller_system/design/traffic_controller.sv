// a traffic controller system for the main and the sub highway traffic

module traffic_controller #(parameter CYCLES = 20)(
  input logic clk, rst,
  input logic sen_train, sen_sub_highway,
  output logic [1:0] main_traffic_lights,
  output logic [2:0] sub_traffic_lights
);

  typedef enum logic [1:0] {IDLE, SUB_PASS_YELLOW, SUB_PASS_GREEN} states;
  states curr_state;

  logic [4:0] cycle_counter;

// Counter which counts cycle till a parameterized value 'CYCLES'
  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      cycle_counter <= 0;

    else if(sen_train)
      cycle_counter <= 0;

    else if(cycle_counter == CYCLES)
      cycle_counter <= 0;

    else
      cycle_counter <= cycle_counter + 1;
  end

// Logic for state transtions (ive used ternary operators instead of if-else)
  always_ff @(posedge clk or posedge rst) begin
    if(rst)
      curr_state <= IDLE;

    else begin
      case(curr_state)
        IDLE : curr_state <= sen_train ? IDLE : (sen_sub_highway ? SUB_PASS_YELLOW : IDLE);
        SUB_PASS_YELLOW : curr_state <= (cycle_counter == CYCLES) ? SUB_PASS_GREEN : SUB_PASS_YELLOW;
        SUB_PASS_GREEN : curr_state <= (cycle_counter == CYCLES) ? IDLE : SUB_PASS_GREEN;
      endcase
    end
  end

  always_comb begin
    case(curr_state)
      IDLE : 
        begin
          main_traffic_lights[1] = 1'b0;
          main_traffic_lights[0] = 1'b1;

          sub_traffic_lights[2] = 1'b1;
          sub_traffic_lights[1] = 1'b0;
          sub_traffic_lights[0] = 1'b0;
        end

      SUB_PASS_YELLOW : 
        begin
          main_traffic_lights[1] = 1'b1;
          main_traffic_lights[0] = 1'b0;

          sub_traffic_lights[2] = 1'b0;
          sub_traffic_lights[1] = 1'b1;
          sub_traffic_lights[0] = 1'b0;
        end

      SUB_PASS_GREEN : 
        begin
          main_traffic_lights[1] = 1'b1;
          main_traffic_lights[0] = 1'b0;

          sub_traffic_lights[2] = 1'b0;
          sub_traffic_lights[1] = 1'b0;
          sub_traffic_lights[0] = 1'b1;
        end
    endcase
  end

endmodule
