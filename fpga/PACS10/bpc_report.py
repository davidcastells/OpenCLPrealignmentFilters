import os
import sys
sys.path.append('..')
import report_board as rb



if __name__ == "__main__":
    
    board='PACS10'
    dsg = 'bpc'
    et = 0
    tl = 106

    print('BPC resources in {}'.format(board))
    print('-------------------------------')
    print('|{: <5}|{: <5}|{: <5}|{: <5}|{: <5}|{: <5}|{: <5}|'.format('et', 'th', 'pl', 'tl', 'LUTs', 'FFs', 'fmax'))

    for pl in [100, 150, 200, 250, 300, 350]:
        for erate in [0.03, 0.05, 0.1]:
            th = int(erate*pl)
            tl = pl + 2 * th
            total = pl + tl
            if (total > (512//2)):
                et = 1

            v = rb.getDesignResources(board, dsg, et, th, pl, tl)
            regs = rb.getDesignRegisters(board, dsg, et, th, pl, tl)
            fmax = rb.getDesignFmax(board, dsg, et, th, pl, tl)
            #print('||{: <5}|'.format(slink, v), end='')
            print('|{: <5}|{: <5}|{: <5}|{: <5}|{: <5}|{: <5}|{: <5}|'.format(et, th, pl, tl,v, regs, fmax))



