import SCons.Errors
from ToolCommon import *

def generate(env):
    if env['PLATFORM'] == 'win32':
        env.Append(LIBS=['audiere'])
    else:
        try:
            ParseConfig(env, 'audiere-config', ['--cxxflags', '--libs'])
        except SCons.Errors.UserError, e:
            env.Append(LIBS=['audiere'])

        if env['PLATFORM'] == 'cygwin':
            env.Append(CPPDEFINES = ['ADR_CALL=', 'ADR_DECL='])

def exists(env):
    return 1
