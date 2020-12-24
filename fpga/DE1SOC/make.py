BOARD='DE1SOC'
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS='--board de1soc_sharedonly'

import sys
sys.path.append('..')
import make_board as mb

#mb.makeVariants(BOARD, AOCL_FLAGS)


mb.makeVariants(BOARD, AOCL_FLAGS)
