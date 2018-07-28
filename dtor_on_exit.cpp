#include <stdio.h>
#include <stdlib.h>

class C {
 public:
  C() { printf("ctor\n"); }
  ~C() { printf("dtor\n"); }
};

void foo() {
  // d'tor is NOT called on exit()
  exit(-1);
}

int main() {
  C c;
  foo();
}
