import SCons.Errors
from ToolCommon import *

def generate(env):
    try:
        ParseConfig(env, 'audiere-config', ['--cxxflags', '--libs'])
    except SCons.Errors.UserError, e:
        env.Append(LIBS=['audiere'])

    if env['PLATFORM'] == 'cygwin':
        env.Append(CPPDEFINES = ['ADR_CALL=', 'ADR_DECL='])

def exists(env):
    return 1
