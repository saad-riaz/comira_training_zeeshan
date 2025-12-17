transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/sequential_ckts/shift_registers/sipo_to_piso_config {/home/comira/Pictures/sequential_ckts/shift_registers/sipo_to_piso_config/sipo_to_piso.sv}
vlog -sv -work work tb_sipo_to_piso.sv
vsim tb_sipo_to_piso
do wave.do
run -all
