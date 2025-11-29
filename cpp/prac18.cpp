#include <iostream>
#include <chrono>
// Функция вычисления факториала на C++
int factorial_cpp(int n) {
    if (n <= 1) return 1;
    return n * factorial_cpp(n - 1);
}
int factorial_asm(int n) {
    if (n < 1) return 1;
    int res{n};
    while (--n != 1)
        res *= n;
    return res;
}
int main(void) {
    int number;
    std::cin >> number;
    auto start = std::chrono::high_resolution_clock::now();
    int result_cpp = factorial_cpp(number);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration_cpp = end - start;
    start = std::chrono::high_resolution_clock::now();
    int result_asm = factorial_asm(number);
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration_asm = end - start;
    std::cout << "C++ result: " << result_cpp
        << " Time: " << duration_cpp.count() << "s\n";
    std::cout << "ASM result: " << result_asm
        << " Time: " << duration_asm.count() << "s\n";
    return 0;
}

