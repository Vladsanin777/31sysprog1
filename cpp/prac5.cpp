#include <vector>
#include <iostream>
#include <ostream>

template<typename Tp>
std::istream &operator>>(std::istream& in,
        std::vector<Tp>& vec) {
    for (auto& element : vec)
        in >> element;
    return in;
}

int main(void) {
    std::vector<int> vec{5, 1}, vec2{vec};
    std::cout << vec << endl << vec2 << endl;
    return 0;
}
