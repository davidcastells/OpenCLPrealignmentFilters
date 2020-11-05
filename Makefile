FPGA_OCL_CFLAGS := $(shell aocl compile-config)
FPGA_OCL_LFLAGS := $(shell aocl link-config)

CC=g++
LD_FLAGS=-lm -lrt $(FPGA_OCL_LFLAGS)
CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS) -O2


all: filter-shd filter-kmers filter-shouji

clean:
	rm -f *.o
	rm -f filter-shd
	rm -f filter-kmers
	rm -f filter-shouji

fix_pac10:
	rm -f filter-shd-pac10
	rm -f filter-kmers-pac10
	rm -f filter-shouji-pac10
	mv filter-shd filter-shd-pac10
	mv filter-kmers filter-kmers-pac10
	mv filter-shouji filter-shouji-pac10

fix_pacs10:
	rm -f filter-shd-pacs10
	rm -f filter-kmers-pacs10
	rm -f filter-shouji-pacs10
	mv filter-shd filter-shd-pacs10
	mv filter-kmers filter-kmers-pacs10
	mv filter-shouji filter-shouji-pacs10

filter-shd: filter-test.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shd"\" filter-test.cpp FPGAKmerFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp -o filter-shd -lOpenCL

filter-kmers: filter-test.cpp FPGAKmerFilter.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""kmers"\" filter-test.cpp FPGAKmerFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp -o filter-kmers -lOpenCL

filter-shouji: filter-test.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shouji"\" filter-test.cpp FPGAKmerFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp -o filter-shouji -lOpenCL
