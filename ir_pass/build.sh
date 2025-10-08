#!/bin/bash

mkdir -p build
cd build

game_repo="../../game_of_life"
sources=("$game_repo/app.c" "$game_repo/game.c" "$game_repo/start.c" "../log.c")
pass_source="../analyzePass.cpp"

echo "building pass"
clang++ "$pass_source" -fPIC -shared -I$(llvm-config --includedir) -o libAnalyzePass.so
echo "pass build done in /build/libAnalyzePass.so"

echo "building app"
clang -fpass-plugin="./libAnalyzePass.so" -lSDL2 "${sources[@]}" -O2 -o app
echo "app build done"
