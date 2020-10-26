BOARD=Emulator_DE5NET
TIME=/usr/bin/time -f TIME=%E 
AOC_FLAGS=-march=emulator -D FPGA_DEBUG -D FPGA_EMULATION 

all: emulator

clean:
	rm *.aocx
	rm -fr kmers*
	rm -fr shd*

emulator: shd_3_var.aocx kmers_var.aocx


select_shd_3_var:
	rm -f ../shd.aocx
	ln -s $(BOARD)/shd_3_var.aocx ../shd.aocx

shd_3_var.aocx: ../shd.cl
	aoc -march=emulator -D FPGA_DEBUG -D FPGA_EMULATION -D BASIC_AP_UINT -D SHD_THRESHOLD=3 -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -g ../shd.cl -o shd_3_var.aocx

select_kmers_var:
	rm -f ../kmers.aocx
	ln -s $(BOARD)/kmers_var.aocx ../kmers.aocx


kmers_var.aocx: ../kmers.cl
	aoc -march=emulator -D FPGA_DEBUG -D FPGA_EMULATION -D BASIC_AP_UINT -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -g ../kmers.cl -o kmers_var.aocx


select_kmers_100_100:
	rm -f ../kmers.aocx
	ln -s $(BOARD)/kmers_100_100.aocx ../kmers.aocx


kmers_100_100.aocx: ../kmers.cl
	aoc -march=emulator -D FPGA_DEBUG -D FPGA_EMULATION -D PATTERN_LEN=100 -D TEXT_LEN=100 -D BASIC_AP_UINT -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -g ../kmers.cl -o kmers_100_100.aocx

	

test.aocx: ../basic_ap_uint_test.cl
	nohup $(TIME) aoc $(AOC_FLAGS) ../basic_ap_uint_test.cl -o test.aocx > compile.test.out &

select_test:
	rm -f ../shd.aocx
	ln -s $(BOARD)/test.aocx ../shd.aocx

