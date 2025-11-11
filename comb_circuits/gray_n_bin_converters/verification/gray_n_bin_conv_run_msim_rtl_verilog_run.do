transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/gray_n_bin_conv/design {/home/comira/Documents/comb_ckt/gray_n_bin_conv/design/gray_to_bin.sv}
vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/gray_n_bin_conv/design {/home/comira/Documents/comb_ckt/gray_n_bin_conv/design/bin_to_gray.sv}
vlog -sv -work work +incdir+/home/comira/Documents/comb_ckt/gray_n_bin_conv/design {/home/comira/Documents/comb_ckt/gray_n_bin_conv/design/gray_n_bin_conv.sv}

vlog -sv -work work gray_n_bin_tb.sv
vsim gray_n_bin_tb
do wave.do                             
run -all
