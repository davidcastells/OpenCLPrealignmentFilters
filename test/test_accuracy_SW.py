import os
import pandas as pd

def test(name, EI, ED, ES, th, N):
	cmd = '../filter-{} -ps 0 -EI {} -ED {} -ES {} -th {} -pl 100 -tl 100 -n {}'.format(name, EI, ED, ES, th, N)
	print(cmd)
	stream = os.popen(cmd)
	outStr = stream.read()
	lines = outStr.split('\n');

	#lno = 0
	#for line in lines:
	#	print('[{}]:'.format(lno), line)
	#	lno = lno+1

	accuracyLine = lines[len(lines)-2]
	
	#print('Accuracy Line:', accuracyLine);

	parts = accuracyLine.split()
	FP = int(parts[1])
	FN = int(parts[5])
	Total = int(parts[9])

	return (EI, ED, ES, th, accuracyLine, FP, FN, Total)


def testRangeErrors(gdf, name):
	N = 1000
	ES = 0

	acur = { 'Alg':[], 'EI':[], 'ED':[], 'ES':[], 'th':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}

	for EI in range(16):
		ED = EI
		tuple = test(name, EI,ED,ES, th, N)
		acur['Alg'].append(name)
		acur['EI'].append(EI)
		acur['ED'].append(ED)
		acur['ES'].append(ES)
		acur['th'].append(th)
		acur['N'].append(N)		
		acur['FP'].append(tuple[5])
		acur['FN'].append(tuple[6])
		acur['Total'].append(tuple[7])
		
	df = pd.DataFrame(acur, columns=['Alg', 'EI','ED','ES','th','N','FP','FN','Total'])
	print('{} Insertion/Deletion Errors'.format(name))
	print(df)

	gdf = gdf.append(df);

	acur = { 'Alg':[], 'EI':[], 'ED':[], 'ES':[], 'th':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}

	EI = 0
	ED = 0
	for ES in range(16):
		tuple = test(name, EI,ED,ES, th, N)
		acur['Alg'].append(name)
		acur['EI'].append(EI)
		acur['ED'].append(ED)
		acur['ES'].append(ES)
		acur['th'].append(th)
		acur['N'].append(N)		
		acur['FP'].append(tuple[5])
		acur['FN'].append(tuple[6])
		acur['Total'].append(tuple[7])
		
	df = pd.DataFrame(acur, columns=['Alg','EI','ED','ES','th','N','FP','FN','Total'])
	print('{} Substitution Errors'.format(name))
	print(df)

	gdf = gdf.append(df);
	return gdf


th = 3

acur = { 'Alg':[], 'EI':[], 'ED':[], 'ES':[], 'th':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}
df = pd.DataFrame(acur, columns=['Alg', 'EI','ED','ES','th','N','FP','FN','Total'])

df = testRangeErrors(df, 'shd')
df = testRangeErrors(df, 'shouji')
df = testRangeErrors(df, 'sneaky')
df = testRangeErrors(df, 'kmers')

df.to_csv('results_SW.csv');
