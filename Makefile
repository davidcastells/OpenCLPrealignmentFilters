#FPGA_OCL_CFLAGS := $(shell aocl compile-config)
#FPGA_OCL_LFLAGS := $(shell aocl link-config)

CC=g++
LD_FLAGS=-lm -lrt $(FPGA_OCL_LFLAGS)
CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS) -O2 -I /opt/xilinx/xrt/include/ -D USE_MIGRATE_MEM
#CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS) -O2 -D USE_OPENCL_SVM
# You must specify one of the options -D USE_READ_WRITE -D USE_MIGRATE_MEM -D USE_OPENCL_SVM

all: filter-test

clean:
	rm -f *.o
	rm -f filter-test

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

SOURCES= filter-test.cpp PrealignmentFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp edlib.cpp SWVersions.cpp

filter-test: $(SOURCES)
	g++ $(CC_FLAGS) $(LD_FLAGS) $(SOURCES)  -o filter-test -lOpenCL


