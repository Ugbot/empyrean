#ifndef PYR_APPLICATION_H
#define PYR_APPLICATION_H


namespace pyr {

    class State;

    /// Lazily-instantiated singleton class representing the game as a whole.
    class Application {
    public:
        static Application& instance();
        static void destroy();

    private:
        Application();
        ~Application();
        
    public:
        void resize(int width, int height);
        void draw();
        
        /// @param dt  elapsed time in milliseconds
        void update(float dt);
        
        bool shouldQuit();

    private:
        static Application* _instance;
    
        int _width;
        int _height;
        State* _currentState;
    };
    
}


#endif
