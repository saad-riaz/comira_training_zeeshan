transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/mult_design_single_test/pulse_generator {/home/comira/Pictures/seq_circuits/mult_design_single_test/pulse_generator/pulse_gen.sv}
vlog -sv -work work tb_pulse_gen.sv
vsim tb_pulse_gen
do wave.do
run -all

