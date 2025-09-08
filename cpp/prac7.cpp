#include <iostream>
#include <alghorithm>
#include <istream>
#include <ostream>

template<typename Tp>
std::istream &operator>>(std::istream& in,
        std::vector<Tp> &vec) {
    for (auto &element : vec)
        in >> element;
    return in;
}

template<typename Tp>
std::ostream &operator<<(std::ostream& out,
        const std::vector<Tp> &vec) {
    for (const auto& element : vec)
        out << element << ' ';
    out << std::endl;
    return out;
}

int main(void) {
    int size;
    std::cin >> size;
    std::vector<int> vec{size};
    std::cin >> vec;
    std::sort(vec.begin(), vec.end());
    std::cout << vec;
    return 0;
}

