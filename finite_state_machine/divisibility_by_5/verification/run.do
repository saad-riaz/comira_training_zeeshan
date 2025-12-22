transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/finite_state_machine/divisibility_by_5 {/home/comira/Pictures/finite_state_machine/divisibility_by_5/div_by_5.sv}
vlog -sv -work work tb_div_by_5.sv
vsim tb_div_by_5
do wave.do
run -all
