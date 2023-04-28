#!/bin/bash

set -xe

cargo build --target wasm32-unknown-unknown
wasm-tools component new ./target/wasm32-unknown-unknown/debug/pubsub.wasm -o pubsub.component.wasm
wasm-tools validate pubsub.component.wasm --features component-model
