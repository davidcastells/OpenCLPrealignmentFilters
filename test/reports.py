
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def plotAlg(name):
	table_ins = df[df['Test']=='I'][df['Alg'] == name]
	table_subs = df[df['Test']=='S'][df['Alg'] == name]

	print(table_ins)

	ths = table_ins['th']
	ths = list(ths.drop_duplicates())

	fig = plt.figure(figsize=(5,4))
	plt.gcf().subplots_adjust(bottom=0.15)

	plt.xlabel('Input Errors', fontsize=14)
	plt.ylabel('FP rate', fontsize=14)
	plt.xlim((0, 40))

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
		y = np.divide(fp, t)	
		plt.plot(x,y, colors[thidx]+'-', label='th{}'.format(th))

		data = table_subs[table_subs['th'] == th]
		e = np.array(list(data['ES']))
		t = np.array(list(data['Total']))
		fp = np.array(list(data['FP']))
		fn = np.array(list(data['FN']))

		x = e
		y = np.divide(fp, t)	
		plt.plot(x,y, colors[thidx]+'--', label='th{}'.format(th))

	plt.savefig('results_{}_{}.svg'.format(name, baselen))
	plt.clf()
	#plt.show()

baselens = [100, 150, 300]

for baselen in baselens: 
	df = pd.read_csv('results_SW_{}.csv'.format(baselen));

	plotAlg('shd')
	plotAlg('shouji')
	plotAlg('shoujialser')
	plotAlg('sneaky')
	plotAlg('kmers')

