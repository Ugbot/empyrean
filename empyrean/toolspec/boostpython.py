def generate(env):
    env.Append(CPPDEFINES=['BOOST_PYTHON_STATIC_LIB',
                           'BOOST_PYTHON_STATIC_MODULE'],
               CPPPATH=['$boostIncludes'])
    if env['PLATFORM'] == 'win32':
        if env['dbg']:
            env.Append(LIBS=['libboost_python-vc71-mt-gd'])
        else:
            env.Append(LIBS=['libboost_python-vc71-mt'])
    else:
        env.Append(LIBS=['boost_python-gcc'])

def exists(env):
    return 1
