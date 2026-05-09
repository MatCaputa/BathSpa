#include <cstdio>
#include <iostream>
#include <sstream>
#ifdef _WIN32
#include <windows.h>
#else
#include <sys/ioctl.h>
#include <unistd.h>
#endif

int get_console_width() {
#ifdef _WIN32
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    if (GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), &csbi)) {
        return csbi.srWindow.Right - csbi.srWindow.Left + 1;
    }
    return 80;  // fallback
#else
    struct winsize w;
    if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0) {
        return w.ws_col;
    }
    return 80;  // fallback
#endif
}

std::string center_text(const std::string& text) {
    int width = get_console_width();
    int len = static_cast<int>(text.length());
    if (len >= width)
        return text;
    int padding = (width - len) / 2;
    return std::string(padding, ' ') + text;
}

void print_centered(const std::string& text) {
    std::istringstream iss(text);
    std::string line;
    while (std::getline(iss, line)) {
        std::cout << center_text(line) << '\n';
    }
}

void clear_console() {
#ifdef _WIN32
    HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
    CONSOLE_SCREEN_BUFFER_INFO csbi;
    if (!GetConsoleScreenBufferInfo(hConsole, &csbi))
        return;

    DWORD cellCount = csbi.dwSize.X * csbi.dwSize.Y;
    COORD homeCoords = {0, 0};
    DWORD count;

    // Fill the entire buffer with spaces
    FillConsoleOutputCharacterA(hConsole, ' ', cellCount, homeCoords, &count);
    // Reset the attributes (colors) of every cell
    FillConsoleOutputAttribute(hConsole, csbi.wAttributes, cellCount, homeCoords, &count);
    // Move cursor home
    SetConsoleCursorPosition(hConsole, homeCoords);
#else
    // ANSI escape: \033[2J clears screen, \033[H moves cursor to top-left
    std::cout << "\033[2J\033[H" << std::flush;
#endif
}
