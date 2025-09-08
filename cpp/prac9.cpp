#include <iostream>

namespace std {
    long long int factorial(int number) {
        long long int result {1};
        while (number--)
            result += result + 1;
        return result;
    }
}

int main(void) {
    std::cin >> number;
    std::cout << std::factorial(number);
    return 0;
}
