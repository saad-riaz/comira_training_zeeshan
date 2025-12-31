vlog -sv /home/comira/Pictures/comira_training_zeeshan/sequential_ckts/frequency_calculator/frequen_cal.sv /home/comira/Pictures/comira_training_zeeshan/sequential_ckts/frequency_calculator/tb_freq_cal.sv
vopt work.tb_freq_cal -o tb_freq_cal_opt +acc
vsim tb_freq_cal_opt
add wave sim:/tb_freq_cal/dut/*
run -all
