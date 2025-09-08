#include <iostream>
#include <istream>

template<typename Tp>
std::istream &operator>>(std::istream& in,
        std::vector<Tp>& vec) {
    for (auto& element : vec)
        in >> element;
    return in;
}

namespace std {
    int sum(std::vector<Tp> vec) {
        int sum{0};
        for (auto &element : vec)
            sum += element;
        return 0;
    }
}

int main(void) {
    size_t size;
    std::cin >> size;
    std::vector<int> vec{size};
    std::cin >> vec;
    std::cout << std::sum(vec) << std::endl;
    return 0;
}
