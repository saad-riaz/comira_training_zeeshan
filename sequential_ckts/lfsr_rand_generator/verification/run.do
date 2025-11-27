transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/lfsr_rand_generator {/home/comira/Pictures/seq_circuits/lfsr_rand_generator/lfsr.sv}
vlog -sv -work work tb_lfsr.sv
vsim tb_lfsr
do wave.do
run -all
