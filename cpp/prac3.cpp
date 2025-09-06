#include <iostrem>
#include <cmath>

int main(void) {
    int R, H;
    std::cin >> R >> H;
    int V{ M_PI * R * R * H };
    std::cout << V << std::endl;
    return 0;
}
