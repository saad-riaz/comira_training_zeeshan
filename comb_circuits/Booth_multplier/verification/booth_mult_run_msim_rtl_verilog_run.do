transcript on 
if {[file exists rtl_work]} { 
vdel -lib rtl_work -all 
} 
vlib rtl_work 
vmap work rtl_work 

vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/booth_multiplier {/home/comira/Documents/comb_ckt/booth_multiplier/booth_mult.sv}

vlog -sv -work work booth_mult_tb.sv     
vsim booth_mult_tb                       
do wave.do                               
run -all                                 
