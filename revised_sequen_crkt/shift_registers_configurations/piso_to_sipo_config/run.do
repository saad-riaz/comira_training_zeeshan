vlog -sv sipo.sv piso.sv piso_to_sipo.sv
vopt work.tb_piso_to_sipo -o tb_piso_to_sipo_opt +acc
vsim tb_piso_to_sipo_opt
add wave sim:/tb_piso_to_sipo/*
run -all
