from ToolCommon import *

def generate(env):
    args = ['--cxxflags', '--libs']
    if env['PLATFORM'] != 'cygwin':
        args.append('--gl-libs')  # special case cygwin's inconsistency
    ParseConfig(env, 'wx-config', args)

def exists(env):
    return 1
