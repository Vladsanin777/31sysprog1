#include <vector>
#include <iostream>
#include <ostream>

template<typename Tp>
std::ostream &operator<<(std::ostream& out,
        const std::vector<Tp> &vec) {
    for (const auto& element : vec)
        out << element << ' ';
    out << std::endl;
    return out;
}

int main(void) {
    std::vector<int> vec{5, 1}, vec2{vec};
    std::cout << vec << std::endl << vec2 << std::endl;
    return 0;
}
