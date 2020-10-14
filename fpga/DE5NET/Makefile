all: fpga

early:
	aoc -c ../shd.cl -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers

fpga:
	nohup aoc -I $(INTELFPGAOCLSDKROOT)/include/kernel_headers ../shd.cl -o shd.aocx > compile.fpga.out &

