
#ifndef PYR_PLAYERENTITY_H
#define PYR_PLAYERENTITY_H

#include "Entity.h"
#include "Utility.h"

namespace pyr {

    class Model;
    class Renderer;
    class InputManager;
    class Input;

    /** Represents a local player.
     *
     * I'm not all that happy that I have to pass a renderer
     * here.  It feels sloppy.  Maybe it's just me.
     *
     * On the plus side, this means that entities have individual
     * rendering settings implicitly.  Good juju.  I'll have to
     * tweak the renderer a bit if we go with this, though, since
     * every CellShadeRenderer has its own shade texture, as well
     * as other miscellaneous weirdness. (as is customary for any
     * code written by yours truly)
     */
    class PlayerEntity : public Entity {
    public:
        PlayerEntity(Model* model, Renderer* renderer, InputManager* im);

        void draw();
        void update(float dt);

    private:
        typedef void (PlayerEntity::*StateHandler)(float dt);
        StateHandler _state;

        void changeState(StateHandler* newstate);

        void startStandState();
        void updateStandState(float dt);

        void startWalkState();
        void updateWalkState(float dt);

        // These are aggregates.  We don't clean up.
        Model* _model;
        Renderer* _renderer;

        float _direction;
        
        Input* _inputLeft;
        Input* _inputRight;
    };

}

#endif
