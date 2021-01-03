BOARD='HARP'
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS=''

import time
import sys
sys.path.append('..')
import make_board as mb

blocking=False

mb.makeMetaVariants(BOARD, AOCL_FLAGS, blocking=blocking)


#for th in [5]:
#   mb.metaprogram('sneaky', level='_level_2', flags=' -D SNEAKY_THRESHOLD={} -D PATTERN_LEN={}'.format(th, 8*2))
#   mb.makeVariants(BOARD, AOCL_FLAGS)
#   mb.makeVariants(BOARD, AOCL_FLAGS, ths= [[th]], lens = [100], entry_types = [0], blocking=False, ignoretargets=[])
#   #time.sleep(10)


