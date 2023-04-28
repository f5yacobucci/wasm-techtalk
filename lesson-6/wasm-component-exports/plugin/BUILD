#!/bin/bash

set -xe

cargo build --target wasm32-unknown-unknown
wasm-tools component new ./target/wasm32-unknown-unknown/debug/mathguest.wasm \
    -o math.component.wasm
wasm-tools validate math.component.wasm --features component-model
