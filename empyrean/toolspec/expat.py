def generate(env):
    if env['PLATFORM'] == 'win32':
        env.Append(LIBS=['libexpat'])
    else:
        env.Append(LIBS=['expat'])

def exists(env):
    return 1
