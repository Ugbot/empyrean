def generate(env):
    env.Append(CPPPATH = ['#/src'],
               LIBPATH = ['#/src/phui'],
               LIBS = ['phui'])

def exists(env):
    return 1
