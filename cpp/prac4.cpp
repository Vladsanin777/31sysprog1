#include <iostream>

int main(void) {
    size_t size;
    std::cin >> size;
    int element, sum{0};
    for (size_t index{0}; index < size; index++) {
        std::cin >> element;
        sum += element;
    }
    std::cout << sum << std::endl;
    return 0;
}
