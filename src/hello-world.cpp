#include <ctime>
#include <iostream>
#include <string>

#include "hello-greet.hpp"

void print_localtime() {
   std::time_t result = std::time(nullptr);
   std::cout << std::asctime(std::localtime(&result));
}

int main(int argc, char** argv) {
   std::string who = "world";
   if (argc > 1) {
      who = argv[1];
   }
   std::cout << get_greet(who) << std::endl;
   std::cout << "This is a C++ template project that used Bazel as build chain."
             << std::endl;
   print_localtime();
   return 0;
}
