def generate(env):
    env.Append(CPPDEFINES=['GLEW_STATIC'])
    if env['PLATFORM'] == 'cygwin':
        env.Append(LIBS = ['glu32', 'opengl32'])
    else:
        env.Append(LIBS = ['GLU', 'GL'])

def exists(env):
    return 1
