#include <vector>
#include <alghorithm>

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
    std::cout << std::max(itBegin, itEnd) << std::endl;
    return 0;
}
