// class Base {
//  public:
//   virtual int interface() = 0;
// };

// class Derived : public Base {
//  public:
//   int interface() override {
//     // for (int i = 0; i < 100; ++i) { asm(""); }
//     return 0;
//   }
// };

class Base {
 public:
  virtual int interface() = 0;

  virtual ~Base() {}
};

class Derived : public Base {
 public:
  int interface() override {
    for (int i = 0; i < 100; ++i) { asm(""); }
    return 0;
  }
};

int main() {
  Base *obj = new Derived();
  obj->interface();
  delete obj;
  return 0;
}
