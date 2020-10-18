FPGA_OCL_CFLAGS := $(shell aocl compile-config)
FPGA_OCL_LFLAGS := $(shell aocl link-config)

CC=g++
LD_FLAGS=-lm -lrt $(FPGA_OCL_LFLAGS)
CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS) -O2


all: filter-shd filter-kmers

clean:
	rm -f *.o
	rm -f filter-shd
	rm -f filter-kmers

filter-shd: filter-test.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shd"\" filter-test.cpp FPGAKmerFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp -o filter-shd -lOpenCL

filter-kmers: filter-test.cpp FPGAKmerFilter.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""kmers"\" filter-test.cpp FPGAKmerFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp -o filter-kmers -lOpenCL
