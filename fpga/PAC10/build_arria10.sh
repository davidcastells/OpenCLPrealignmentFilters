#!/bin/bash
source /data/intel_fpga/devcloudLoginToolSetup.sh
tools_setup -t A10DS 1.2
cd /home/u44851/INT_Bioinformatics/OpenCLPrealignmentFilters/fpga/PAC10
make
