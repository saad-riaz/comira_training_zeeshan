transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/sequential_ckts/shift_registers/piso_to_sipo_config {/home/comira/Pictures/sequential_ckts/shift_registers/piso_to_sipo_config/piso_to_sipo.sv}
vlog -sv -work work tb_piso_to_sipo.sv
vsim tb_piso_to_sipo
do wave.do
run -all
