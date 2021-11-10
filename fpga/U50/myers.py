
BOARD='U50'
TIME='/usr/bin/time -f TIME=%E'
#AOCL_FLAGS='--profile.stall all:all:all --profile.data all:all:all --profile_kernel data:all:all:all -D FPGA_DEBUG '
#TARGET='sw_emu'

TARGET='hw'
AOCL_FLAGS=' '

import sys
sys.path.append('..')
import make_board as mb

#blocking=True
blocking=False

ths=[[3,5,7],[3,7,10],[5,10,15]]
lens=[100, 150,300]

for et in range(3):
    tl = lens[et]
    pl = lens[et]
    
    for thidx in range(3):
        th = ths[et][thidx]
        cl = 'myers_e{}_{}_{}_{}.cpp'.format(et,th,tl,pl)
        xclbin = 'myers_e{}_{}_{}_{}.xclbin'.format(et,th,tl,pl)
        meta = '../myers_xilinx.metaprogram'
        dsg = 'myers'
        target=TARGET
        flags = '-D ENTRY_TYPE_{} -D MYERS_THRESHOLD={} -D TEXT_LEN={} -D PATTERN_LEN={}'.format(et,th,tl,pl)
        mb.metaprogram(dsg, meta=meta, cl=cl, flags=flags)
        mb.makeVitisXclbin(xclbin=xclbin, cl=cl, threshold=th, pattern_len=pl, text_len=tl, extra_flags=flags, entry_type=et, blocking=blocking, meta=meta, board=BOARD, target=target)

#mb.makeSemiglobalVariants(BOARD, AOCL_FLAGS, blocking=blocking)
#mb.makeMetaVariants(BOARD, AOCL_FLAGS, blocking=blocking, target=TARGET)

#mb.makeVariants(BOARD, AOCL_FLAGS)
#mb.makeVariants(BOARD, AOCL_FLAGS, ths= [[3,7,10]], lens = [150], entry_types = [1])
#mb.makeVariants(BOARD, AOCL_FLAGS, ths= [[15]], lens = [300], entry_types = [2])
#mb.makeLev(BOARD, AOCL_FLAGS, blocking=blocking)
#mb.makeMyers(BOARD, AOCL_FLAGS, blocking=blocking)
#mb.makeBpc(BOARD, AOCL_FLAGS, blocking=blocking)

