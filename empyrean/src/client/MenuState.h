#ifndef PYR_MENU_STATE_H
#define PYR_MENU_STATE_H


#include <phui/phui.h>
#include "State.h"
#include "MultiTextureImage.h"


namespace pyr {

    class MenuState : public State {
    public:
        MenuState();
        
        void draw(float fade);
        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);

    private:
        void createInterface();
        void onButtonPressed(const phui::ActionEvent& e);
    
        phui::RootWidgetPtr _root;
        phui::ButtonPtr _connect;
        phui::ButtonPtr _options;
        phui::ButtonPtr _quit;
    
        //MultiTextureImage _connect;
        //MultiTextureImage _options;
        //MultiTextureImage _exit;        

        //MultiTextureImage main, bg1, bg2, sky;
    };

}


#endif
