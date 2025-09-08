#include <SDL2/SDL.h>
#include <iostream>

const int SCREEN_WIDTH = 320;
const int SCREEN_HEIGHT = 200;

int main(int argc, char* argv[]) {
    // Инициализация SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        std::cerr << "SDL could not initialize! SDL_Error: " << SDL_GetError() << std::endl;
        return 1;
    }

    // Создание окна
    SDL_Window* window = SDL_CreateWindow(
        "Graphics Mode 320x200",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        SCREEN_WIDTH,
        SCREEN_HEIGHT,
        SDL_WINDOW_SHOWN
    );
    if (window == nullptr) {
        std::cerr << "Window could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        SDL_Quit();
        return 1;
    }

    // Создание рендерера
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (renderer == nullptr) {
        std::cerr << "Renderer could not be created! SDL_Error: " << SDL_GetError() << std::endl;
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 1;
    }

    // Очистка экрана черным цветом
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);

    // Отрисовка пикселей (аналог MOV BYTE PTR ES:[DI], 0Ch)
    // Красный цвет в RGB: 255, 0, 0
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    for (int i = 0; i < 100; ++i) {
        SDL_RenderDrawPoint(renderer, i, 0); // Рисуем 100 точек на первой строке
    }

    // Отрисовка линии (аналог CALL draw_line)
    // Рисуем линию от (50, 50) до (150, 150)
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255); // Белый цвет
    SDL_RenderDrawLine(renderer, 50, 50, 150, 150);

    // Обновление экрана
    SDL_RenderPresent(renderer);

    // Ожидание нажатия клавиши (аналог INT 16h)
    SDL_Event event;
    bool quit = false;
    while (!quit) {
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT || (event.type == SDL_KEYDOWN)) {
                quit = true;
            }
        }
    }

    // Освобождение ресурсов и завершение работы
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
