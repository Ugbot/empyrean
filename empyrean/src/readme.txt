base/

    This is the common library that both server and client depend on.
    It has tons of stuff like smart pointers, map loading, vector
    math, texturing, threading, networking, XML parsing, etc.

    Right now, it depends on OpenGL.  That dependency might be killed
    at some point by splitting it out into a gfx library.  This way,
    the server wouldn't depend on OpenGL.  :)

client/

    This is where the client code goes.  It depends on base.

editor/

    The map editor.  Depends on base as well.  Currently defunct as
    we're using 3ds max to create the levels.

phui/

    A user interface toolkit for OpenGL.  Developed by Ben Scott, Chad
    Austin, and others for a previous project.  This isn't in the same
    namespace as empyrean, but is included in the source tree for
    convenience and maintainability.

server/

    The server.  Depends on base.
