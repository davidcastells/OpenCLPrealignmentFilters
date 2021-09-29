g++ -E -D PREPROCESSING -D SHD_THRESHOLD=3 -D ENTRY_TYPE_0 -D PATTERN_LEN=100 -D TEXT_LEN=100 -I /opt/Xilinx/Vitis_HLS/2020.2/include/ ../shd_xilinx.cpp | sed 's/__hash__ /#/' > shd_e0_3_100_100.cpp

v++ -c -t hw_emu --save-temps -k kmer --platform xilinx_u250_gen3x16_xdma_3_1_202020_1  -g --profile.stall all:all:all --profile.data all:all:all --profile_kernel data:all:all:all --report_dir=shd_e0_3_100_100 --log_dir=shd_e0_3_100_100 --temp_dir=shd_e0_3_100_100  shd_e0_3_100_100.cpp -o shd_e0_3_100_100.xo

v++ --link -t hw_emu --save-temps -k kmer --platform xilinx_u250_gen3x16_xdma_3_1_202020_1  -g --profile.stall all:all:all --profile.data all:all:all --profile_kernel data:all:all:all --report_dir=shd_e0_3_100_100 --log_dir=shd_e0_3_100_100 --temp_dir=shd_e0_3_100_100  shd_e0_3_100_100.xo -o shd_e0_3_100_100.xclbin
