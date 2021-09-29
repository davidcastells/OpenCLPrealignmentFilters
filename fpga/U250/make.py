
BOARD='U250'
TIME='/usr/bin/time -f TIME=%E'
#AOCL_FLAGS='--profile.stall all:all:all --profile.data all:all:all --profile_kernel data:all:all:all -D FPGA_DEBUG '
#TARGET='sw_emu'

TARGET='hw'
AOCL_FLAGS=' '

import sys
sys.path.append('..')
import make_board as mb

blocking=True
#blocking=False

#mb.makeSemiglobalVariants(BOARD, AOCL_FLAGS, blocking=blocking)
mb.makeMetaVariants(BOARD, AOCL_FLAGS, blocking=blocking, target=TARGET)

#mb.makeVariants(BOARD, AOCL_FLAGS)
#mb.makeVariants(BOARD, AOCL_FLAGS, ths= [[3,7,10]], lens = [150], entry_types = [1])
#mb.makeVariants(BOARD, AOCL_FLAGS, ths= [[15]], lens = [300], entry_types = [2])
#mb.makeLev(BOARD, AOCL_FLAGS, blocking=blocking)
#mb.makeMyers(BOARD, AOCL_FLAGS, blocking=blocking)
#mb.makeBpc(BOARD, AOCL_FLAGS, blocking=blocking)

