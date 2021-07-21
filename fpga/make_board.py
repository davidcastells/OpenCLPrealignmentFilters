import os

gCompiled = 0
gCompiling = 0
gStarted = 0

gOnFlyMax = 5

def getInfo():
    info = {
                'DE5NET': {'flow':'aoc'},
                'OSK' :   {'flow':'aoc'},
                'HARP' :   {'flow':'aoc'},
                'PAC10' :   {'flow':'aoc'},
                'PACS10' :   {'flow':'aoc'},
		'U50' : {'flow':'vitis'},
		'AWSF1' : { 'flow':'vitis'}
    }
    return info


def modified_date(path_to_file):
    stat = os.stat(path_to_file)
    return stat.st_mtime

def withoutExtension(file):
    part = file.split('.')
    return part[0]

def isCompiling(aocx):
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

def getAoco(aocx):
    part = aocx.split('.aocx')
    return part[0] + '.aoco'

def aocoExist(aocx):
    aoco = getAoco(aocx)
    if (os.path.exists(aoco) == True):
        print('AOCO file found ' , aoco)
        return True
    else:
        return False


def designConstant(aocx):
    part = aocx.split('_')
    return part[0].upper()

def system(cmd):
    print(cmd)
    os.system(cmd)

def metaprogram(dsg,  meta=None, level='', cl=None, flags=''):
    if (cl == None):
       cl = '../{}.cl'.format(dsg)
    cl_generator = '/tmp/{}.cl.generator'.format(dsg)
    cl_generator_cpp = cl_generator +'.cpp'
    if (meta == None):
       meta = '../{}{}.cl.metaprogram'.format(dsg, level)

    if (isCompiled(cl, meta)):
        print('Skipping metaprogramming. {} already metaprogrammed'.format(cl))
        return

    system('../metagenerator {} > {}'.format(meta, cl_generator_cpp))
    system('g++ {} {} -o {}'.format(cl_generator_cpp, flags, cl_generator))
    system('{} > {}'.format(cl_generator, cl))

def makeAocx(aocx, cl, threshold=-1, pattern_len=-1, text_len=-1, entry_type=0, extra_flags='', blocking=False, ignoretargets=[], meta=None):
    global gCompiling
    global gCompiled
    global gStarted

    if (meta == None):
        filedate = meta
    else:
        filedate = cl

    if (aocx in ignoretargets):
        print(aocx, 'in ignore list')
        return

    if (isCompiling(aocx)):
        print('Already compiling ' + aocx)
        gCompiling = gCompiling + 1
        return
    if (isCompiled(aocx, filedate)):
        print('Already compiled ' + aocx)
        gCompiled = gCompiled + 1
        return

    if ((gCompiling + gStarted) > gOnFlyMax and blocking == False):
        print('concurrent works limit reached')
        return

    if (aocoExist(aocx)):
        cl = getAoco(aocx)

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


def makeVitisXo(aocx, cl, threshold=-1, pattern_len=-1, text_len=-1, entry_type=0, extra_flags='', blocking=False, ignoretargets=[], meta=None):
    global gCompiling
    global gCompiled
    global gStarted

    if (meta == None):
        filedate = meta
    else:
        filedate = cl

    if (aocx in ignoretargets):
        print(aocx, 'in ignore list')
        return

    if (isCompiling(aocx)):
        print('Already compiling ' + aocx)
        gCompiling = gCompiling + 1
        return
    if (isCompiled(aocx, filedate)):
        print('Already compiled ' + aocx)
        gCompiled = gCompiled + 1
        return

    if ((gCompiling + gStarted) > gOnFlyMax and blocking == False):
        print('concurrent works limit reached')
        return

    if (aocoExist(aocx)):
        cl = getAoco(aocx)

    entry_type_flags = ' -D ENTRY_TYPE_{} '.format(entry_type)
    common_flags = '--save-temps -D BASIC_AP_UINT --platform xilinx_u200_xdma_201830_2  -g'
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
    cmd = nohup + ' v++ '+common_flags + threshold_flag + entry_type_flags + extra_flags + item_flags+cl+' -o '+aocx + outlog + noblocksuffix
    print(cmd)
    os.system('echo "'+cmd+'" > compile.' + design_name + '.out')
    os.system(cmd)

    gStarted = gStarted + 1


def makeVariants(BOARD, AOCL_FLAGS, ths=[[3,5,7],[3,7,10],[5,10,15]], lens=[100,150,300], entry_types=[0,1,2], blocking=False, ignoretargets=[]):
   for i in range(len(lens)):
      plen = lens[i]
      et = entry_types[i]

      for th in ths[i]:
         for dsg in ['shd','shouji','sneaky']:
            makeAocx(aocx='{}_e{}_{}_{}_{}.aocx'.format(dsg, et,th, plen, plen), cl='../{}.cl'.format(dsg), threshold=th, pattern_len=plen, text_len=plen, extra_flags=AOCL_FLAGS, entry_type=et, blocking=blocking, ignoretargets=ignoretargets)

      makeAocx(aocx='kmers_e{}_{}_{}.aocx'.format(et,plen,plen), cl='../kmers.cl', threshold=-1, pattern_len=plen, text_len=plen, extra_flags=AOCL_FLAGS, entry_type=et, blocking=blocking, ignoretargets=ignoretargets) 
      makeAocx(aocx='kmers_e{}_var.aocx'.format(et), cl='../kmers.cl', extra_flags=AOCL_FLAGS, entry_type=et, blocking=blocking, ignoretargets=ignoretargets)

   print('SUMMARY: Compiled:' , gCompiled, 'Compiling:', gCompiling, 'Started', gStarted);



def makeMetaVariants(BOARD, AOCL_FLAGS, blocking=False):

   info = getInfo()[BOARD]

   if (info['flow'] == 'aoc'):
       makeMetaVariantsAoc(BOARD, AOCL_FLAGS, blocking)
   else:
       makeMetaVariantsVitis(BOARD, AOCL_FLAGS, blocking)


def makeMetaVariantsAoc(BOARD, AOCL_FLAGS, blocking=False):

   print('COMPILING SHD for {}:'.format(BOARD));

   dsg = 'shd'
   meta = '../shd.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='shd_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHD_THRESHOLD=3')
   metaprogram(dsg, meta=meta, cl='shd_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHD_THRESHOLD=5')
   metaprogram(dsg, meta=meta, cl='shd_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHD_THRESHOLD=7')

   makeAocx(aocx='shd_e0_3_100_100.aocx', cl='shd_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e0_5_100_100.aocx', cl='shd_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e0_7_100_100.aocx', cl='shd_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shd_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=3')
   metaprogram(dsg, meta=meta, cl='shd_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=7')
   metaprogram(dsg, meta=meta, cl='shd_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=10')

   makeAocx(aocx='shd_e1_3_150_150.aocx', cl='shd_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e1_7_150_150.aocx', cl='shd_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e1_10_150_150.aocx', cl='shd_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shd_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHD_THRESHOLD=5')
   metaprogram(dsg, meta=meta, cl='shd_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHD_THRESHOLD=10')
   metaprogram(dsg, meta=meta, cl='shd_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHD_THRESHOLD=15')

   makeAocx(aocx='shd_e2_5_300_300.aocx', cl='shd_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e2_10_300_300.aocx', cl='shd_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e2_15_300_300.aocx', cl='shd_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)


   print('COMPILING SHOUJI for {}:'.format(BOARD));

   dsg = 'shouji'
   meta = '../shouji.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='shouji_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHOUJI_THRESHOLD=3 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='shouji_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHOUJI_THRESHOLD=5 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='shouji_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHOUJI_THRESHOLD=7 -D PATTERN_LEN=100')

   makeAocx(aocx='shouji_e0_3_100_100.aocx', cl='shouji_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e0_5_100_100.aocx', cl='shouji_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e0_7_100_100.aocx', cl='shouji_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shouji_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHOUJI_THRESHOLD=3 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='shouji_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHOUJI_THRESHOLD=7 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='shouji_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHOUJI_THRESHOLD=10 -D PATTERN_LEN=150')

   makeAocx(aocx='shouji_e1_3_150_150.aocx', cl='shouji_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e1_7_150_150.aocx', cl='shouji_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e1_10_150_150.aocx', cl='shouji_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shouji_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHOUJI_THRESHOLD=5 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='shouji_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHOUJI_THRESHOLD=10 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='shouji_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHOUJI_THRESHOLD=15 -D PATTERN_LEN=300')

   makeAocx(aocx='shouji_e2_5_300_300.aocx', cl='shouji_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e2_10_300_300.aocx', cl='shouji_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e2_15_300_300.aocx', cl='shouji_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)

   print('COMPILING SNEAKY for {}:'.format(BOARD));

   dsg = 'sneaky'
   meta = '../sneaky_level_2.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='sneaky_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D SNEAKY_THRESHOLD=3 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='sneaky_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D SNEAKY_THRESHOLD=5 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='sneaky_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D SNEAKY_THRESHOLD=7 -D PATTERN_LEN=100')

   makeAocx(aocx='sneaky_e0_3_100_100.aocx', cl='sneaky_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e0_5_100_100.aocx', cl='sneaky_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e0_7_100_100.aocx', cl='sneaky_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)


   metaprogram(dsg, meta=meta, cl='sneaky_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=3 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='sneaky_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=7 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='sneaky_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=10 -D PATTERN_LEN=150')

   makeAocx(aocx='sneaky_e1_3_150_150.aocx', cl='sneaky_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e1_7_150_150.aocx', cl='sneaky_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e1_10_150_150.aocx', cl='sneaky_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)


   metaprogram(dsg, meta=meta, cl='sneaky_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D SNEAKY_THRESHOLD=5 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='sneaky_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D SNEAKY_THRESHOLD=10 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='sneaky_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D SNEAKY_THRESHOLD=15 -D PATTERN_LEN=300')

   makeAocx(aocx='sneaky_e2_5_300_300.aocx', cl='sneaky_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e2_10_300_300.aocx', cl='sneaky_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e2_15_300_300.aocx', cl='sneaky_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)

   print('COMPILING KMERS for {}:'.format(BOARD));

   dsg = 'kmers'
   meta = '../kmers.cl'

   metaprogram(dsg, meta=meta, cl='kmers_e0_100_100.cl', flags='-D ENTRY_TYPE_0 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='kmers_e1_150_150.cl', flags='-D ENTRY_TYPE_1 -D PATTERN_LEN=150')
   
   makeAocx(aocx='kmers_e0_100_100.aocx', cl='kmers_e0_100_100.cl', threshold=-1, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='kmers_e1_150_150.aocx', cl='kmers_e1_150_150.cl', threshold=-1, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   dsg = 'kmers'
   meta = '../kmers_entry2.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='kmers_e2_300_300.cl', flags='-D ENTRY_TYPE_2 -D PATTERN_LEN=300')
   
   makeAocx(aocx='kmers_e2_300_300.aocx', cl='kmers_e2_300_300.cl', threshold=-1, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   
   print('SUMMARY: Compiled:' , gCompiled, 'Compiling:', gCompiling, 'Started', gStarted);



def makeMetaVariantsVitis(BOARD, AOCL_FLAGS, blocking=False):

   print('COMPILING SHD for {}:'.format(BOARD));

   dsg = 'shd'
   meta = '../shd.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='shd_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHD_THRESHOLD=3')
   metaprogram(dsg, meta=meta, cl='shd_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHD_THRESHOLD=5')
   metaprogram(dsg, meta=meta, cl='shd_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHD_THRESHOLD=7')

   makeVitisXo(aocx='shd_e0_3_100_100.xo', cl='shd_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e0_5_100_100.xo', cl='shd_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e0_7_100_100.xo', cl='shd_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shd_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=3')
   metaprogram(dsg, meta=meta, cl='shd_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=7')
   metaprogram(dsg, meta=meta, cl='shd_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=10')

   makeAocx(aocx='shd_e1_3_150_150.xo', cl='shd_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e1_7_150_150.xo', cl='shd_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e1_10_150_150.xo', cl='shd_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shd_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHD_THRESHOLD=5')
   metaprogram(dsg, meta=meta, cl='shd_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHD_THRESHOLD=10')
   metaprogram(dsg, meta=meta, cl='shd_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHD_THRESHOLD=15')

   makeAocx(aocx='shd_e2_5_300_300.xo', cl='shd_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e2_10_300_300.xo', cl='shd_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e2_15_300_300.xo', cl='shd_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)


   print('COMPILING SHOUJI for {}:'.format(BOARD));

   dsg = 'shouji'
   meta = '../shouji.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='shouji_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHOUJI_THRESHOLD=3 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='shouji_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHOUJI_THRESHOLD=5 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='shouji_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D SHOUJI_THRESHOLD=7 -D PATTERN_LEN=100')

   makeAocx(aocx='shouji_e0_3_100_100.xo', cl='shouji_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e0_5_100_100.xo', cl='shouji_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e0_7_100_100.xo', cl='shouji_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shouji_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHOUJI_THRESHOLD=3 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='shouji_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHOUJI_THRESHOLD=7 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='shouji_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D SHOUJI_THRESHOLD=10 -D PATTERN_LEN=150')

   makeAocx(aocx='shouji_e1_3_150_150.xo', cl='shouji_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e1_7_150_150.xo', cl='shouji_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e1_10_150_150.xo', cl='shouji_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='shouji_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHOUJI_THRESHOLD=5 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='shouji_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHOUJI_THRESHOLD=10 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='shouji_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D SHOUJI_THRESHOLD=15 -D PATTERN_LEN=300')

   makeAocx(aocx='shouji_e2_5_300_300.xo', cl='shouji_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e2_10_300_300.xo', cl='shouji_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='shouji_e2_15_300_300.xo', cl='shouji_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)

   print('COMPILING SNEAKY for {}:'.format(BOARD));

   dsg = 'sneaky'
   meta = '../sneaky_level_2.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='sneaky_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D SNEAKY_THRESHOLD=3 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='sneaky_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D SNEAKY_THRESHOLD=5 -D PATTERN_LEN=100')
   metaprogram(dsg, meta=meta, cl='sneaky_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D SNEAKY_THRESHOLD=7 -D PATTERN_LEN=100')

   makeAocx(aocx='sneaky_e0_3_100_100.xo', cl='sneaky_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e0_5_100_100.xo', cl='sneaky_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e0_7_100_100.xo', cl='sneaky_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)


   metaprogram(dsg, meta=meta, cl='sneaky_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=3 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='sneaky_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=7 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='sneaky_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=10 -D PATTERN_LEN=150')

   makeAocx(aocx='sneaky_e1_3_150_150.xo', cl='sneaky_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e1_7_150_150.xo', cl='sneaky_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e1_10_150_150.xo', cl='sneaky_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)


   metaprogram(dsg, meta=meta, cl='sneaky_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D SNEAKY_THRESHOLD=5 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='sneaky_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D SNEAKY_THRESHOLD=10 -D PATTERN_LEN=300')
   metaprogram(dsg, meta=meta, cl='sneaky_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D SNEAKY_THRESHOLD=15 -D PATTERN_LEN=300')

   makeAocx(aocx='sneaky_e2_5_300_300.xo', cl='sneaky_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e2_10_300_300.xo', cl='sneaky_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='sneaky_e2_15_300_300.xo', cl='sneaky_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)

   print('COMPILING KMERS for {}:'.format(BOARD));

   dsg = 'kmers'
   meta = '../kmers.cl'

   metaprogram(dsg, meta=meta, cl='kmers_e0_100_100.cl', flags='-D ENTRY_TYPE_0 -D PATTERN_LEN=150')
   metaprogram(dsg, meta=meta, cl='kmers_e1_150_150.cl', flags='-D ENTRY_TYPE_1 -D PATTERN_LEN=150')
   
   makeAocx(aocx='kmers_e0_100_100.xo', cl='kmers_e0_100_100.cl', threshold=-1, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='kmers_e1_150_150.xo', cl='kmers_e1_150_150.cl', threshold=-1, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   dsg = 'kmers'
   meta = '../kmers_entry2.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='kmers_e2_300_300.cl', flags='-D ENTRY_TYPE_2 -D PATTERN_LEN=300')
   
   makeAocx(aocx='kmers_e2_300_300.xo', cl='kmers_e2_300_300.cl', threshold=-1, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   
   print('SUMMARY: Compiled:' , gCompiled, 'Compiling:', gCompiling, 'Started', gStarted);


def makeSemiglobalVariants(BOARD, AOCL_FLAGS, blocking=False):

   print('COMPILING Semiglobal SHD for {}:'.format(BOARD));

   dsg = 'shd'
   meta = '../shd_semiglobal.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='shd_e1_7_100_110.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=110')
   metaprogram(dsg, meta=meta, cl='shd_e1_7_100_140.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=140')
   metaprogram(dsg, meta=meta, cl='shd_e1_7_100_180.cl', flags='-D ENTRY_TYPE_1 -D SHD_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=180')
   
   makeAocx(aocx='shd_e1_7_100_110.aocx', cl='shd_e1_7_100_110.cl', threshold=7, pattern_len=100, text_len=110, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e1_7_100_140.aocx', cl='shd_e1_7_100_140.cl', threshold=7, pattern_len=100, text_len=140, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='shd_e1_7_100_180.aocx', cl='shd_e1_7_100_180.cl', threshold=7, pattern_len=100, text_len=180, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   #dsg = 'sneaky'
   #meta = '../sneaky_semiglobal.cl.metaprogram'

   #metaprogram(dsg, meta=meta, cl='sneaky_e1_7_100_110.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=110')
   #metaprogram(dsg, meta=meta, cl='sneaky_e1_7_100_140.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=140')
   #metaprogram(dsg, meta=meta, cl='sneaky_e1_7_100_180.cl', flags='-D ENTRY_TYPE_1 -D SNEAKY_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=180')
   
   #makeAocx(aocx='sneaky_e1_7_100_110.aocx', cl='sneaky_e1_7_100_110.cl', threshold=7, pattern_len=100, text_len=110, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   #makeAocx(aocx='sneaky_e1_7_100_140.aocx', cl='sneaky_e1_7_100_140.cl', threshold=7, pattern_len=100, text_len=140, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   #makeAocx(aocx='sneaky_e1_7_100_180.aocx', cl='sneaky_e1_7_100_180.cl', threshold=7, pattern_len=100, text_len=180, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   dsg = 'kmers'
   meta = '../kmers.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='kmers_e1_100_180.cl', flags='-D ENTRY_TYPE_1 -D PATTERN_LEN=100 -D TEXT_LEN=180')
   
   makeAocx(aocx='kmers_e1_100_180.aocx', cl='kmers_e1_100_180.cl', threshold=-1, pattern_len=100, text_len=180, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)



def makeLev(BOARD, AOCL_FLAGS, blocking=False):

   print('COMPILING Lev {}:'.format(BOARD));

   dsg = 'lev'
   meta = '../lev_v4.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='lev_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D LEV_THRESHOLD=3 -D PATTERN_LEN=100 -D TEXT_LEN=100')
   metaprogram(dsg, meta=meta, cl='lev_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D LEV_THRESHOLD=5 -D PATTERN_LEN=100 -D TEXT_LEN=100')
   metaprogram(dsg, meta=meta, cl='lev_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D LEV_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=100')

   makeAocx(aocx='lev_e0_3_100_100.aocx', cl='lev_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='lev_e0_5_100_100.aocx', cl='lev_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='lev_e0_7_100_100.aocx', cl='lev_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='lev_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D LEV_THRESHOLD=3 -D PATTERN_LEN=150 -D TEXT_LEN=150')
   metaprogram(dsg, meta=meta, cl='lev_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D LEV_THRESHOLD=7 -D PATTERN_LEN=150 -D TEXT_LEN=150')
   metaprogram(dsg, meta=meta, cl='lev_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D LEV_THRESHOLD=10 -D PATTERN_LEN=150 -D TEXT_LEN=150')

   makeAocx(aocx='lev_e1_3_150_150.aocx', cl='lev_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='lev_e1_7_150_150.aocx', cl='lev_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='lev_e1_10_150_150.aocx', cl='lev_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='lev_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D LEV_THRESHOLD=5 -D PATTERN_LEN=300 -D TEXT_LEN=300')
   metaprogram(dsg, meta=meta, cl='lev_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D LEV_THRESHOLD=10 -D PATTERN_LEN=300 -D TEXT_LEN=300')
   metaprogram(dsg, meta=meta, cl='lev_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D LEV_THRESHOLD=15 -D PATTERN_LEN=300 -D TEXT_LEN=300')

   makeAocx(aocx='lev_e2_5_300_300.aocx', cl='lev_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='lev_e2_10_300_300.aocx', cl='lev_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='lev_e2_15_300_300.aocx', cl='lev_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   


def makeMyers(BOARD, AOCL_FLAGS, blocking=False):

   print('COMPILING Myers {}:'.format(BOARD));

   dsg = 'myers'
   meta = '../myers_v1.cl.metaprogram'

   metaprogram(dsg, meta=meta, cl='myers_e0_3_100_100.cl', flags='-D ENTRY_TYPE_0 -D MYERS_THRESHOLD=3 -D PATTERN_LEN=100 -D TEXT_LEN=100')
   metaprogram(dsg, meta=meta, cl='myers_e0_5_100_100.cl', flags='-D ENTRY_TYPE_0 -D MYERS_THRESHOLD=5 -D PATTERN_LEN=100 -D TEXT_LEN=100')
   metaprogram(dsg, meta=meta, cl='myers_e0_7_100_100.cl', flags='-D ENTRY_TYPE_0 -D MYERS_THRESHOLD=7 -D PATTERN_LEN=100 -D TEXT_LEN=100')

   makeAocx(aocx='myers_e0_3_100_100.aocx', cl='myers_e0_3_100_100.cl', threshold=3, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='myers_e0_5_100_100.aocx', cl='myers_e0_5_100_100.cl', threshold=5, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)
   makeAocx(aocx='myers_e0_7_100_100.aocx', cl='myers_e0_7_100_100.cl', threshold=7, pattern_len=100, text_len=100, extra_flags=AOCL_FLAGS, entry_type=0, blocking=blocking, meta=meta)


   metaprogram(dsg, meta=meta, cl='myers_e1_3_150_150.cl', flags='-D ENTRY_TYPE_1 -D MYERS_THRESHOLD=3 -D PATTERN_LEN=150 -D TEXT_LEN=150')
   metaprogram(dsg, meta=meta, cl='myers_e1_7_150_150.cl', flags='-D ENTRY_TYPE_1 -D MYERS_THRESHOLD=7 -D PATTERN_LEN=150 -D TEXT_LEN=150')
   metaprogram(dsg, meta=meta, cl='myers_e1_10_150_150.cl', flags='-D ENTRY_TYPE_1 -D MYERS_THRESHOLD=10 -D PATTERN_LEN=150 -D TEXT_LEN=150')

   makeAocx(aocx='myers_e1_3_150_150.aocx', cl='myers_e1_3_150_150.cl', threshold=3, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='myers_e1_7_150_150.aocx', cl='myers_e1_7_150_150.cl', threshold=7, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)
   makeAocx(aocx='myers_e1_10_150_150.aocx', cl='myers_e1_10_150_150.cl', threshold=10, pattern_len=150, text_len=150, extra_flags=AOCL_FLAGS, entry_type=1, blocking=blocking, meta=meta)

   metaprogram(dsg, meta=meta, cl='myers_e2_5_300_300.cl', flags='-D ENTRY_TYPE_2 -D MYERS_THRESHOLD=5 -D PATTERN_LEN=300 -D TEXT_LEN=300')
   metaprogram(dsg, meta=meta, cl='myers_e2_10_300_300.cl', flags='-D ENTRY_TYPE_2 -D MYERS_THRESHOLD=10 -D PATTERN_LEN=300 -D TEXT_LEN=300')
   metaprogram(dsg, meta=meta, cl='myers_e2_15_300_300.cl', flags='-D ENTRY_TYPE_2 -D MYERS_THRESHOLD=15 -D PATTERN_LEN=300 -D TEXT_LEN=300')

   makeAocx(aocx='myers_e2_5_300_300.aocx', cl='myers_e2_5_300_300.cl', threshold=5, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='myers_e2_10_300_300.aocx', cl='myers_e2_10_300_300.cl', threshold=10, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)
   makeAocx(aocx='myers_e2_15_300_300.aocx', cl='myers_e2_15_300_300.cl', threshold=15, pattern_len=300, text_len=300, extra_flags=AOCL_FLAGS, entry_type=2, blocking=blocking, meta=meta)


def makeBpc(BOARD, AOCL_FLAGS, blocking=False):

   print('COMPILING Myers {}:'.format(BOARD));

   dsg = 'bpc'
   meta = '../bpc_v1.cl.metaprogram'

   for erate in  [0.03, 0.05, 0.1]:
       for pl in  [100,200,300]:
         #erate = 0.1
         #pl = 100
         th = int(pl * erate) 
         tl = pl + 2*th

         total = pl + tl 
         if ((total + 2) < (512//2)):
            etype = 0
         elif (pl < (512//2) and tl < (512//2)):
            etype = 1
         elif (pl < (1024//2) and tl < (1024//2)):
            etype = 2
         else:
            raise Exception('total = {} pl: {} tl: {}'.format(total, pl, tl))

         print('Total length ={}'.format(total))

         cl = 'bpc_e{}_{}_{}_{}.cl'.format(etype, th, pl, tl)
         aocx = 'bpc_e{}_{}_{}_{}.aocx'.format(etype, th, pl, tl)
         flags='-D ENTRY_TYPE_{} -D BPC_THRESHOLD={} -D PATTERN_LEN={} -D TEXT_LEN={}'.format(etype, th,pl, tl)
         metaprogram(dsg, meta=meta, cl=cl, flags=flags)

         makeAocx(aocx=aocx, cl=cl, threshold=th, pattern_len=pl, text_len=tl, extra_flags=AOCL_FLAGS, entry_type=etype, blocking=blocking, meta=meta)




