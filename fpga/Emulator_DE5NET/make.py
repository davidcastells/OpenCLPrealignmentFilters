BOARD='Emulator_DE5NET'
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS='-march=emulator -D FPGA_DEBUG -D FPGA_EMULATION'

import sys
sys.path.append('..')
import make_board as mb

blocking=False
#mb.makeVariants(BOARD, AOCL_FLAGS)
mb.makeMyers(BOARD, AOCL_FLAGS, blocking=blocking)
