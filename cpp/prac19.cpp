#include <iostream>
#include <string>

int main() {
    // These strings are the C++ equivalent of the .data section in the assembly code.
    std::string msg = "Hello, C++ World!";
    std::string caption = "C++ Application";

    // This is the equivalent of the MessageBox function.
    // It prints the 'caption' and 'msg' to the console.
    std::cout << caption << std::endl;
    std::cout << msg << std::endl;

    // This is the equivalent of ExitProcess. The program will automatically
    // exit with a status code of 0 upon returning from the main function.
    return 0;
}
