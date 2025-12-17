transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/mult_design_single_test/top_single_test {/home/comira/Pictures/seq_circuits/mult_design_single_test/top_single_test/top_single.sv}
vlog -sv -work work tb_top_single.sv
vsim tb_top_single
do wave.do
run -all
