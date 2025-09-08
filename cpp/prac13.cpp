#include <ncurses.h>
#include <string>

int main() {
    // Initialize the ncurses library and its environment.
    // It sets up the terminal for the program's use.
    initscr();
    cbreak();
    noecho();
    
    // Enable color support and define color pairs.
    // The init_pair function defines a foreground/background color combination.
    if (has_colors()) {
        start_color();
        // Yellow on Blue
        init_pair(1, COLOR_YELLOW, COLOR_BLUE);
        // White on Black
        init_pair(2, COLOR_WHITE, COLOR_BLACK);
    }
    
    // Set cursor position to (10, 20)
    // The `move` function sets the cursor position. The parameters are (row, column).
    move(10, 20);

    // Print character with attributes
    // `attron` turns on the specified attributes (in this case, color pair 1).
    attron(COLOR_PAIR(1));
    // `addch` adds a single character at the current cursor position.
    addch('A');
    // `attroff` turns off the attributes.
    attroff(COLOR_PAIR(1));

    // Move cursor to (12, 30) for the string
    move(12, 30);

    // Print string with attributes
    // `attron` turns on the color pair 2 (white on black).
    attron(COLOR_PAIR(2));
    const std::string message = "Hello World";
    // `addstr` adds a C-style string at the current cursor position.
    addstr(message.c_str());
    attroff(COLOR_PAIR(2));

    // Refresh the screen to show all changes.
    // `refresh` must be called to update the physical screen with the content of the virtual screen.
    refresh();

    // Wait for a key press
    // `getch` reads a single character from the keyboard.
    getch();

    // Clean up and restore the terminal to its original state.
    endwin();

    return 0;
}
