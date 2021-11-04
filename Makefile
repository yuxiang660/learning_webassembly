all: build

# em++ -std=c++20 api.cpp -Os -s WASM=1 -s SIDE_MODULE=1 -s BINARYEN_ASYNC_COMPILATION=0 -o main.wasm
build: clean
	em++ -std=c++20 main.cpp --no-entry -o main.js

serve:
	python -m SimpleHTTPServer

dump:
	wasm2wat main.wasm -o main.wat

clean:
	rm -rf *.js *.wasm *.wat

