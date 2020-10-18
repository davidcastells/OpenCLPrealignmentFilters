all: select_fpga

select_emulator:
	export CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1
	export CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=1

select_fpga:
	unset CL_CONTEXT_EMULATOR_DEVICE_ALTERA
	unset CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA

select_shd_emu:
	rm -f shd.aocx
	ln -s Emulator_DE5NET/shd.aocx shd.aocx

select_shd3:
	rm -f shd.aocx
	ln -s DE5NET/shd_3.aocx shd.aocx

select_kmers_emu:
	rm -f kmers.aocx
	ln -s Emulator_DE5NET/kmers.aocx kmers.aocx

select_kmers:
	rm -f kmers.aocx
	ln -s DE5NET/kmers.aocx kmers.aocx
