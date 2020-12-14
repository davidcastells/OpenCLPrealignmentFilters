FPGA_OCL_CFLAGS := $(shell aocl compile-config)
FPGA_OCL_LFLAGS := $(shell aocl link-config)

CC=g++
LD_FLAGS=-lm -lrt $(FPGA_OCL_LFLAGS)
CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS) -O2


all: filter-shd filter-kmers filter-shouji filter-sneaky

clean:
	rm -f *.o
	rm -f filter-shd
	rm -f filter-kmers
	rm -f filter-shouji
	rm -f filter-sneaky

fix_pac10:
	rm -f filter-shd-pac10
	rm -f filter-kmers-pac10
	rm -f filter-shouji-pac10
	rm -f filter-sneaky-pac10
	mv filter-shd filter-shd-pac10
	mv filter-kmers filter-kmers-pac10
	mv filter-shouji filter-shouji-pac10
	mv filter-sneaky filter-sneaky-pac10

fix_pacs10:
	rm -f filter-shd-pacs10
	rm -f filter-kmers-pacs10
	rm -f filter-shouji-pacs10
	rm -f filter-sneaky-pacs10
	mv filter-shd filter-shd-pacs10
	mv filter-kmers filter-kmers-pacs10
	mv filter-shouji filter-shouji-pacs10
	mv filter-sneaky filter-sneaky-pacs10

filter-shd: filter-test.cpp PrealignmentFilter.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shd"\" filter-test.cpp PrealignmentFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp edlib.cpp -o filter-shd -lOpenCL

filter-kmers: filter-test.cpp PrealignmentFilter.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""kmers"\" filter-test.cpp PrealignmentFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp edlib.cpp -o filter-kmers -lOpenCL

filter-shouji: filter-test.cpp PrealignmentFilter.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shouji"\" filter-test.cpp PrealignmentFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp edlib.cpp -o filter-shouji -lOpenCL

filter-sneaky: filter-test.cpp PrealignmentFilter.cpp
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""sneaky"\" filter-test.cpp PrealignmentFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp edlib.cpp -o filter-sneaky -lOpenCL
