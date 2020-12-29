import os

gCompiled = 0
gCompiling = 0
gStarted = 0

gOnFlyMax = 4

def modified_date(path_to_file):
    stat = os.stat(path_to_file)
    return stat.st_mtime

def withoutExtension(file):
    part = file.split('.')
    return part[0]

def isCompiling(aocx, cl):
    stream = os.popen('ps -ef')
    outStr = stream.read()
    return (aocx in outStr)

def isCompiled(aocx, cl):

    if (os.path.exists(aocx) == False):
        print(aocx + ' is not compiled')
        return False

    aocx_date = modified_date(aocx)
    cl_date = modified_date(cl)
    if (aocx_date > cl_date):
        return True

def designConstant(aocx):
    part = aocx.split('_')
    return part[0].upper()

def system(cmd):
    print(cmd)
    os.system(cmd)

def metaprogram(dsg, level='', flags=''):
    cl = '{}.cl'.format(dsg)
    cl_generator = '/tmp/{}.cl.generator'.format(dsg)
    cl_generator_cpp = cl_generator +'.cpp'
    meta = '{}{}.cl.metaprogram'.format(dsg, level)

    system('../metagenerator ../{} > {}'.format(meta, cl_generator_cpp))
    system('g++ {} {} -o {}'.format(cl_generator_cpp, flags, cl_generator))
    system('{} > ../{}'.format(cl_generator, cl))

def makeAocx(aocx, cl, threshold=-1, pattern_len=-1, text_len=-1, entry_type=0, extra_flags='', blocking=False, ignoretargets=[]):
    global gCompiling
    global gCompiled
    global gStarted

    if (aocx in ignoretargets):
        print(aocx, 'in ignore list')
        return

    if (isCompiling(aocx, cl)):
        print('Already compiling ' + aocx)
        gCompiling = gCompiling + 1
        return
    if (isCompiled(aocx, cl)):
        print('Already compiled ' + aocx)
        gCompiled = gCompiled + 1
        return

    if ((gCompiling + gStarted) > gOnFlyMax and blocking == False):
        print('concurrent works limit reached')
        return

    entry_type_flags = ' -D ENTRY_TYPE_{} '.format(entry_type)
    common_flags = '-D BASIC_AP_UINT -I $INTELFPGAOCLSDKROOT/include/kernel_headers -g'
    design_name = withoutExtension(aocx)

    if (threshold >= 0):
        threshold_flag = ' -D ' + designConstant(aocx) + '_THRESHOLD={}'.format(threshold)
    else:
        threshold_flag = ' '

    if (pattern_len > 0):
        item_flags = ' -D PATTERN_LEN={} -D TEXT_LEN={} '.format(pattern_len, text_len)
    else:
        item_flags = ' '

    if (blocking):
        nohup = ''
        noblocksuffix = ''
    else:
        nohup = 'nohup'
        noblocksuffix = '&'
    outlog = ' >> compile.' + design_name + '.out'
    cmd = nohup + ' aoc '+common_flags + threshold_flag + entry_type_flags + extra_flags + item_flags+cl+' -o '+aocx + outlog + noblocksuffix
    print(cmd)
    os.system('echo "'+cmd+'" > compile.' + design_name + '.out')
    os.system(cmd)

    gStarted = gStarted + 1



def makeVariants(BOARD, AOCL_FLAGS, ths= [[3,5,7],[3,7,10],[5,10,15]], lens = [100,150,300], entry_types = [0,1,2], blocking=False, ignoretargets=[]):
   for i in range(len(lens)):
      plen = lens[i]
      et = entry_types[i]

      for th in ths[i]:
         for dsg in ['shd','shouji','sneaky']:
            makeAocx(aocx='{}_e{}_{}_{}_{}.aocx'.format(dsg, et,th, plen, plen), cl='../{}.cl'.format(dsg), threshold=th, pattern_len=plen, text_len=plen, extra_flags=AOCL_FLAGS, entry_type=et, blocking=blocking, ignoretargets=ignoretargets)

      makeAocx(aocx='kmers_e{}_{}_{}.aocx'.format(et,plen,plen), cl='../kmers.cl', threshold=-1, pattern_len=plen, text_len=plen, extra_flags=AOCL_FLAGS, entry_type=et, blocking=blocking, ignoretargets=ignoretargets) 
      makeAocx(aocx='kmers_e{}_var.aocx'.format(et), cl='../kmers.cl', extra_flags=AOCL_FLAGS, entry_type=et, blocking=blocking, ignoretargets=ignoretargets)

   print('SUMMARY: Compiled:' , gCompiled, 'Compiling:', gCompiling, 'Started', gStarted);


