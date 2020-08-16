transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {f:/software/quartus13.1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {f:/software/quartus13.1/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {f:/software/quartus13.1/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {f:/software/quartus13.1/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {f:/software/quartus13.1/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {f:/software/quartus13.1/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {f:/software/quartus13.1/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {f:/software/quartus13.1/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {f:/software/quartus13.1/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {f:/software/quartus13.1/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {f:/software/quartus13.1/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {f:/software/quartus13.1/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/non_pipeline.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/regnumDecoder.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/regFile.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/PC.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/paras.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/mul3t1.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/mul2t1.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/memory.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/LSBextract.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/instMem.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/immGen.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/dataModifier.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/comparator.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/ALUSaGen.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/adder.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/control.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/ALUctl.v}
vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/src {F:/WorkFiles/verilog/RV32/src/ALU.v}

vlog -vlog01compat -work work +incdir+F:/WorkFiles/verilog/RV32/synthesis/../simulation/modelsim {F:/WorkFiles/verilog/RV32/synthesis/../simulation/modelsim/non_pipeline.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  non_pipeline_vlg_tst

add wave *
view structure
view signals
run 1 us
