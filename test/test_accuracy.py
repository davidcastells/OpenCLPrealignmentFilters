import os
import pandas as pd

def test(name, EI, ED, ES, th, N):
	stream = os.popen('../filter-{} -pid 0 -ps 0 -EI {} -ED {} -ES {} -th {} -pl 100 -tl 100 -n {}'.format(name, EI, ED, ES, th, N))
	outStr = stream.read()
	lines = outStr.split('\n');

	#lno = 0
	#for line in lines:
	#	print('[{}]:'.format(lno), line)
	#	lno = lno+1

	accuracyLine = lines[len(lines)-2]
	parts = accuracyLine.split()
	FP = int(parts[1])
	FN = int(parts[5])
	Total = int(parts[9])

	return (EI, ED, ES, th, accuracyLine, FP, FN, Total)


def testRangeErrors(name):
	N = 100000
	ES = 0

	acur = { 'EI':[], 'ED':[], 'ES':[], 'th':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}

	for EI in range(16):
		ED = EI
		tuple = test(name, EI,ED,ES, th, N)
		acur['EI'].append(EI)
		acur['ED'].append(ED)
		acur['ES'].append(ES)
		acur['th'].append(th)
		acur['N'].append(N)		
		acur['FP'].append(tuple[5])
		acur['FN'].append(tuple[6])
		acur['Total'].append(tuple[7])
		
	df = pd.DataFrame(acur, columns=['EI','ED','ES','th','N','FP','FN','Total'])
	print('{} Insertion/Deletion Errors'.format(name))
	print(df)

	acur = { 'EI':[], 'ED':[], 'ES':[], 'th':[], 'N':[], 'FP':[], 'FN':[], 'Total':[]}

	EI = 0
	ED = 0
	for ES in range(16):
		tuple = test(name, EI,ED,ES, th, N)
		acur['EI'].append(EI)
		acur['ED'].append(ED)
		acur['ES'].append(ES)
		acur['th'].append(th)
		acur['N'].append(N)		
		acur['FP'].append(tuple[5])
		acur['FN'].append(tuple[6])
		acur['Total'].append(tuple[7])
		
	df = pd.DataFrame(acur, columns=['EI','ED','ES','th','N','FP','FN','Total'])
	print('{} Substitution Errors'.format(name))
	print(df)

def select(name, variant, board):
	os.system('cd ../fpga/; rm -f {}.aocx'.format(name))
	os.system('cd ../fpga/; ln -s {}/{}_{}.aocx {}.aocx'.format(board, name, variant, name))

# @todo change to the board in use accordingly
board = 'DE5NET'
th = 5


select('shd', '{}_100_100'.format(th), board)
select('shouji', '{}_100_100'.format(th), board)
select('sneaky', '{}_100_100'.format(th), board)
select('kmers', '100_100', board)

#testRangeErrors('shd')
#testRangeErrors('shouji')
testRangeErrors('sneaky')
#testRangeErrors('kmers')
