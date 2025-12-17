transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/seq_circuits/frequency_calculator {/home/comira/Pictures/seq_circuits/frequency_calculator/freq_cal.sv}
vlog -sv -work work tb_freq_cal.sv
vsim tb_freq_cal
do wave.do
run -all
