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


def ParseConfig(env, command, options):
    # Run the command
    where = CachedWhereIs(command)
    if not where:
        raise SCons.Errors.UserError, ('%s not found in PATH' % command)

    env.ParseConfig(where + ' ' + string.join(options))
