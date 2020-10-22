#!/bin/bash
source /data/intel_fpga/devcloudLoginToolSetup.sh
tools_setup -t S10DS 
cd ~/INT_Bioinformatics/OpenCLPrealignmentFilters/fpga/PACS10
make
