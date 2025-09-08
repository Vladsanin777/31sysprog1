#include <iostream>
#include <SDL2/SDL.h>

int main(int argc, char* argv[]) {
    // Initialize SDL's video and events subsystems.
    // This includes mouse handling.
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS) < 0) {
        std::cerr << "SDL could not initialize! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    // Create a window (required for event handling in SDL2).
    SDL_Window* window = SDL_CreateWindow(
        "Mouse Handler",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        640,
        480,
        SDL_WINDOW_SHOWN
    );
    if (window == nullptr) {
        std::cerr << "Window could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return 1;
    }

    // Analog of showing the mouse cursor (mov ax, 0001h, int 33h).
    // The SDL cursor is shown by default.
    // You could hide it with `SDL_ShowCursor(SDL_DISABLE);` if needed.
    SDL_ShowCursor(SDL_ENABLE);

    // Main event loop (analog of the main_loop in assembly).
    bool quit = false;
    SDL_Event event;
    int mouse_x = 0;
    int mouse_y = 0;

    while (!quit) {
        // Poll for events. This function gets the next event from the event queue.
        while (SDL_PollEvent(&event)) {
            // Check for a quit event (e.g., closing the window).
            if (event.type == SDL_QUIT) {
                quit = true;
            } 
            // Check for a mouse motion event.
            else if (event.type == SDL_MOUSEMOTION) {
                mouse_x = event.motion.x;
                mouse_y = event.motion.y;
                std::cout << "Mouse moved to: (" << mouse_x << ", " << mouse_y << ")" << std::endl;
            } 
            // Check for a mouse button event.
            else if (event.type == SDL_MOUSEBUTTONDOWN) {
                std::cout << "Mouse button pressed: " << event.button.button << std::endl;
            }
        }
    }

    // Clean up and restore system state.
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
