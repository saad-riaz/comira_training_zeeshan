transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/mult_design_single_test/posedge_detector {//home/comira/Pictures/seq_circuits/mult_design_single_test/posedge_detector/posedge_detect.sv}
vlog -sv -work work tb_posedge_detect.sv
vsim tb_posedge_detect
do wave.do
run -all
