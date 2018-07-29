crtp: crtp.cpp
	clang++  -std=c++11 -O3 crtp.cpp -lbenchmark -lpthread

visitor: visitor.cpp
	clang++  -std=c++11 -O3 visitor.cpp -lbenchmark -lpthread
