import os
import string
import SCons.Errors
import SCons.Util

_cache = {}
def CachedWhereIs(command):
    if command in _cache.keys():
        return _cache[command]

    where = SCons.Util.WhereIs(command)
    if where:
        print "ParseConfig:", str(command), "found at", where
    else:
        print "ParseConfig:", str(command), "not found in PATH"
    _cache[command] = where
    return where


# Courtesy of Ben Scott
def ParseConfig(env, command, options):
    "Parses xxx-config style output for compilation directives"

    if env['PLATFORM'] == 'darwin':
        return env.ParseConfig(string.join([command] + options))

    # Run the command
    where = CachedWhereIs(command)
    if not where:
        raise SCons.Errors.UserError, ('%s not found in PATH' % command)

    cmd = where + ' ' + string.join(options)
    params = string.split(os.popen(cmd).read())

    # Parse its output
    for arg in params:
        switch = arg[0:1]
        option = arg[1:2]
        if switch == '-':
            if option == 'I':
                env.Append(CPPPATH = [arg[2:]])
            elif option == 'L':
                env.Append(LIBPATH = [arg[2:]])
            elif option == 'l':
                env.Append(LIBS = [arg[2:]])
            elif arg[0:4] == '-Wl,':
                env.Append(LINKFLAGS = [arg])
            else:
                env.Append(CCFLAGS = [arg])
        else:
            # Must be a static library, add it to the libs
            # XXX think about this more...
            env.Append(LIBS = [arg])


