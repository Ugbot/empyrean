#include <phui/SDLBridge.h>
#include "Configuration.h"
#include "GameState.h"
#include "MenuState.h"
#include "OptionsState.h"
#include "ServerConnection.h"
#include "Texture.h"

using namespace phui;


namespace pyr {

    class MenuScreen : public RootWidget {
    public:
        MenuScreen(MenuState* state)
            : RootWidget(Application::instance().getWidth(),
                         Application::instance().getHeight())
        {
            _state = state;
        }
        
    protected:
        MenuState* getState() {
            return _state;
        }
        
    private:
        MenuState* _state;
    };
    
    class ErrorScreen : public MenuScreen {
    public:
        ErrorScreen(MenuState* state, const std::string& error)
            : MenuScreen(state)
        {
            LabelPtr label = new Label(error);
            label->setPositionAndSize(0, 0, 1024, 384);
            
            ButtonPtr button = new Button("OK");
            button->setPositionAndSize(0, 384, 1024, 384);
            button->addListener(this, &ErrorScreen::onOK);
            
            add(label);
            add(button);
        }
        
    private:
        void onOK(const ActionEvent&) {
            getState()->onErrorOK();
        }
    };

    class MainScreen : public MenuScreen {
    public:
        MainScreen(MenuState* state)
            : MenuScreen(state)
        {
            _connect = new Button("Connect to Server");
            _connect->addListener(this, &MainScreen::onConnect);
            _connect->setPositionAndSize(0, 0, 1024, 256);
            
            _options = new Button("Options");
            _options->addListener(this, &MainScreen::onOptions);
            _options->setPositionAndSize(0, 256, 1024, 256);
            
            _quit = new Button("Quit");
            _quit->addListener(this, &MainScreen::onQuit);
            _quit->setPositionAndSize(0, 512, 1024, 256);

            add(_connect);
            add(_options);
            add(_quit);
        }
        
        void onConnect(const ActionEvent&) {
            getState()->onMainConnect();
        }
        
        void onOptions(const ActionEvent&) {
            getState()->onMainOptions();
        }
        
        void onQuit(const ActionEvent&) {
            getState()->onMainQuit();
        }
        
    private:
        ButtonPtr _connect;
        ButtonPtr _options;
        ButtonPtr _quit;
    };
    
    class ConnectScreen : public MenuScreen {
    public:
        ConnectScreen(MenuState* state)
            : MenuScreen(state)
        {
            std::string server = Configuration::instance().getServer();
            std::string port = itos(Configuration::instance().getPort());
        
            _server = new TextField(server + ":" + port);
            _server->setPositionAndSize(0, 0, 1024, 256);
            
            _connect = new Button("Connect");
            _connect->addListener(this, &ConnectScreen::onConnect);
            _connect->setPositionAndSize(0, 256, 1024, 256);
            
            _cancel = new Button("Cancel");
            _cancel->addListener(this, &ConnectScreen::onCancel);
            _cancel->setPositionAndSize(0, 512, 1024, 256);
            
            add(_server);
            add(_connect);
            add(_cancel);
        }

    private:
        void onConnect(const ActionEvent&) {
            std::vector<std::string> splits = splitString(
                _server->getText(), ":");
                            
            std::string server = Configuration::instance().getServer();
            int port           = Configuration::instance().getPort();
            if (splits.size() > 0) {
                server = splits[0];
                if (splits.size() > 1) {
                    port = atoi(splits[1].c_str());
                }
            }
            
            getState()->onConnectConnect(server, port);
        }
        
        void onCancel(const ActionEvent&) {
            getState()->onConnectCancel();
        }
    
        TextFieldPtr _server;
        ButtonPtr _connect;
        ButtonPtr _cancel;
    };
    
    class ConnectingScreen : public MenuScreen {
    public:
        ConnectingScreen(MenuState* state)
            : MenuScreen(state)
        {
            LabelPtr status = new Label("Connecting...");
            status->setPositionAndSize(0, 0, 1024, 384);
            
            ButtonPtr cancel = new Button("Cancel");
            cancel->setPositionAndSize(0, 384, 1024, 384);
            cancel->addListener(this, &ConnectingScreen::onCancel);
            
            add(status);
            add(cancel);
        }
        
        void update(float dt) {
            MenuScreen::update(dt);
            switch (ServerConnection::instance().getStatus()) {
                case ServerConnection::CONNECTING: {
                    // keep showing the message...
                    break;
                }
            
                case ServerConnection::CONNECTED: {
                    getState()->onConnectingConnected();
                    break;
                }
                    
                case ServerConnection::DISCONNECTED: {
                    std::string error = ServerConnection::instance().getError();
                    getState()->onConnectingError("Connection failed: " + error);
                    break;
                }
                
                default: {
                    getState()->onConnectingError("Unknown connecting error");
                    break;
                }
            }
        }
            
    private:
        void onCancel(const ActionEvent&) {
            getState()->onConnectingCancel();
        }
    };
    
    class LoginScreen : public MenuScreen {
    public:
        LoginScreen(MenuState* state)
            : MenuScreen(state)
        {
            LabelPtr nameLabel = new Label("Name");
            nameLabel->setPositionAndSize(0, 0, 512, 192);
            
            _name = new TextField(Configuration::instance().getUsername());
            _name->setPositionAndSize(512, 0, 512, 192);
            
            LabelPtr passwordLabel = new Label("Password");
            passwordLabel->setPositionAndSize(0, 192, 512, 192);
            
            _password = new TextField();
            _password->setPositionAndSize(512, 192, 512, 192);
            
            _newuser = new CheckBox("New User");
            _newuser->setPositionAndSize(0, 384, 1024, 192);
            
            _login = new Button("Login");
            _login->addListener(this, &LoginScreen::onLogin);
            _login->setPositionAndSize(0, 576, 512, 192);
            
            _cancel = new Button("Cancel");
            _cancel->addListener(this, &LoginScreen::onCancel);
            _cancel->setPositionAndSize(512, 576, 512, 192);
            
            add(nameLabel);
            add(_name);
            add(passwordLabel);
            add(_password);
            add(_newuser);
            add(_login);
            add(_cancel);
        }
        
    private:
        void onLogin(const ActionEvent&) {
            getState()->onLoginLogin(
                _name->getText(),
                _password->getText(),
                _newuser->isChecked());
        }
        
        void onCancel(const ActionEvent&) {
            getState()->onLoginCancel();
        }
    
        TextFieldPtr _name;
        TextFieldPtr _password;
        CheckBoxPtr  _newuser;
        ButtonPtr    _login;
        ButtonPtr    _cancel;
    };
    
    class LoggingInScreen : public MenuScreen {
    public:
        LoggingInScreen(MenuState* state)
            : MenuScreen(state)
        {
            LabelPtr label = new Label("Logging in...");
            label->setPositionAndSize(0, 0, 1024, 384);
        
            ButtonPtr cancel = new Button("Cancel");
            cancel->setPositionAndSize(0, 384, 1024, 384);
            cancel->addListener(this, &LoggingInScreen::onCancel);
            
            add(label);
            add(cancel);
        }
        
        void update(float /*dt*/) {
            ServerConnection& sc = ServerConnection::instance();
            if (sc.getStatus() == ServerConnection::LOGGED_IN) {
                getState()->onLoggingInLoggedIn();
            } else if (sc.loginFailed()) {
                getState()->onLoggingInError(sc.getError());
            }
        }
        
    private:
        void onCancel(const ActionEvent&) {
            getState()->onLoggingInCancel();
        }
    };


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
        _screen->draw();
        
        glEnable(GL_TEXTURE_2D);
    }
    
    void MenuState::update(float dt) {
        _screen->update(dt);
        ServerConnection::instance().update();
    }
    
    void MenuState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            _screen->onKeyDown(SDLToPhuiKey(key));
        } else {
            _screen->onKeyUp(SDLToPhuiKey(key));
        }
    }
    
    void MenuState::onMousePress(Uint8 button, bool down, int x, int y) {
        const Point p(x, y);
        if (down) {
            _screen->onMouseDown(SDLToPhuiButton(button), p);
        } else {
            _screen->onMouseUp(SDLToPhuiButton(button), p);
        }
    }
    
    void MenuState::onMouseMove(int x, int y) {
        _screen->onMouseMove(Point(x, y));
    }
    
    void MenuState::onErrorOK() {
        _screen = _mainScreen;
    }
    
    void MenuState::onMainConnect() {
        _screen = _connectScreen;
    }
    
    void MenuState::onMainOptions() {
        invokeTransition<OptionsState>();
    }
    
    void MenuState::onMainQuit() {
        quit();
    }
    
    void MenuState::onConnectConnect(const std::string& server, int port) {
        ServerConnection::instance().beginConnecting(server, port);
        _screen = _connectingScreen;
    }
    
    void MenuState::onConnectCancel() {
        _screen = _mainScreen;
    }
    
    void MenuState::onConnectingConnected() {
        _screen = _loginScreen;
    }
    
    void MenuState::onConnectingCancel() {
        ServerConnection::instance().disconnect();
        _screen = _mainScreen;
    }
    
    void MenuState::onConnectingError(const std::string& error) {
        _screen = new ErrorScreen(this, error);
    }
    
    void MenuState::onLoginLogin(
        const std::string& username,
        const std::string& password,
        bool newuser)
    {
        ServerConnection::instance().login(username, password, newuser);
        _screen = _loggingInScreen;
    }
    
    void MenuState::onLoginCancel() {
        ServerConnection::instance().disconnect();
        _screen = _mainScreen;
    }
    
    void MenuState::onLoggingInLoggedIn() {
        invokeTransition<GameState>();
    }
    
    void MenuState::onLoggingInCancel() {
        ServerConnection::instance().disconnect();
        _screen = _mainScreen;
    }
    
    void MenuState::onLoggingInError(const std::string& error) {
        _screen = new ErrorScreen(this, "Error logging in: " + error);
    }
    
    void MenuState::createInterface() {
        _mainScreen       = new MainScreen(this);
        _connectScreen    = new ConnectScreen(this);
        _connectingScreen = new ConnectingScreen(this);
        _loginScreen      = new LoginScreen(this);
        _loggingInScreen  = new LoggingInScreen(this);
        
        _screen = _mainScreen;
    }
    
}
