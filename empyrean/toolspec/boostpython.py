def generate(env):
    env.Append(CPPDEFINES=['BOOST_PYTHON_STATIC_LIB',
                           'BOOST_PYTHON_STATIC_MODULE'],
               CPPPATH=['$boostIncludes'],
               LIBS=['boost_python-gcc'])

def exists(env):
    return 1
