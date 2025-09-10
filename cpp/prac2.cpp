#include <iostream>

int main(void) {
    int A, B, C, D;
    std::cin >> A >> B >> C >> D;
    int Z{ (A + B) * (C - D) };
    std::cout << Z << std::endl;
    return 0;
}
