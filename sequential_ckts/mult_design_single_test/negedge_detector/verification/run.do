transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/mult_design_single_test/negedge_detector {/home/comira/Pictures/seq_circuits/mult_design_single_test/negedge_detector/negedge_detect.sv}
vlog -sv -work work tb_negedge_detect.sv
vsim tb_negedge_detect
do wave.do
run -all
