template<typename T>
class Base {
 public:
  void interface() {
    static_cast<T*>(this)->impl();
  }
};

class Derived: public Base<Derived> {
 public:
  void impl() {}
};

int main() {
  auto obj = Derived();
  obj.interface();
  return 0;
}
