import os
from os import system as system

def generate_source(cpp, dsg, th, et, pl, tl):
    th_var = '{}_THRESHOLD'.format(dsg.upper())
    outfile = '{}_e{}_{}_{}_{}.cpp'.format(dsg,et, th, pl, tl)

    if (os.path.exists(outfile)==True):
        print(outfile, 'exist')
        return

    cmd = "gcc -E -D PREPROCESSING -D FPGA_DEBUG {} -D {}={} -I /opt/Xilinx/Vitis_HLS/2020.2/include/ -D ENTRY_TYPE_{} -D PATTERN_LEN={} -D TEXT_LEN={} | sed 's/__hash__ /#/' > {}".format(cpp, th_var, th, et, pl, tl, outfile)
    print(cmd)
    system(cmd)

dsgs =  ['shd']
ths = [[3],[3],[5]]
ln = [100,150,300]
ets = 3

#dsgs = ['shd', 'shouji', 'sneaky', 'lev', 'myers']
#ths = [[3,5,7],[3,7,10],[5,10,15]]
#ln = [100,150,300]

for dsg in dsgs:
    for et in range(ets):
        for thidx in range(len(ths[et])):
            generate_source('../{}_xilinx.cpp'.format(dsg), dsg, ths[et][thidx], et, ln[et], ln[et])


def compile(dsg):
    cpp = '{}.cpp'.format(dsg)
    dir = dsg
    xo = '{}.xo'.format(dsg)

    if (os.path.exists(xo)==True):
        print(xo, 'exist')
        return

    cmd = "v++ -c -t sw_emu --save-temps -k kmer --platform xilinx_u50_gen3x16_xdma_201920_3 -g --report_dir={} --log_dir={} --temp_dir={} {} -o {}".format(dir, dir, dir, cpp, xo)
    print(cmd)
    system(cmd)

def link(dsg):
    xo = '{}.xo'.format(dsg)
    dir = dsg
    xclbin = '{}.xclbin'.format(dsg)

    if (os.path.exists(xclbin)==True):
        print(xclbin, 'exist')
        return

    cmd = "v++ --link -t sw_emu --save-temps -k kmer --platform xilinx_u50_gen3x16_xdma_201920_3 -g --report_dir={} --log_dir={} --temp_dir={} {} -o {}".format(dir, dir, dir, xo, xclbin)
    print(cmd)
    system(cmd)

for dsg in dsgs:
    for et in range(ets):
        for thidx in range(len(ths[et])):
            dsgfile = '{}_e{}_{}_{}_{}'.format(dsg,et, ths[et][thidx], ln[et], ln[et])
            compile(dsgfile)
            link(dsgfile)


for dsg in dsgs:
    for et in range(ets):
        for thidx in range(len(ths[et])):
            dsgfile = '{}_e{}_{}_{}_{}'.format(dsg,et, ths[et][thidx], ln[et], ln[et])
            link(dsgfile)

#v++ -c -t sw_emu --save-temps -k kmer --platform xilinx_u50_gen3x16_xdma_201920_3  -g -D SHD_THRESHOLD=3 -D ENTRY_TYPE_0   --report_dir=shd_e0_3_100_100 --log_dir=shd_e0_3_100_100 --temp_dir=shd_e0_3_100_100  -D PATTERN_LEN=100 -D TEXT_LEN=100 ../shd_xilinx.cpp -o shd_e0_3_100_100.xo
