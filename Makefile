CXX = emcc

main: main.o
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@
