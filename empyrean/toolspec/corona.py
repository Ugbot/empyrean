import SCons.Errors
from ToolCommon import *

def generate(env):
    try:
        ParseConfig(env, 'corona-config', ['--cxxflags', '--libs'])
    except SCons.Errors.UserError, e:
        env.Append(LIBS = ['corona', 'jpeg', 'png', 'z'])

    if env['PLATFORM'] == 'cygwin':
        env.Append(CPPDEFINES = ['COR_CALL='])

def exists(env):
    return 1
