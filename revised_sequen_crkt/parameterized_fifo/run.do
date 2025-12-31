vlog -sv /home/comira/Pictures/comira_training_zeeshan/sequential_ckts/parameterized_fifo/fifo.sv /home/comira/Pictures/comira_training_zeeshan/sequential_ckts/parameterized_fifo/tb_fifo.sv
vopt work.tb_fifo -o tb_fifo_opt +acc
vsim tb_fifo_opt
add wave sim:/tb_fifo/dut/*
run -all
