def generate(env):
    env.Append(CPPDEFINES=['GLEW_STATIC'])
    if env['PLATFORM'] == 'cygwin':
        env.Append(LIBS = ['glu32', 'opengl32'])
    elif env['PLATFORM'] == 'darwin':
        env.Append(LIBS=['GLU', 'GL'], LIBPATH=['/usr/X11R6/lib'])
    else:
        env.Append(LIBS = ['GLU', 'GL'])

def exists(env):
    return 1
