#include <memory>
#include <stdexcept>
#include <string>
#include <SDL.h>
#include "Application.h"
#include "Configuration.h"
#include "Error.h"
#include "InputManager.h"
#include "Log.h"
#include "OpenGL.h"
#include "Platform.h"
#include "Profiler.h"
#include "PythonClientBindings.h"
#include "PythonInterpreter.h"
#include "SDLUtility.h"
#include "NSPRUtility.h"

namespace pyr {

    /*
     * Notes for Jared's wireless gamepad.
     *
     * Axis 0 = X Axis left stick (Left = negative, Right = positive)
     * Axis 1 = Y Axis left stick (Forward = negative, Back = positive)
     * Axis 2 = Throttle (low = positive, high = negative)
     * Axis 3 = X Axis right stick (Left = negative, Right = positive)
     * Axis 4 = Y Axis right stick (Forward = negative, Back = positive)
     *
     * Button 0  = A
     * Button 1  = B
     * Button 2  = C
     * Button 3  = X
     * Button 4  = Y
     * Button 5  = Z
     * Button 6  = L1
     * Button 7  = R1
     * Button 8  = Start
     * Button 9  = L2
     * Button 10 = R2
     */

    /// @return true if application should quit.
    bool handleSDLEvents() {
        PYR_PROFILE_BLOCK("handleSDLEvents");
        
        Application& app = the<Application>();

        bool should_quit = false;

        SDL_Event event;
        int result = SDL_PollEvent(&event);
        while (result == 1) {
            switch (event.type) {
                case SDL_VIDEORESIZE:
                    PYR_ASSERT(0, "SDL_VIDEORESIZE should never occur.");
                    app.resize(event.resize.w, event.resize.h);
                    break;

                case SDL_KEYDOWN:
                case SDL_KEYUP:
                    app.onKeyPress(
                        event.key.keysym.sym,
                        event.key.state == SDL_PRESSED);
                    break;

                case SDL_MOUSEBUTTONDOWN:
                case SDL_MOUSEBUTTONUP:
                    app.onMousePress(
                        event.button.button,
                        event.button.state == SDL_PRESSED,
                        event.button.x,
                        event.button.y);
                    break;

                case SDL_MOUSEMOTION:
                    app.onMouseMove(event.motion.x, event.motion.y);
                    break;

                case SDL_JOYAXISMOTION:
                    app.onJoyMove(event.jaxis.axis, normalizeAxisValue(event.jaxis.value));
                    break;

                case SDL_JOYHATMOTION:
                    if(event.jhat.value & SDL_HAT_CENTERED) {
                        // Doesn't work
                    }

                    if(event.jhat.value & SDL_HAT_RIGHT) {
                        // Right
                    }
                    
                    if(event.jhat.value & SDL_HAT_LEFT ) {
                        // Left
                    }

                    break;

                case SDL_JOYBUTTONDOWN:
                case SDL_JOYBUTTONUP:
                    app.onJoyPress(event.jbutton.button,
                                   event.jbutton.state == SDL_PRESSED);
                    break;

                case SDL_QUIT:
                    should_quit = true;
                    break;
            }

            result = SDL_PollEvent(&event);
        }

        // error or SDL_QUIT message
        return (result < 0 || should_quit);
    }

    void mainLoop() {
        Application& app = the<Application>();

        float last_time = getNow();
        while (!app.shouldQuit()) {
            float now = getNow();

            {
                PYR_PROFILE_BLOCK("Frame");

                bool should_quit = handleSDLEvents();
                if (should_quit) {
                    break;
                }

                // Ignore the case where the timer wraps around.
                if (now >= last_time) {
                    float dt = now - last_time;

                    app.update(dt);
                    app.draw();
                    {
                        PYR_PROFILE_BLOCK("glSwapBuffers");
                        SDL_GL_SwapBuffers();
                    }
                }
            }

            the<Profiler>().nextFrame();

            last_time = now;
        }
    }

    void runClient(int argc, char* argv[]) {
        // Initialize log.
        try {
            the<Log>().open(getStartDirectory(argc, argv) + "/client.log");
        }
        catch (const LogFileOpenFailure&) {
            // Could not open log file.  That's okay, defer any problems until later.
        }

        // Set start directory.
        setStartDirectory(argc, argv);

        // Load configuration.
        try {
            the<Configuration>().load();
        }
        catch (const ConfigurationError& e) {
            PYR_LOG() << "Could not load client configuration: " << e.what()
                      << "  That's okay, using defaults.";
        }

        // Register the pyr_client module with the PythonInterpreter.
        the<PythonInterpreter>().addSubModule(initpyr_client);

        PYR_LOG() << "Initializing SDL...";
        initializeSDL(SDL_INIT_NOPARACHUTE | SDL_INIT_VIDEO | SDL_INIT_TIMER | SDL_INIT_JOYSTICK);

        // define our minimum requirements for the GL window
        SDL_GL_SetAttribute(SDL_GL_RED_SIZE,     5);
        SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE,   5);
        SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE,    5);
        SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE,   16);
        SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

        int mode = SDL_OPENGL | SDL_ANYFORMAT;
        if (the<Configuration>().fullscreen) {
            mode |= SDL_FULLSCREEN;
        }

        // If we set this before opening the window, the window has
        // this caption.
        SDL_WM_SetCaption("Empyrean", 0);

        /**
         * @note SDL does silly things when the created window is larger
         * than the desktop.
         */
        const int width  = the<Configuration>().screenWidth;
        const int height = the<Configuration>().screenHeight;
        PYR_LOG() << "Setting video mode...";
        if (!SDL_SetVideoMode(width, height, 32, mode)) {
            throwSDLError("Setting video mode failed");
        }

        GLenum glewError = glewInit();
        if (glewError != GLEW_OK) {
            std::string error = "glewInit() failed: ";
            error += reinterpret_cast<const char*>(glewGetErrorString(glewError));
            throw std::runtime_error(error.c_str());
        }

        PYR_LOG() << "GL_VENDOR: " << glGetString(GL_VENDOR);
        PYR_LOG() << "GL_RENDERER: " << glGetString(GL_RENDERER);
        PYR_LOG() << "GL_VERSION: " << glGetString(GL_VERSION);
        PYR_LOG() << "GL_EXTENSIONS: " << glGetString(GL_EXTENSIONS);

        SDL_ShowCursor(SDL_DISABLE);

        SDL_Joystick* joystick = 0;
        if (SDL_NumJoysticks() > 0) {
            
            SDL_JoystickEventState(SDL_ENABLE);
            joystick = SDL_JoystickOpen(0);

            PYR_LOG() << "Creating Joystick with name of " << SDL_JoystickName(0);
            PYR_LOG() << "Num Axes " << SDL_JoystickNumAxes(joystick);
            PYR_LOG() << "Num Buttons " << SDL_JoystickNumButtons(joystick);
            PYR_LOG() << "Num Hats " << SDL_JoystickNumHats(joystick);
        }

        // notify the app of the window size
        the<Application>().resize(width, height);

        mainLoop();

        // Close the joystick
        if (joystick) {
            SDL_JoystickClose(joystick);
        }

        try {
            // Perhaps this should be saved right after changes, in case
            // the program crashes.
            the<Configuration>().save();
        }
        catch (const ConfigurationError& e) {
            // Display a warning.
            warning("Saving client configuration failed: " + std::string(e.what()));
        }
    }

}


/// main() needs to be defined with argc and argv so SDL works right.
int main(int argc, char* argv[]) {
    PYR_BEGIN_EXCEPTION_TRAP()

        pyr::runClient(argc, argv);
        return EXIT_SUCCESS;

    PYR_END_EXCEPTION_TRAP()
    return EXIT_FAILURE;
}


#if defined(WIN32) && !defined(_CONSOLE)

    #include <windows.h>

    #ifdef __CYGWIN__
    extern "C" __declspec(dllimport) int __argc;
    extern "C" __declspec(dllimport) char* __argv[];
    #endif

    int WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int) {
        return main(__argc, __argv);
    }

#endif
