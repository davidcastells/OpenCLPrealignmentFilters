import os
import sys
sys.path.append('..')
import report_board as rb


if __name__ == "__main__":
    doTable = False

    design = ['shd', 'shouji', 'sneaky', 'kmers']
    for i, arg in enumerate(sys.argv):
        if (arg.startswith('design=all')):
            design = ['shd', 'shouji', 'sneaky', 'kmers']
        elif (arg.startswith('design=')):
            part = arg.split('=')
            design = part[1].split(',')

        if (arg.startswith('table')):
            doTable = True;

    if (doTable):
        rb.reportTable('HARP')
    else:
        rb.reportDesigns('HARP',design)



