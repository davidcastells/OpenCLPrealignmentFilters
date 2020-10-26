BOARD=DE5NET
TIME=/usr/bin/time -f TIME=%E 

all: shd_3_var.aocx shd_3_100_100.aocx kmers_var.aocx kmers_100_100.aocx

clean:
	rm -fr *.aocx
	rm -fr kmer*
	rm -fr shd*

early:
	aoc -c ../shd.cl -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers

select_shd_3_var:
	rm -f ../shd.aocx
	ln -s $(BOARD)/shd_3_var.aocx ../shd.aocx

shd_3_var.aocx:
	nohup $(TIME) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D BASIC_AP_UINT -D SHD_THRESHOLD=3 ../shd.cl -o shd_3_var.aocx > compile.shd_3_var.out &

select_shd_3_100_100:
	rm -f ../shd.aocx
	ln -s $(BOARD)/shd_3_100_100.aocx ../shd.aocx

shd_3_100_100.aocx:
	nohup $(TIME) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers  -D BASIC_AP_UINT -D SHD_THRESHOLD=3 -D PATTERN_LEN=100 -D TEXT_LEN=100 ../shd.cl -o shd_3_100_100.aocx > compile.shd_3_100_100.out &

shd_4_var.aocx:
	nohup $(TIME) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers  -D BASIC_AP_UINT -D SHD_THRESHOLD=3 ../shd.cl -o shd_4_var.aocx > compile.fpga.out &

shd_5_var.aocx:
	nohup $(TIME) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers  -D BASIC_AP_UINT -D SHD_THRESHOLD=3 ../shd.cl -o shd_5_var.aocx > compile.fpga.out &

select_kmers_var:
	rm -f ../kmers.aocx
	ln -s $(BOARD)/kmers_var.aocx ../kmers.aocx

kmers_var.aocx: ../kmers.cl
	nohup $(TIME) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers  -D BASIC_AP_UINT ../kmers.cl -o kmers_var.aocx > compile.kmers_var.out &

select_kmers_100_100:
	rm -f ../kmers.aocx
	ln -s $(BOARD)/kmers_100_100.aocx ../kmers.aocx

kmers_100_100.aocx: ../kmers.cl
	nohup $(TIME) aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers  -D BASIC_AP_UINT -D PATTERN_LEN=100 -D TEXT_LEN=100 ../kmers.cl -o kmers_100_100.aocx > compile.kmers_100_100.out &


test.aocx: ../basic_ap_uint_test.cl
	nohup $(TIME) aoc ../basic_ap_uint_test.cl -o test.aocx > compile.test.out &

select_test:
	rm -f ../shd.aocx
	ln -s $(BOARD)/test.aocx ../shd.aocx



