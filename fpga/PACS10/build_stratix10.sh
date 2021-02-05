#!/bin/bash
source /data/intel_fpga/devcloudLoginToolSetup.sh
tools_setup -t S10DS 
cd ~/INT_Bioinformatics/OpenCLPrealignmentFilters/fpga/PACS10
python make.py
#aoc -v shd_e2_15_300_300.aoco -o shd_e2_15_300_300.aocx
