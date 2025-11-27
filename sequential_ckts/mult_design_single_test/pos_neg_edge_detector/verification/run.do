transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/mult_design_single_test/pos_neg_edge_detector {/home/comira/Pictures/seq_circuits/mult_design_single_test/pos_neg_edge_detector/change_detect.sv}
vlog -sv -work work tb_change_detect.sv
vsim tb_change_detect
do wave.do
run -all
