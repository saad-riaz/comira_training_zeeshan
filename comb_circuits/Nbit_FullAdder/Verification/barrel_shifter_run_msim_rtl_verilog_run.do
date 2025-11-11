transcript on 
if {[file exists rtl_work]} { 
vdel -lib rtl_work -all 
} 
vlib rtl_work 
vmap work rtl_work 

vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/barrel_shifter {/home/comira/Documents/comb_ckt/barrel_shifter/barrel_shift.sv}

vlog -sv -work work barrel_shift_tb.sv     
vsim barrel_shift_tb                       
do wave.do                               
run -all                                 
