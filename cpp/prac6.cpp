#include <vector>
#include <algorithm>
#include <iostream>
#include <istream>

template<typename Tp>
std::istream &operator>>(std::istream& in,
        std::vector<Tp> &vec) {
    for (auto &element : vec)
        in >> element;
    return in;
}

int main(void) {
    int size;
    std::cin >> size;
    std::vector<int> vec{size};
    std::cin >> vec;
    std::cout << *std::max_element(vec.begin(), vec.end()) << std::endl;
    return 0;
}
