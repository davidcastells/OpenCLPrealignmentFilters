NOHUP=
BOARD=PACS10

all: shd_3_var.aocx shd_3_100_100.aocx kmers_var.aocx kmers_100_100.aocx

clean:
	rm -fr kmers_*
	rm -fr shd_*
	rm -fr build_stratix10.sh.*

early:
	aoc -c ../shd.cl -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers

select_shd_3_var:
	rm -f ../shd.aocx
	ln -s PAC10/shd_3_var.aocx ../shd.aocx

shd_3_var.aocx:
	$(NOHUP) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D BASIC_AP_UINT -D SHD_THRESHOLD=3 ../shd.cl -o shd_3_var.aocx > compile.shd_3_var.out 

select_shd_3_100_100:
	rm -f ../shd.aocx
	ln -s PAC10/shd_3_100_100.aocx ../shd.aocx

shd_3_100_100.aocx:
	$(NOHUP) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D BASIC_AP_UINT -D SHD_THRESHOLD=3 -D PATTERN_LEN=100 -D TEXT_LEN=100 ../shd.cl -o shd_3_100_100.aocx > compile.shd_3_100_100.out 

shd_4_var.aocx:
	$(NOHUP) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D BASIC_AP_UINT -D SHD_THRESHOLD=3 ../shd.cl -o shd_4_var.aocx > compile.fpga.out

shd_5_var.aocx:
	$(NOHUP) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D BASIC_AP_UINT -D SHD_THRESHOLD=3 ../shd.cl -o shd_5_var.aocx > compile.fpga.out 


select_kmers_var:
	rm -f ../kmers.aocx
	ln -s PAC10/kmers_var.aocx ../kmers.aocx

kmers_var.aocx: ../kmers.cl
	$(NOHUP) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D BASIC_AP_UINT ../kmers.cl -o kmers_var.aocx > compile.kmers_var.out &

select_kmers_100_100:
	rm -f ../kmers.aocx
	ln -s PAC10/kmers_100_100.aocx ../kmers.aocx

kmers_100_100.aocx: ../kmers.cl
	$(NOHUP) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D BASIC_AP_UINT -D PATTERN_LEN=100 -D TEXT_LEN=100 ../kmers.cl -o kmers_100_100.aocx > compile.kmers_100_100.out 

