transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/4to1_mux/mux_ifelse {/home/comira/Documents/comb_ckt/4to1_mux/mux_ifelse/mux_ifelse.sv}

vlog -sv -work work mux_ifelse_tb.sv     
vsim mux_ifelse_tb                      
do wave.do                               
run -all                                 

