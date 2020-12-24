import os
import sys

def reportDesign(board, name, th, et, pl):

	info = {
		'DE5NET': {'fmax':'kernel_fmax', 'fmax-file':'quartus_sh_compile.log', 'resources-file':'top.flow.rpt', 'start':68, 'len':30},
		'OSK' :   {'fmax':'kernel_fmax', 'fmax-file':'quartus_sh_compile.log', 'resources-file':'top.flow.rpt', 'start':63, 'len':25},
	}

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
