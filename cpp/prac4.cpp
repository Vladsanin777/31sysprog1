#include <iostream>
#include <istream>
#include <vector>

template<typename Tp>
std::istream &operator>>(std::istream& in,
        std::vector<Tp>& vec) {
    for (auto& element : vec)
        in >> element;
    return in;
}

namespace std {
    template<typename Tp>
    int sum(std::vector<Tp> vec) {
        int sum{0};
        for (auto &element : vec)
            sum += element;
        return 0;
    }
}

int main(void) {
    int size;
    std::cin >> size;
    std::vector<int> vec{size};
    std::cin >> vec;
    std::cout << std::sum(vec) << std::endl;
    return 0;
}
