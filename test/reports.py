
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def plotAlg(name, errortype):
	table_ins = df[df['Test']=='I'][df['Alg'] == name]
	table_subs = df[df['Test']=='S'][df['Alg'] == name]

	print(table_ins)

	ths = table_ins['th']
	ths = list(ths.drop_duplicates())

	fig = plt.figure(figsize=(5,4))
	plt.gcf().subplots_adjust(bottom=0.15)

	plt.xlabel('Input Errors', fontsize=14)

	if (errortype == 'fp'):
		plt.ylabel('FP rate', fontsize=14)
	else:
		plt.ylabel('FN rate', fontsize=14)

	plt.xlim((0, 40))
	plt.ylim((0, 1))

	colors = ['k','b','r']
	print('thresholds: ', ths)
	for thidx in range(len(ths)):
		th = ths[thidx]
		data = table_ins[table_ins['th'] == th]
		e = np.array(list(data['EI']))
		t = np.array(list(data['Total']))
		fp = np.array(list(data['FP']))
		fn = np.array(list(data['FN']))

		x = e * 2
		if (errortype == 'fp'):
			y = np.divide(fp, t)	
		else:
			y = np.divide(fn, t)	

		plt.plot(x,y, colors[thidx]+'-', label='th{}'.format(th))

		data = table_subs[table_subs['th'] == th]
		e = np.array(list(data['ES']))
		t = np.array(list(data['Total']))
		fp = np.array(list(data['FP']))
		fn = np.array(list(data['FN']))

		x = e
		if (errortype == 'fp'):
			y = np.divide(fp, t)	
		else:
			y = np.divide(fn, t)	
		plt.plot(x,y, colors[thidx]+'--', label='th{}'.format(th))

	plt.savefig('results_{}_{}_{}.svg'.format(name, baselen, errortype))
	plt.clf()
	#plt.show()

baselens = [100, 150, 300]

for baselen in baselens: 
	df = pd.read_csv('results_SW_{}.csv'.format(baselen));

	plotAlg('shd', 'fp')
	plotAlg('shouji', 'fp')
	plotAlg('shoujialser', 'fp')
	plotAlg('sneaky', 'fp')
	plotAlg('kmers', 'fp')

	plotAlg('shd', 'fn')
	plotAlg('shouji', 'fn')
	plotAlg('shoujialser', 'fn')
	plotAlg('sneaky', 'fn')
	plotAlg('kmers', 'fn')

