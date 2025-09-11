#include <iostream>
#include "mathlib.hpp"

int main() {
    int a = 10, b = 20;
    std::cout << "Addition: " << AddNumbers(a, b) << std::endl;
    std::cout << "Multiplication: " << MultiplyNumbers(a, b) << std::endl;
    return 0;
}
