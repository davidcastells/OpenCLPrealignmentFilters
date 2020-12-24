import os
import sys

def reportDesign(name, th, et, pl):

	if (th == -1):
		dir = '{}_e{}'.format(name, et)
	else:
		dir = '{}_e{}_{}'.format(name, et, th)

	if (pl == -1):
		ptype = '_var'
	else:
		ptype =  '_{}_{}'.format(pl, pl)

	aocx = dir+ptype

	print('Results for', aocx,  flush=True)
	print("========================================================", flush=True)
	

	os.system('grep kernel_fmax {}/quartus_sh_compile.log'.format(dir+ptype))
	os.system('head -n 63 {}/top.flow.rpt | tail -n 25'.format(dir+ptype))


if __name__ == "__main__":

	design = ['shd', 'shouji', 'sneaky', 'kmers']
	thresholdbased = ['shd', 'shouji', 'sneaky']
		
	print(f"Arguments count: {len(sys.argv)}")
	for i, arg in enumerate(sys.argv):
		if (arg.startswith('design=all')):
			design = ['shd', 'shouji', 'sneaky', 'kmers']
		elif (arg.startswith('design=')):
			part = arg.split('=')
			design = part[1].split(',')

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
					reportDesign(des, th, et, pl)
				
	
		if 'kmer' in design:
			reportDesign('kmers', -1, et, pl)
			reportDesign('kmers', -1, et, -1)




