#include <iostream>

namespace std {
    long long int factorial(int number) {
        long long int result {1};
        int res {1};
        while (number--)
            result *= res++;
        return result;
    }
}

int main(void) {
    int number;
    std::cin >> number;
    std::cout << std::factorial(number) << std::endl;
    return 0;
}

