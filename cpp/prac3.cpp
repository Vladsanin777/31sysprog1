#include <iostream>
#include <cmath>

int main(void) {
    int R, H;
    std::cin >> R >> H;
    double V{ M_PI * (R * R * H) };
    std::cout << V << std::endl;
    return 0;
}
