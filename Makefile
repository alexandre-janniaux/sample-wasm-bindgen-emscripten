EMCC = emcc
CXX = $(EMCC)

all: main main.html

main: main.o
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

main.html: main.cpp
	$(EMCC) $^ -o $@
