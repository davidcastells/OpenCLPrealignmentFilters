BOARD='PACS10'
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS=''

import sys
sys.path.append('..')
import make_board as mb

#blocking=True
blocking=False

#mb.makeSemiglobalVariants(BOARD, AOCL_FLAGS, blocking=blocking)
#mb.makeMetaVariants(BOARD, AOCL_FLAGS, blocking=blocking)

#mb.makeVariants(BOARD, AOCL_FLAGS, blocking=True)

#mb.makeLev(BOARD, AOCL_FLAGS, blocking=blocking)
#mb.makeMyers(BOARD, AOCL_FLAGS, blocking=blocking)
mb.makeBpc(BOARD, AOCL_FLAGS, blocking=blocking)
