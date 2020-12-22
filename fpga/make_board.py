import os


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

def makeAocx(aocx, cl, threshold=-1, pattern_len=-1, text_len=-1):
    if (isCompiling(aocx, cl)):
        print('Already compiling ' + aocx)
        return
    if (isCompiled(aocx, cl)):
        print('Already compiled ' + aocx)
        return

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

    nohup = 'nohup'
    outlog = ' >> compile.' + design_name + '.out'
    cmd = nohup + ' aoc '+common_flags + threshold_flag + item_flags+cl+' -o '+aocx + outlog + '&'
    print(cmd)
    os.system('echo "'+cmd+'" > compile.' + design_name + '.out')
    os.system(cmd)
    


