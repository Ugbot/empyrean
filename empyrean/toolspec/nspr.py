import SCons.Errors
from ToolCommon import *

def generate(env):
    if env['PLATFORM'] == 'win32':
        env.Append(LIBS=['nspr4'])
    else:
        try:
            # Try using nspr-config first.
            ParseConfig(env, 'nspr-config', ['--cflags', '--libs'])
        except SCons.Errors.UserError, e:
            import os.path
            incpaths = ['/opt/mozilla/include/nspr', '/usr/include/mozilla/nspr',
                        '/usr/include/nspr']
            libpaths = ['/opt/mozilla/lib', '/usr/lib/mozilla']
            for p in incpaths:
                if os.path.exists(p):
                    env.Append(CPPPATH=[p])
                    break
            for p in libpaths:
                if os.path.exists(p):
                    env.Append(LIBPATH=[p],LINKFLAGS=['-Wl,-rpath', p])
                    break
            env.Append(LIBS=['nspr4', 'pthread'])

def exists(env):
    return 1
