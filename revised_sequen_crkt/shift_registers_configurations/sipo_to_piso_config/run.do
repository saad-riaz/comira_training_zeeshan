vlog -sv sipo.sv piso.sv sipo_to_piso.sv
vopt work.tb_sipo_to_piso -o tb_sipo_to_piso_opt +acc
vsim tb_sipo_to_piso_opt
add wave sim:/tb_sipo_to_piso/*
run -all
