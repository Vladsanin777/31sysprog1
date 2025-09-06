#include <vector>
#include <iostream>
#include <ostream>

std::ostream& operator<<(std::ostream& out, 
        std::vector<int> vec) {
    for (auto element : vec)
        out << *element << ' ';
    out << endl;
    return out;
}

int main(void) {
    std::vector<int> vec{5, 1}, vec2{vec};
    std::cout << vec << endl << vec2 << endl;
    return 0;
}
