def generate(env):
    env.Append(CPPPATH = ['#/src/base'],
               LIBPATH = ['#/src/base'],
               LIBS = ['base'])

def exists(env):
    return 1
