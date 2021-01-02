import os
import sys

def systemOutput(cmd):
    stream = os.popen(cmd)
    outStr = stream.read()
    lines = outStr.split('\n');
    return lines

def getInfo():
    info = {
		'DE5NET': {'fmax':'kernel_fmax', 'fmax-file':'quartus_sh_compile.log', 'fmax-sep':' ', 'fmax-pos':2, 'resources-file':'top.flow.rpt', 'start':68, 'len':30},
		'OSK' :   {'fmax':'kernel_fmax', 'fmax-file':'quartus_sh_compile.log', 'fmax-sep':' ', 'fmax-pos':2,'resources-file':'top.flow.rpt', 'start':63, 'len':25},
		'HARP' :   {'fmax':'kernel_fmax', 'fmax-file':'quartus_sh_compile.log', 'fmax-sep':' ', 'fmax-pos':2,'resources-file':'top.flow.rpt', 'start':63, 'len':25},
		'PAC10' :   {'fmax':'"Kernel fmax"', 'fmax-file':'acl_quartus_report.txt', 'fmax-sep':':','fmax-pos':1,'resources-file':'acl_quartus_report.txt', 'start':7, 'len':7},
		'PACS10' :   {'fmax':'"Kernel fmax"', 'fmax-file':'build/acl_quartus_report.txt', 'fmax-sep':':', 'fmax-pos':1,'resources-file':'build/output_files/afu_default.flow.rpt', 'start':75, 'len':22},
    }
    return info

def getDesignDir(dsg, et, th, pl):
    if (th == -1):
        dir = '{}_e{}'.format(dsg, et)
    else:
        dir = '{}_e{}_{}'.format(dsg, et, th)
    if (pl == -1):
        ptype = '_var'
    else:
        ptype = '_{}_{}'.format(pl, pl)
    return dir+ptype

def getDesignFmax(board, dsg, et, th, pl):
    info = getInfo()
    sfmaxsep = info[board]['fmax-sep']
    fmaxpos = info[board]['fmax-pos']
    sfmaxfile = info[board]['fmax-file']
    query = info[board]['fmax']

    sdir = getDesignDir(dsg, et, th, pl)
    sfile = '{}/{}'.format(sdir, sfmaxfile)
    if (os.path.exists(sfile) == False):
        return '?'
    cmd = 'grep {} {}'.format(query, sfile)
    sout = systemOutput(cmd)
    sout = sout[0]
    if ('fmax' in sout):
        return int(float(sout.split(sfmaxsep)[fmaxpos].strip()))
    else:
        return '?'

def getDesignResources(board, dsg, et, th, pl):
    info = getInfo()
    sresourcesfile = info[board]['resources-file']
    sdir = getDesignDir(dsg, et, th, pl)
    sfile = '{}/{}'.format(sdir, sresourcesfile)
    if (os.path.exists(sfile) == False):
        return '?'
    cmd = ' grep "Logic utilization" {}'.format(sfile)
    sout = systemOutput(cmd)
    ret = sout[0]
    if ('ALMs' in ret):
        # PACS10
        part = ret.split('(')
        part = part[2].split(')')
        ret = part[0]
        return ret.strip()
    elif ('Logic utilization' in ret):
        part = ret.split('(')
        part = part[1].split(')')
        ret = part[0].strip()
    else:
        return '?'
    return ret

def reportDesign(board, name, th, et, pl):
    info = getInfo()

    if (th == -1):
        dir = '{}_e{}'.format(name, et)
    else:
        dir = '{}_e{}_{}'.format(name, et, th)

    if (pl == -1):
        ptype = '_var'
    else:
        ptype =  '_{}_{}'.format(pl, pl)

    aocx = dir+ptype

    print("", flush=True)	
    print("========================================================", flush=True)
    print('| Results for', aocx,  flush=True)
    print("========================================================", flush=True)
	
    sfmax = info[board]['fmax']
    sfmaxfile = info[board]['fmax-file']
    sstart = info[board]['start']
    slen = info[board]['len']
    sresourcesfile = info[board]['resources-file']
    os.system('grep {} {}/{}'.format(sfmax, aocx, sfmaxfile))
    os.system('head -n {} {}/{} | tail -n {}'.format(sstart, aocx, sresourcesfile, slen))


def reportDesigns(board, design):

	thresholdbased = ['shd', 'shouji', 'sneaky']
		
	ths = [[3,5,7],[3,7,10],[5,10,15]]
	ets = [0,1,2]
	pls = [100,150,300]

	for i in range(len(ets)):
		pl = pls[i]
		et = ets[i]

		for des in design:	
			if (des in thresholdbased):
				for th in ths[i]:
					#reportDesign(des, th, 'var')
					reportDesign(board, des, th, et, pl)
				
	
		if 'kmer' in design:
			reportDesign(board, 'kmers', -1, et, pl)
			reportDesign(board, 'kmers', -1, et, -1)


def reportTable(board):
    ths = [[3,5,7],[3,7,10],[5,10,15]]
    ets = [0,1,2]
    pls = [100,150,300]

    print('RESOURCE TABLE')
    print('------------------------------------------------------------------')
    slink = '|{: <10}|'.format('')
    for etidx, et in enumerate(ets):
        print('{}{: <17}|'.format(slink, et), end='')
        slink = ''
    print('')

    slink = '|{: <10}|'.format('Design')
    for etidx, et in enumerate(ets):

        for th in ths[etidx]:
            print('{}{: <5}|'.format(slink, th), end='')
            slink = ''
    print('')
    for dsg in ['shd', 'shouji', 'sneaky']:
        slink = '|{: <10}|'.format(dsg)
        for etidx, et in enumerate(ets):
            for th in ths[etidx]:
                v = getDesignResources(board, dsg, et, th, pls[etidx])
                print('{}{: <5}|'.format(slink, v), end='')
                slink = ''
        print('')

    print('')
    print('Fmax TABLE')
    print('-------------------------------------------------------------------')
    slink = '|{: <10}|'.format('')
    for etidx, et in enumerate(ets):
        print('{}{: <17}|'.format(slink, et), end='')
        slink = ''
    print('')
    for dsg in ['shd', 'shouji', 'sneaky']:
        slink = '|{: <10}|'.format(dsg)
        for etidx, et in enumerate(ets):
            for th in ths[etidx]:
                v = getDesignFmax(board, dsg, et, th, pls[etidx])
                print('{}{: <5}|'.format(slink, v), end='')
                slink = ''
        print('')


