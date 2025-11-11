transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/4to1_mux/mux_case {/home/comira/Documents/comb_ckt/4to1_mux/mux_case/mux_case.sv}
vlog -sv -work work mux_case_tb.sv     
vsim mux_case_tb                       
do wave.do                               
run -all                                 
