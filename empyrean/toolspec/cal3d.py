def generate(env):
    env.Append(LIBS=['cal3d', 'm'])
    if env['PLATFORM'] == 'cygwin':
        env.Append(CPPDEFINES=['CAL3D_API='])

def exists(env):
    return 1
