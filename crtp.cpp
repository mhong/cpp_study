#include <benchmark/benchmark.h>

namespace crtp {
template <typename T>
class Base {
 public:
  int interface() { return static_cast<T*>(this)->impl(); }
};

class Derived : public Base<Derived> {
 public:
  int impl() {
    // for (int i = 0; i < 100; ++i) { asm(""); }
    return 0;
  }
};
}  // namespace crtp

namespace vtable {
class Base {
 public:
  virtual int interface() = 0;

  virtual ~Base() {}
};

class Derived : public Base {
 public:
  int interface() override {
    // for (int i = 0; i < 100; ++i) { asm(""); }
    return 0;
  }
};
}  // namespace vtable

crtp::Base<crtp::Derived> *crtp_obj = new crtp::Derived();

static void __attribute__ ((noinline)) BM_CrtpCall(benchmark::State& state) {
  for (auto _ : state) {
    benchmark::DoNotOptimize(crtp_obj->interface());
  }
}
// Register the function as a benchmark
BENCHMARK(BM_CrtpCall);

vtable::Base *vtable_obj = new vtable::Derived();

static void __attribute__ ((noinline)) BM_VtableCall(benchmark::State& state) {
  for (auto _ : state) {
    benchmark::DoNotOptimize(vtable_obj->interface());
  }
}
// Register the function as a benchmark
BENCHMARK(BM_VtableCall);

BENCHMARK_MAIN();
