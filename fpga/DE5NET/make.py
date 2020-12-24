BOARD='DE5NET'
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS=''

import sys
sys.path.append('..')
import make_board as mb

mb.makeVariants(BOARD, AOCL_FLAGS)
#mb.makeVariants(BOARD, AOCL_FLAGS, ths= [[3,7,10]], lens = [150], entry_types = [1])
