#include <stdio.h>

#include <benchmark/benchmark.h>

namespace vtable {
class Visitor;

class Expr {
 public:
  virtual ~Expr() {}

  virtual void accept(Visitor *v) = 0;
};

class ConstExpr;
class PlusExpr;

class Visitor {
 public:
  virtual void handleConstExpr(ConstExpr *e) {}
  virtual void handlePlusExpr(PlusExpr *e) {}
};

class ConstExpr : public Expr {
  int v;

 public:
  ConstExpr(int v) : v(v) {}
  void accept(Visitor *v) override {
    v->handleConstExpr(this);
  }

  int value() const { return v; }
};

// Can generalize to a binary expr.
class PlusExpr : public Expr {
  Expr *lhs;
  Expr *rhs;

 public:
  PlusExpr(Expr *lhs, Expr *rhs) : lhs(lhs), rhs(rhs) {}

  Expr *getLHS() const { return lhs; }

  Expr *getRHS() const { return rhs; }

  void accept(Visitor *v) override {
    v->handlePlusExpr(this);
  }
};

class PrintVisitor : public Visitor {
 public:
  void handleConstExpr(ConstExpr *e) override {
    printf("%d", e->value());
  }

  void handlePlusExpr(PlusExpr *e) override {
    e->getLHS()->accept(this);
    printf(" + ");
    e->getRHS()->accept(this);
  }
};

class CalcVisitor : public Visitor {
  // The value obtained after visiting an expr.
  int result = 0;

 public:
  void handleConstExpr(ConstExpr *e) override {
    result = e->value();
  }

  void handlePlusExpr(PlusExpr *e) override {
    e->getLHS()->accept(this);
    int lhs = result;
    e->getRHS()->accept(this);
    result += lhs;
  }

  int getResult() const { return result; }
};
}  // namespace vtable

void __attribute__((noinline)) useVtable(vtable::Expr *vtable_obj) {
  // vtable::PrintVisitor p;
  // obj->accept(&p);
  // printf("\n");

  vtable::CalcVisitor c;
  vtable_obj->accept(&c);
  // printf("Calc result is %d\n",  c.getResult());
}

namespace crtp {
template<typename Derived> class Visitor;

enum class Kind {
  CONST,
  PLUS,
};

class Expr {
  Kind kind;

 public:
  Expr(Kind kind) : kind(kind) {}

  Kind getKind() const { return kind; }
};

class ConstExpr;
class PlusExpr;

template<typename Derived>
class Visitor {
 public:
  void visit(Expr *e) {
    switch (e->getKind()) {
      case Kind::CONST:
        return static_cast<Derived *>(this)->handleConstExpr(
            reinterpret_cast<ConstExpr *>(e));
      case Kind::PLUS:
        return static_cast<Derived *>(this)->handlePlusExpr(
            reinterpret_cast<PlusExpr *>(e));
    }
  }

  void handleConstExpr(ConstExpr *e) {}
  void handlePlusExpr(PlusExpr *e) {}
};

class ConstExpr : public Expr {
  int v;

 public:
  ConstExpr(int v) : Expr(Kind::CONST), v(v) {}

  int value() const { return v; }
};

// Can generalize to a binary expr.
class PlusExpr : public Expr {
  Expr *lhs;
  Expr *rhs;

 public:
  PlusExpr(Expr *lhs, Expr *rhs) : Expr(Kind::PLUS), lhs(lhs), rhs(rhs) {}

  Expr *getLHS() const { return lhs; }

  Expr *getRHS() const { return rhs; }
};

class PrintVisitor : public Visitor<PrintVisitor> {
 public:
  void handleConstExpr(ConstExpr *e) {
    printf("%d", e->value());
  }

  void handlePlusExpr(PlusExpr *e) {
    visit(e->getLHS());
    printf(" + ");
    visit(e->getRHS());
  }
};

class CalcVisitor : public Visitor<CalcVisitor> {
  // The value obtained after visiting an expr.
  int result = 0;

 public:
  void handleConstExpr(ConstExpr *e) {
    result = e->value();
  }

  void handlePlusExpr(PlusExpr *e) {
    visit(e->getLHS());
    int lhs = result;
    visit(e->getRHS());
    result += lhs;
  }

  int getResult() const { return result; }
};
}  // namespace crtp

void __attribute__((noinline)) useCrtp(crtp::Expr *crtp_obj) {
  // crtp::PrintVisitor p;
  // p.visit(obj);
  // printf("\n");

  crtp::CalcVisitor c;
  c.visit(crtp_obj);
  // printf("Calc result is %d\n",  c.getResult());
}

// int main() {
//   useVtable();
//   useCrtp();
// }

template<typename E, typename ConstE, typename PlusE>
E *createExpr(unsigned exprLen) {
  E *obj = new ConstE(1);
  for (unsigned i = 0; i < exprLen; ++i) {
    obj = new PlusE(obj, new ConstE(i));
  }
  return obj;
}

static void BM_CrtpCall(benchmark::State& state) {
  // Don't worry about deallocation.
  unsigned exprLen = state.range(0);
  crtp::Expr *crtp_obj =
      createExpr<crtp::Expr, crtp::ConstExpr, crtp::PlusExpr>(exprLen);

  for (auto _ : state) {
    useCrtp(crtp_obj);
  }
}

BENCHMARK(BM_CrtpCall)->RangeMultiplier(16)->Range(2, 2<<12);

static void BM_VtableCall(benchmark::State& state) {

  // Don't worry about deallocation.
  unsigned exprLen = state.range(0);
  vtable::Expr *vtable_obj =
      createExpr<vtable::Expr, vtable::ConstExpr, vtable::PlusExpr>(exprLen);

  for (auto _ : state) {
    useVtable(vtable_obj);
  }
}

BENCHMARK(BM_VtableCall)->RangeMultiplier(16)->Range(2, 2<<12);

BENCHMARK_MAIN();
