#!/bin/bash

set -xe


wit-bindgen tiny-go ./wit --out-dir=md5
tinygo build -target=wasi -o md5.wasm md5_impl.go
wasm-tools component embed --world md5 ./wit md5.wasm -o md5.embed.wasm
wasm-tools component new md5.embed.wasm --adapt wasi_snapshot_preview1.wasm -o md5.component.wasm
wasm-tools validate md5.component.wasm --features component-model
