#include <iostream>
#include <string>

namespace std {
    bool is_low_reg_symbol(const char &symbol) {
        return 'a' <= symbol && 'z' >= symbol;
    }

    void to_upper(char &symbol) {
        symbol += 'A' - 'a';
    }

    void to_upper(std::string& str) {
        for (auto &symbol : str)
            if (is_low_reg_symbol(symbol))
                to_upper(symbol);
    }
}

int main(void) {
    std::string str;
    std::cin >> str;
    std::to_upper(str);
    std::cout << str;
    return 0;
}
