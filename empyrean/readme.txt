build/

    Empyrean is built here by the UNIX/SCons build system.

doc/

    Documentation goes here.

resources/

    Art assets, levels, other kinds of game content go here.  There is
    a build system in here (invoked with get-resources.sh) to install
    the assets into the various build directories.  This can be
    integrated into the main build system.

src/

    Source code.  See src/readme.txt.

third-party-cygwin/
third-party-vc7/

    Third-party libraries and headers.  This is so you don't have to
    compile them yourself.  Maybe this should be
    third-party/build-type/

vc7/

    The Visual Studio .NET 2003 build system goes and builds here.
