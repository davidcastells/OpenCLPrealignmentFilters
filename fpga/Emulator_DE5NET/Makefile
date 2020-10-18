all: emulator

emulator: shd.aocx kmers.aocx

shd.aocx: ../shd.cl
	export CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1
	export CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA=1
	aoc -march=emulator -D FPGA_DEBUG -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -g ../shd.cl -o shd.aocx

kmers.aocx: ../kmers.cl
	aoc -march=emulator -D FPGA_DEBUG -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -g ../kmers.cl -o kmers.aocx

disable:
	unset CL_CONTEXT_EMULATOR_DEVICE_ALTERA
	unset CL_CONTEXT_EMULATOR_DEVICE_INTELFPGA


