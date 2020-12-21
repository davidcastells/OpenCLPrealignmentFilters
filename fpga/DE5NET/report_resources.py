import os

def reportDesign(name, th, type):
	print('Results for', name, th, type, '----------------------')
	if (th == -1):
		dir = '{}_{}'.format(name, type)
	else:		
		dir = '{}_{}_{}'.format(name, th, type)
	os.system('grep kernel_fmax {}/quartus_sh_compile.log'.format(dir))
	os.system('head -n 68 {}/top.flow.rpt | tail -n 30'.format(dir))

for th in [3,5,7]:
	#reportDesign('shd', th, 'var')
	reportDesign('shd', th, '100_100')
	#reportDesign('shouji', th, 'var')
	reportDesign('shouji', th, '100_100')
	#reportDesign('sneaky', th, 'var')
	reportDesign('sneaky', th, '100_100')
	
reportDesign('kmers', -1, '100_100')
reportDesign('kmers', -1, 'var')




