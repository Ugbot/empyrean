def generate(env):
    if env['PLATFORM'] == 'win32':
        if env['dbg']:
            env.Append(LIBS=['cal3d_d'])
        else:
            env.Append(LIBS=['cal3d'])
    else:
        env.Append(LIBS=['cal3d', 'm'])
        if env['PLATFORM'] == 'cygwin':
            env.Append(CPPDEFINES=['CAL3D_API='])

def exists(env):
    return 1
