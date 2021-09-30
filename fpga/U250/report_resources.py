import os
import sys
sys.path.append('..')
import report_board as rb


BOARD='U250'

if __name__ == "__main__":
    doTable = False

    design = ['shd', 'shouji', 'sneaky', 'kmers', 'lev', 'myers']
    for i, arg in enumerate(sys.argv):
        if (arg.startswith('design=all')):
            design = ['shd', 'shouji', 'sneaky', 'kmers', 'lev', 'myers']
        elif (arg.startswith('design=')):
            part = arg.split('=')
            design = part[1].split(',')

        if (arg.startswith('table')):
            doTable = True;

    if (doTable):
        rb.reportTable(BOARD)
    else:
        rb.reportDesigns(BOARD,design)



