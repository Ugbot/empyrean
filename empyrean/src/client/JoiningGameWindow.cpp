#include "JoiningGameWindow.h"
#include "PacketTypes.h"
#include "ServerConnection.h"


namespace pyr {

    JoiningGameWindow::JoiningGameWindow() {
        using namespace phui;

        setTitle("Joining Game...");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setSize(400, 150);

        ButtonPtr cancel = new Button("Cancel");
        cancel->addListener(this, &JoiningGameWindow::onCancel);
            
        add(new phui::Label("Joining Game..."));
        add(cancel);
    }
        
    void JoiningGameWindow::update(float /*dt*/) {
        ServerConnection& sc = ServerConnection::instance();
            
        if (sc.hasJoinGameResponse()) {
            u16 r = sc.getJoinGameResponse();
            switch (r) {
                case JGR_JOINED:
                    endModal(1);
                    break;
                    
                case JGR_INVALID_NAME:
                    setModal(new phui::MessageBox("Join Game Error", "Invalid game name"), this);
                    break;
                
                case JGR_NO_GAME:
                    setModal(new phui::MessageBox("Join Game Error", "No game with that name"), this);
                    break;
                                
                case JGR_INVALID_PASSWORD:
                    setModal(new phui::MessageBox("Join Game Error", "Invalid password"), this);
                    break;
                
                case JGR_ALREADY_STARTED:
                    setModal(new phui::MessageBox("Join Game Error", "Already Started"), this);
                    break;
                
                default:
                    setModal(new phui::MessageBox("Join Game Error", "Unknown Join Game Error"), this);
                    break;
            }
        }
    }

    void JoiningGameWindow::onCancel(const phui::ActionEvent&) {
        endModal();
    }

    void JoiningGameWindow::onEndModal(Widget* widget, int result) {
        endModal();
    }
}
