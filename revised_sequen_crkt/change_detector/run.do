vlog -sv /home/comira/Pictures/comira_training_zeeshan/sequential_ckts/mult_design_single_test/pos_neg_edge_detector/change_detect.sv /home/comira/Pictures/comira_training_zeeshan/sequential_ckts/mult_design_single_test/pos_neg_edge_detector/tb_change_detect.sv
vopt work.tb_change_detect -o tb_change_detect_opt +acc
vsim tb_change_detect_opt
add wave sim:/tb_change_detect/dut/*
run -all
