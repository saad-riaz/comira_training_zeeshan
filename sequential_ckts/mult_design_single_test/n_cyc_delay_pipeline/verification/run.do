transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/mult_design_single_test/n_cyc_delay_pipeline {/home/comira/Pictures/seq_circuits/mult_design_single_test/n_cyc_delay_pipeline/delay_pipeline.sv}
vlog -sv -work work tb_delay_pipeline.sv
vsim tb_delay_pipeline
do wave.do
run -all
