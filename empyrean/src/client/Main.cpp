#include <iostream>
#include <memory>
#include <stdexcept>
#include <string>
#include <stdlib.h>
#include <time.h>
#include <SDL.h>
#include <SDL_opengl.h>
#include "Application.h"
#include "FPSCounter.h"
#include "InputManager.h"


void throwSDLError(const std::string& prefix) {
    throw std::runtime_error(prefix + ": " + SDL_GetError());
}


void quitSDL() {
    SDL_Quit();
}


void run() {
    srand(time(0));
    
    int init_flags = SDL_INIT_NOPARACHUTE | SDL_INIT_VIDEO | SDL_INIT_TIMER;
    if (SDL_Init(init_flags) < 0) {
        throwSDLError("SDL initialization failed");
    }
    
    atexit(quitSDL);

    const SDL_VideoInfo* info = SDL_GetVideoInfo();
    if (!info) {
        throwSDLError("Retrieving video information failed");
    }
    
    // define our minimum requirements for the GL window
    SDL_GL_SetAttribute(SDL_GL_RED_SIZE,     5);
    SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE,   5);
    SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE,    5);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE,   16);
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);

    const int width  = 1024;
    const int height = 768;
    const int bpp    = info->vfmt->BitsPerPixel;
    if (!SDL_SetVideoMode(width, height, bpp, SDL_OPENGL)) {
        throwSDLError("Setting video mode failed");
    }

    SDL_WM_SetCaption("Empyrean", 0);
    
    pyr::Application& app = pyr::Application::instance();
    
    // notify the app and the input manager of the window size
    app.resize(width, height);
    
    pyr::FPSCounter counter;

    Uint32 last_time = SDL_GetTicks();
    while (!app.shouldQuit()) {
        bool should_quit = false;

        SDL_Event event;
        int result = SDL_PollEvent(&event);
        while (result == 1) {
            switch (event.type) {
                case SDL_VIDEORESIZE:
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

                case SDL_QUIT:
                    should_quit = true;
                    break;
            }

            result = SDL_PollEvent(&event);
        }

        // error or SDL_QUIT message
        if (result < 0 || should_quit) {
            break;
        }

        Uint32 now = SDL_GetTicks();

        // ignore wraparound
        if (now >= last_time) {
            float dt = float(now - last_time) / 1000.0f;
        
            app.update(dt);
            app.draw();
            SDL_GL_SwapBuffers();

            counter.update(dt);
            
            char str[80];
            sprintf(str, "%d", counter.getFPS());
            SDL_WM_SetCaption(str, 0);
        }
        last_time = now;
    }
}


void error(const std::string& message);


int main() {
    try {
        run();
        return EXIT_SUCCESS;
    }
    catch (const std::exception& e) {
        error(e.what());
        return EXIT_FAILURE;
    }
}


#ifdef WIN32

    #include <windows.h>

    int WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int) {
        // set the current path to where the executable resides
        char filename[MAX_PATH];
        GetModuleFileName(GetModuleHandle(0), filename, MAX_PATH);

        // remove the basename
        char* backslash = strrchr(filename, '\\');
        if (backslash) {
            *backslash = 0;
            SetCurrentDirectory(filename);
        }
        
        return main();
    }
    
    void error(const std::string& message) {
        MessageBox(NULL, message.c_str(), "Empyrean Error", MB_ICONERROR);
    }

#else

    void error(const std::string& message)
    {
        std::cerr << message << std::endl;
    }    

#endif
