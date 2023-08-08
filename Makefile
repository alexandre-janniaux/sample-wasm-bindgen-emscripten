EMCC = emcc
CXX = $(EMCC)
CARGO = cargo

all: main main.html

main: librust_plugin.a
	$(LINK.cc) main.o $(LOADLIBES) $(LDLIBS) -o $@
main: LDLIBS=-L. -lrust_plugin

main.html: main.cpp
	$(EMCC) $^ -o $@


RUST_TARGET = wasm32-unknown-emscripten

.PHONY: librust_plugin.a
librust_plugin.a:
	cd rust-plugin && $(CARGO) +nightly build \
		-Zbuild-std=std,panic_abort \
		--target $(RUST_TARGET) --release
	cp rust-plugin/target/$(RUST_TARGET)/release/librust_plugin.a $@
