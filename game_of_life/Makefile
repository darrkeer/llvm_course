OUTPUT = a.out

all: build

build:
	clang start.c game.c app.c -lSDL2 -o $(OUTPUT)

gen_ir:
	clang -S -emit-llvm start.c -o ./IRGen/start.ll
	clang -S -emit-llvm game.c -o ./IRGen/game.ll
	clang -S -emit-llvm app.c -o ./IRGen/app.ll

run: build
	./$(OUTPUT)

clean:
	rm -f $(OUTPUT)

.PHONY: all build run clean