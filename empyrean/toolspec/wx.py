from ToolCommon import *

def generate(env):
    if env['PLATFORM'] == 'win32':
        if env['dbg']:
            env.Append(LIBS=['wxmswd'])
        else:
            env.Append(LIBS=['wxmsw'])
        env.Append(LIBS=['gdi32', 'advapi32', 'comctl32', 'comdlg32',
                         'ole32', 'shell32', 'ws2_32'])
    else:
        args = ['--cxxflags', '--libs']
        if env['PLATFORM'] != 'cygwin':
            args.append('--gl-libs')  # special case cygwin's inconsistency
        ParseConfig(env, 'wx-config', args)

def exists(env):
    return 1
