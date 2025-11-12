transcript on 
if {[file exists rtl_work]} { 
vdel -lib rtl_work -all 
} 
vlib rtl_work 
vmap work rtl_work 

vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/odd_parity {/home/comira/Documents/comb_ckt/odd_parity/odd_parity.sv}

vlog -sv -work work odd_parity_tb.sv     
vsim odd_parity_tb                       
do wave.do                               
run -all                                 
