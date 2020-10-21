BOARD=Emulator_DE5NET

all: emulator

clean:
	rm *.aocx
	rm -fr kmers*
	rm -fr shd*

emulator: shd.aocx kmers.aocx


select_shd_3_var:
	rm -f ../shd.aocx
	ln -s $(BOARD)/shd_3_var.aocx ../shd.aocx

shd_3_var.aocx: ../shd.cl
	aoc -march=emulator -D FPGA_DEBUG -D FPGA_EMULATION -D SHD_THRESHOLD=3 -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -g ../shd.cl -o shd_3_var.aocx

select_kmers_var:
	rm -f ../kmers.aocx
	ln -s $(BOARD)/kmers_var.aocx ../kmers.aocx


kmers_var.aocx: ../kmers.cl
	aoc -march=emulator -D FPGA_DEBUG -D FPGA_EMULATION -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -g ../kmers.cl -o kmers_var.aocx


	


