FPGA_OCL_CFLAGS := $(shell aocl compile-config)
FPGA_OCL_LFLAGS := $(shell aocl link-config)

CC=g++
LD_FLAGS=-lm -lrt $(FPGA_OCL_LFLAGS)
CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS) -O2
#CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS) -O2 -D USE_OPENCL_SVM


all: filter-shd filter-kmers filter-shouji filter-sneaky filter-shoujialser

clean:
	rm -f *.o
	rm -f filter-shd
	rm -f filter-kmers
	rm -f filter-shouji
	rm -f filter-shoujialser
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

SOURCES= filter-test.cpp PrealignmentFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp edlib.cpp SWVersions.cpp

filter-shd: $(SOURCES)
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shd"\" $(SOURCES)  -o filter-shd -lOpenCL

filter-kmers: $(SOURCES)
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""kmers"\" $(SOURCES) -o filter-kmers -lOpenCL

filter-shouji: $(SOURCES)
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shouji"\" $(SOURCES) -o filter-shouji -lOpenCL

filter-shoujialser: $(SOURCES)
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""shoujialser"\" $(SOURCES) -o filter-shoujialser -lOpenCL

filter-sneaky: $(SOURCES)
	g++ $(CC_FLAGS) $(LD_FLAGS) -D AOCX_FILE=\""sneaky"\" $(SOURCES) -o filter-sneaky -lOpenCL
