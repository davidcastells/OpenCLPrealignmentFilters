FPGA_OCL_CFLAGS := $(shell aocl compile-config)
FPGA_OCL_LFLAGS := $(shell aocl link-config)

CC=g++
LD_FLAGS=-lm -lrt $(FPGA_OCL_LFLAGS)
CC_FLAGS=-Wall -g $(FPGA_OCL_CFLAGS)


all: compile


compile:
	g++ $(CC_FLAGS) $(LD_FLAGS) filter-test.cpp FPGAKmerFilter.cpp PerformanceLap.cpp OpenCLUtils.cpp TextUtils.cpp -o filter-test -lOpenCL
