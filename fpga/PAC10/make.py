BOARD='PAC10'
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS=''

import sys
sys.path.append('..')
import make_board as mb

mb.makeVariants(BOARD, AOCL_FLAGS, blocking=True)

