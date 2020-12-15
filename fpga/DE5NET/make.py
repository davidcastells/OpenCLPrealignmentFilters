BOARD='DE5NET'
TIME='/usr/bin/time -f TIME=%E'
NOBLOCK='&'
NOHUP='nohup'

import sys
sys.path.append('..')
import make_board as mb

mb.makeAocx(aocx='shd_3_100_100.aocx', cl='../shd.cl', threshold=3, pattern_len=100, text_len=100)
mb.makeAocx(aocx='shouji_3_100_100.aocx', cl='../shouji.cl', threshold=3, pattern_len=100, text_len=100)
mb.makeAocx(aocx='sneaky_3_100_100.aocx', cl='../sneaky.cl', threshold=3, pattern_len=100, text_len=100)

mb.makeAocx(aocx='shd_5_100_100.aocx', cl='../shd.cl', threshold=5, pattern_len=100, text_len=100)
mb.makeAocx(aocx='shouji_5_100_100.aocx', cl='../shouji.cl', threshold=5, pattern_len=100, text_len=100)
mb.makeAocx(aocx='sneaky_5_100_100.aocx', cl='../sneaky.cl', threshold=5, pattern_len=100, text_len=100)

