BOARD='OSK'
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS=''

import sys
sys.path.append('..')
import make_board as mb

ignore = []
ignore.append('kmers_e0_100_100.aocx')
ignore.append('kmers_e1_150_150.aocx')

mb.makeVariants(BOARD, AOCL_FLAGS, ignoretargets=ignore)
#mb.makeVariants(BOARD, AOCL_FLAGS, ths= [[3,7,10]], lens = [150], entry_types = [1])

