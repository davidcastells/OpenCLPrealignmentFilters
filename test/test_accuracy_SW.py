import os
import pandas as pd

def test(name, EI, ED, ES, th, PL, TL, N):
	cmd = '../filter-{} -ps 0 -EI {} -ED {} -ES {} -th {} -pl {} -tl {} -n {}'.format(name, EI, ED, ES, th, PL, TL, N)
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


def testRangeErrors(gdf, name, th, baselen):
	N = 1000
	ES = 0
	EMAX = 40
	PL = baselen
	TL = baselen

	acur = { 'Alg':[], 'Test':[], 'EI':[], 'ED':[], 'ES':[], 'th':[], 'PL':[], 'TL':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}

	for EI in range(EMAX):
		ED = EI
		tuple = test(name, EI,ED,ES, th, PL, TL, N)
		acur['Alg'].append(name)
		acur['Test'].append('I')		
		acur['EI'].append(EI)
		acur['ED'].append(ED)
		acur['ES'].append(ES)
		acur['th'].append(th)
		acur['PL'].append(PL)
		acur['TL'].append(TL)
		acur['N'].append(N)		
		acur['FP'].append(tuple[5])
		acur['FN'].append(tuple[6])
		acur['Total'].append(tuple[7])
		
	df = pd.DataFrame(acur, columns=['Alg', 'Test', 'EI','ED','ES','th', 'PL', 'TL', 'N','FP','FN','Total'])
	print('{} Insertion/Deletion Errors'.format(name))
	print(df)

	gdf = gdf.append(df);

	acur = { 'Alg':[], 'Test':[], 'EI':[], 'ED':[], 'ES':[], 'th':[], 'PL':[], 'TL':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}

	EI = 0
	ED = 0
	for ES in range(EMAX):
		tuple = test(name, EI,ED,ES, th, PL, TL, N)
		acur['Alg'].append(name)
		acur['Test'].append('S')
		acur['EI'].append(EI)
		acur['ED'].append(ED)
		acur['ES'].append(ES)
		acur['th'].append(th)
		acur['PL'].append(PL)
		acur['TL'].append(TL)
		acur['N'].append(N)		
		acur['FP'].append(tuple[5])
		acur['FN'].append(tuple[6])
		acur['Total'].append(tuple[7])
		
	df = pd.DataFrame(acur, columns=['Alg', 'Test', 'EI','ED','ES','th','PL', 'TL', 'N','FP','FN','Total'])
	print('{} Substitution Errors'.format(name))
	print(df)

	gdf = gdf.append(df);
	return gdf


ths = [[3, 5, 7], [3,7,11], [5,10,15]]
baselens = [100, 150, 300]


for baselenidx in range(3):
	acur = { 'Alg':[], 'Test':[], 'EI':[], 'ED':[], 'ES':[], 'th':[], 'PL':[], 'TL':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}
	df = pd.DataFrame(acur, columns=['Alg', 'Test', 'EI','ED','ES','th','PL', 'TL', 'N','FP','FN','Total'])

	baselen = baselens[baselenidx]
	ths_len = ths[baselenidx] 
	for th in ths_len:
		df = testRangeErrors(df, 'shd', th, baselen)
		df = testRangeErrors(df, 'shouji', th, baselen)
		df = testRangeErrors(df, 'shoujialser', th, baselen)
		df = testRangeErrors(df, 'sneaky', th, baselen)
		df = testRangeErrors(df, 'kmers', th, baselen)

	df.to_csv('results_SW_{}.csv'.format(baselen));
