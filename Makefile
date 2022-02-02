all: build

# em++ -std=c++20 api.cpp -Os -s WASM=1 -s SIDE_MODULE=1 -s BINARYEN_ASYNC_COMPILATION=0 -o main.wasm
# https://developer.mozilla.org/en-US/docs/WebAssembly/C_to_wasm#calling_a_custom_function_defined_in_c
build: clean
	em++ -std=c++20 main.cpp -s NO_EXIT_RUNTIME=1 --no-entry -o main.js

debug: clean
	em++ -std=c++20 main.cpp -s NO_EXIT_RUNTIME=1 -s "EXPORTED_FUNCTIONS=['_malloc', '_free']" -s "EXPORTED_RUNTIME_METHODS=['ccall']" --no-entry -o main.js

compile:
	em++ -std=c++20 -c main.cpp -o main.o

link:
	em++ main.o -o main.js -Os

serve:
	python -m SimpleHTTPServer

dump:
	wasm2wat main.wasm -o main.wat

clean:
	rm -rf *.js *.wasm *.wat *.o

