#ifndef PYR_COMMAND_H
#define PYR_COMMAND_H

namespace pyr {

    class Command;
    class Map;

    /**
     * Something that can recieve a command.
     * The reciever assumes responsibility for the pointer.
     */
    class CommandReciever {
    public:
        virtual void handleCommand(Command* cmd) = 0;
    };

    /**
     * A command is anything that can alter a map.
     * The only way the map should be altered is through
     * commands.
     *
     * If the return value is true, then the window will be repainted.
     */
    class Command {
    public:
        virtual ~Command() {}

        virtual bool perform(Map* map) = 0;
        virtual bool undo(Map* map) = 0;
    };
}

#endif