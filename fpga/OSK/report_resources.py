import os
import sys

def reportDesign(name, th, type):
	print('Results for', name, th, type, '----------------------')
	if (th == -1):
		dir = '{}_{}'.format(name, type)
	else:		
		dir = '{}_{}_{}'.format(name, th, type)
	os.system('grep kernel_fmax {}/quartus_sh_compile.log'.format(dir))
	os.system('head -n 63 {}/top.flow.rpt | tail -n 25'.format(dir))


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

	for des in design:	
		if (des in thresholdbased):
			for th in [3,5,7]:
				#reportDesign(des, th, 'var')
				reportDesign(des, th, '100_100')
				
	
	if 'kmer' in design:
		reportDesign('kmers', -1, '100_100')
		reportDesign('kmers', -1, 'var')




