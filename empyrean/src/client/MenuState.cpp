#include <phui/SDLBridge.h>
#include "Configuration.h"
#include "GameState.h"
#include "MenuState.h"
#include "OptionsState.h"
#include "ServerConnection.h"
#include "Texture.h"

using namespace phui;


namespace pyr {

    MenuState::MenuState() {
        createInterface();
        showPointer();
    }
    
    void MenuState::draw(float fade) {
        glDisable(GL_DEPTH_TEST);
        glDisable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1, 1, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        glColor4f(0, 0, 0, 1 - fade);
        glBegin(GL_TRIANGLE_FAN);
        glVertex2f(0, 0);
        glVertex2f(0, 1);
        glVertex2f(1, 1);
        glVertex2f(1, 0);
        glEnd();
        
        glDisable(GL_TEXTURE_2D);
        _root->draw();
        
        glEnable(GL_TEXTURE_2D);
    }
    
    void MenuState::update(float dt) {
        ServerConnection::instance().update();
    }
    
    void MenuState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            _root->onKeyDown(SDLToPhuiKey(key));
        } else {
            _root->onKeyUp(SDLToPhuiKey(key));
        }
    }
    
    void MenuState::onMousePress(Uint8 button, bool down, int x, int y) {
        const Point p(x, y);
        if (down) {
            _root->onMouseDown(SDLToPhuiButton(button), p);
        } else {
            _root->onMouseUp(SDLToPhuiButton(button), p);
        }
    }
    
    void MenuState::onMouseMove(int x, int y) {
        _root->onMouseMove(Point(x, y));
    }
    
    void MenuState::createInterface() {
        createMainScreen();
        createLoginScreen();
        _root = _mainRoot;
    }
    
    void MenuState::createMainScreen() {
        _connect = new Button("Connect to Server");
        _connect->setPositionAndSize(0, 0, 1024, 256);
        _connect->addMethodListener(this, &MenuState::onButtonPressed);
        
        _options = new Button("Options");
        _options->setPositionAndSize(0, 256, 1024, 256);
        _options->addMethodListener(this, &MenuState::onButtonPressed);
        
        _quit = new Button("Quit");
        _quit->setPositionAndSize(0, 512, 1024, 256);
        _quit->addMethodListener(this, &MenuState::onButtonPressed);

        _mainRoot = new RootWidget(
            Application::instance().getWidth(),
            Application::instance().getHeight());
        _mainRoot->add(_connect);
        _mainRoot->add(_options);
        _mainRoot->add(_quit);
    }
    
    void MenuState::createLoginScreen() {
        LabelPtr nameLabel = new Label("Name");
        nameLabel->setPositionAndSize(0, 0, 512, 256);
        
        _name = new TextField();
        _name->setPositionAndSize(512, 0, 512, 256);
        
        LabelPtr passwordLabel = new Label("Password");
        passwordLabel->setPositionAndSize(0, 256, 512, 256);
        
        _password = new TextField();
        _password->setPositionAndSize(512, 256, 512, 256);
        
        _login = new Button("Login");
        _login->addMethodListener(this, &MenuState::onButtonPressed);
        _login->setPositionAndSize(0, 512, 512, 256);
        
        _cancel = new Button("Cancel");
        _cancel->addMethodListener(this, &MenuState::onButtonPressed);
        _cancel->setPositionAndSize(512, 512, 512, 256);
        
        _loginRoot = new RootWidget(
            Application::instance().getWidth(),
            Application::instance().getHeight());
        _loginRoot->add(nameLabel);
        _loginRoot->add(_name);
        _loginRoot->add(passwordLabel);
        _loginRoot->add(_password);
        _loginRoot->add(_login);
        _loginRoot->add(_cancel);
    }
    
    void MenuState::onButtonPressed(const ActionEvent& e) {
        if (e.getSource() == _connect) {
            _root = _loginRoot;
            //invokeTransition<ConnectToServerState>();
            //invokeTimedTransition<GameState>(1);
        } else if (e.getSource() == _options) {
            invokeTransition<OptionsState>();
        } else if (e.getSource() == _quit) {
            quit();
        } else if (e.getSource() == _login) {
            ServerConnection::instance().connect(
                Configuration::instance().getServer(),
                Configuration::instance().getPort());
            ServerConnection::instance().login(_name->getText(), _password->getText());
            invokeTransition<GameState>();
        } else if (e.getSource() == _cancel) {
            _root = _mainRoot;
        }
    }

}
