def generate(env):
    if env['PLATFORM'] == 'cygwin':
        env.Append(CPPDEFINES = ['GLTEXT_CALL=', 'GLTEXT_DECL='])
    env.Append(LIBS = ['gltext', 'freetype', 'z'])

def exists(env):
    return 1
