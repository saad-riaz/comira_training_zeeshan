transcript on
if {[file exists rtl_work]} {
vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work
vlog -sv -work work +incdir+/home/comira/Pictures/finite_state_machine/traffic_controller_system {/home/comira/Pictures/finite_state_machine/traffic_controller_system/traffic_controller.sv}
vlog -sv -work work tb_traffic_controller.sv
vsim tb_traffic_controller
do wave.do
run -all
