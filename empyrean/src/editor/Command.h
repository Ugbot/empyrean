#ifndef PYR_COMMAND_H
#define PYR_COMMAND_H


#include "Map.h"


namespace pyr {

    class MapTree;
    class MapView;
    class MainFrame;

    class Command;

    /**
     * Something that can receive a command.
     * The receiver assumes responsibility for the pointer.
     */
    class CommandReceiver {
    public:
        virtual void handleCommand(Command* cmd) = 0;
    };

    /**
     * Contexty things for commands.
     * Commands use contexts to order things around.
     */
    struct CommandContext {
        MapTree* mapTree;
        MapView* mapView;
        MainFrame* mainFrame;

        MapPtr map;

        CommandContext(MapTree* tree, MapView* view, MainFrame* frame, MapPtr m)
            : mapTree(tree)
            , mapView(view)
            , mainFrame(frame)
            , map(m)
        {}
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

        virtual void perform(CommandContext& context) = 0;
        virtual void undo(CommandContext& context) = 0;
    };
}

#endif
