#include "version.hpp"

#include <iostream>


int main() {
    std::cout << "git version is: `" << cgv::version << "`\n";
    return 0;
}
