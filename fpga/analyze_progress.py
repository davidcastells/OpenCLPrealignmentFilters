import os
import re

def getCompilationProgress(file):
	phases = {}
	seconds = -1

	if not(os.path.exists(file)):
		phases['seconds'] = 0
		return phases;

	file = open(file)
	lines = file.readlines()
	for line in lines:
		if 'Total elapsed' in line:
			part = line.split(':')
			part = re.split('h |m |s', part[2])
			seconds = int(part[0])*3600+int(part[1])*60+int(part[2])


	phases['seconds'] = seconds

	return phases;

def getTimestampSeconds(line):
	part = line.split('[')[1].split(']')
	part = part[0].split(':')
	return int(part[0])*3600 + int(part[1])*60 + int(part[2])

def toHour(seconds):
    shour = seconds // 3600
    seconds = seconds - shour*3600
    sminute = seconds // 60
    seconds = seconds - sminute*60
    return '{}:{:02d}:{:02d}'.format(shour, sminute, seconds)

def getLinkProgress(file):
	seconds = -1
	t0 = 0
	phases = {}

	if not(os.path.exists(file)):
		phases['seconds'] = 0
		return phases;

	file = open(file)
	lines = file.readlines()
	for line in lines:
		if 'Total elapsed' in line:
			part = line.split(':')
			part = re.split('h |m |s', part[2])
			seconds = int(part[0])*3600+int(part[1])*60+int(part[2])
		if 'create_project: Started' in line:
			t0 = getTimestampSeconds(line)
			phases['PH0-Start']= 0
		if 'Finished' in line:
			if 'linking' in line:
				phases['PH1-Merge'] = getTimestampSeconds(line) - t0
				phases['EET'] = toHour(t0 + int(phases['PH1-Merge']/0.25))
			if 'optimization' in line:
				phases.pop('EET')
				phases['PH2-Opt'] = getTimestampSeconds(line) - t0
				phases['EET'] = toHour(t0 + int(phases['PH2-Opt']/0.3))
			if 'placement' in line:
				phases.pop('EET')
				phases['PH3-Plc'] = getTimestampSeconds(line) - t0
				phases['EET'] = toHour(t0 + int(phases['PH3-Plc']/0.58))
			if 'routing' in line:
				phases.pop('EET')
				phases['PH4-Rou'] = getTimestampSeconds(line) - t0
				phases['EET'] = toHour(t0 + int(phases['PH4-Rou']/0.72))
			
	phases['seconds'] = seconds
	return phases;




lens = [100,150,300]
ths = [[3,5,7], [3,7,10], [5,10,15]]

for dsg in ['shd', 'shouji', 'sneaky','lev', 'myers']:
	print(dsg.upper())
	for et in range(3):
		le = lens[et]
		for th in ths[et]:
			dsgf = '{}_e{}_{}_{}_{}'.format(dsg, et, th, le, le)
			compileFile = 'compile.{}.out'.format(dsgf)
			linkFile = 'link.{}.out'.format(dsgf)
			compilation = getCompilationProgress(compileFile)
			if compilation:
				linking = getLinkProgress(linkFile)



			cs = compilation['seconds']
			ls = linking['seconds']

			extra = ''
			if (cs == 0):
				extra = extra + ' NOT COMPILED'			
			if (ls == 0):
				extra = extra + ' NOT LINKED'
			if (ls == -1):
				extra = linking
				extra.pop('seconds')
			
			print('et: {} th: {} len: {} compilation: {} linking: {} TOTAL: {} ({})'.format(et, th, le, cs, ls, cs+ls, toHour(cs+ls)), extra)
