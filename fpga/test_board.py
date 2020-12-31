import os

def select(board, name, variant ):
        os.system('cd ../../fpga/; rm -f {}.aocx'.format(name))
        os.system('cd ../../fpga/; ln -s {}/{}_{}.aocx {}.aocx'.format(board, name, variant, name))

