all: shd_3_var.aocx

early:
	aoc -c ../shd.cl -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers

shd_3_var.aocx:
	nohup aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D SHD_THRESHOLD=3 ../shd.cl -o shd_3_var.aocx > compile.shd_3_var.out &

shd_3_100_100.aocx:
	nohup aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D SHD_THRESHOLD=3 -D PATTERN_LEN=100 -D TEXT_LEN=100 ../shd.cl -o shd_3_100_100.aocx > compile.shd_3_100_100.out &

shd_4_var.aocx:
	nohup aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D SHD_THRESHOLD=3 ../shd.cl -o shd_4_var.aocx > compile.fpga.out &

shd_5_var.aocx:
	nohup aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers -D SHD_THRESHOLD=3 ../shd.cl -o shd_5_var.aocx > compile.fpga.out &

kmers.aocx: ../kmers.cl
	nohup aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers ../kmers.cl -o kmers.aocx > compile.kmers.out &


