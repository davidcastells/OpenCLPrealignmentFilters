import os

BOARD='DE5NET'
PLATFORM_ID=0
TIME='/usr/bin/time -f TIME=%E'
AOCL_FLAGS=''

import sys
sys.path.append('..')
import test_board as tb


def runDesign(BOARD, dsg, et, th, pl, N, var=False):
   thresholdbased = ['shd', 'shouji', 'sneaky']

   if (dsg in thresholdbased): 
      aocx = '{}_e{}_{}_{}_{}'.format(dsg, et, th, pl, pl) 
   else:
      aocx = '{}_e{}_{}_{}'.format(dsg, et, pl, pl) 
   print('=============================================================')
   print('RUNNING ', aocx)
   print('=============================================================')
   if (dsg in thresholdbased):
      tb.select(BOARD, dsg, 'e{}_{}_{}_{}'.format(et, th, pl, pl))
   else:
      if (var):
         tb.select(BOARD, dsg, 'e{}_var'.format(et))
      else:
         tb.select(BOARD, dsg, 'e{}_{}_{}'.format(et, pl, pl))

   os.system('../../filter-{} -pid {} -ps 0 -ES 16 -pl {} -tl {} -th {} -n {}'.format(dsg, PLATFORM_ID, pl, pl, th, N))


#runDesign(BOARD, 'shd', 0, 3, 100, 10000000)
#runDesign(BOARD, 'kmers', 0, 3, 100, 10000000)
runDesign(BOARD, 'kmers', 1, 3, 150, 10000000)
#runDesign(BOARD, 'shd', 1, 3, 150, 10000000)

#runDesign(BOARD, 'shd', 7) 
