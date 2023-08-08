EMCC = emcc
CXX = $(EMCC)
CARGO = cargo

all: main main.html

main: main.o
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

main.html: main.cpp
	$(EMCC) $^ -o $@

rust_plugin.wasm:
	cd rust-plugin && $(CARGO) +nightly build \
		-Zbuild-std=std,panic_abort \
		--target wasm32-unknown-unknown --release
	cp rust-plugin/target/wasm32-unknown-unknown/release/rust_plugin.wasm $@
