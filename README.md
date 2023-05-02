# wasm-techtalk

A collection of scripts, examples, and lessons to get started using WebAssembly, with an emphasis on outside-the-browser usage styles.

## Lesson 1

Basic WebAssembly text example.

The math.wat file demonstrates simple WAT format. The `add`, `subtract`, and `pow2` functions help demonstrate the implied stack machine in the simplest format possible. The `powN` function expands on these first examples to show more complex structure using equality operators, loops, and branch statements.

NOTE: extend_and_wrap.wat is work in progress demonstration of integer conversion between storage sizes, 32 and 64.

To run:
```bash
wat2wasm math.wat > math.wasm
node node-wasm.js
```

## Lesson 2

Linear memory import and export.

The memory-import.wat intends to show WAT import of a memory segment from Javascript. Additionally, the syntax to import a function from the host is shown via the `log` import.

To run:
```bash
wat2wasm memory-import.wat >memory-import.wasm
node node-wasm-import.js
```

The memory-export.wat intends to show WAT export of a memory segment. The program exports a memory, and provides to functions to read and write a single byte at an offset. The host program, node-wasm-export.js, uses the exported functions to read and write. It additionally demonstrates direct manipulation of the exported memory using the DataView API.

To run:
```bash
wat2wasm memory-export.wat >memory-export.wasm
node node-wasm-export.js
```

## Lesson 3

Linear memory export with wasmtime and wasmtime-go.

Using the same WAT and WASM program from lesson 2, the host program is re-written in Go to manipulate memory. The host program demonstrates a basic usage of wasmtime-go to instantiate a wasmtime engine and module. The output should identically match the output from node-wasm-export.js from lesson 2.

To run:
```bash
go run main.go
```

## Lesson 4

Expanding guest program capabilities.

This is the first example that does not start with manually written WAT files. The WASM guest program is compiled from Go using the [tinygo](https://tinygo.org/) compiler. This is also the first example to show host side WASI configuration, tinygo (even with the wasm target) will import `fd_write`. This requires the host to supply WASI functionality through exports. Using wasmtime-go `NewWasiConfig` our host can supply its input and output streams to the guest.

The guest program is a collection of Fibonacci calculations to be run from the host.

To run:
```bash
cd fibonacci
make build
cd ..
go build
./fibonaccidemo --input 10 --export iterative_
```

The fibonacci.go exports the following functions to use with `--export` argument (see the `//export` comments in the Go file):
- iterative_
- recursive_
- cached_recursive_
- tail_recursive_
- fast_doubling_
- closed_form_
- matrix_

## Lesson 5

Demonstrates an [Extism](https://extism.org/) plugin and host program.

The guest program is an MD5 hash algorithm and API: `md5_init_`, `md5_update_`, and `md5_final_`. There is an associated main.go for verification (this ideally should be unit tests or WAST, but for sake of ease the code was adapted to a Go main program).

Prerequisites:
- Extism CLI: https://extism.org/docs/install
- Extism SDK: `extism install latest`

The md5.go guest uses the Extism go-pdk (Plugin Development Kit). The PDK provides bindings and facilities to access host functions, read input, write output, and access memory. Input is read as byte arrays requiring serialization and deserialization to and from higher order types. The `common.Md5Context` is instantiated from the byte array on input, and returned as a byte array for the host environment.

The host uses the Extism go-sdk for initializing the engine, instantiating the module and plugin, and calling guest side functions. Host functions can also be exported via this SDK if required. CGO is required in order to link to the `libextism` and access some lower functionality.

To run:
```bash
cd plugin
make build
cd ..
go run main.go
```

## Lesson 6

Demonstrate usage of the component-model plugin system.

There are two examples (both using Rust): wasm-component-exports, and wasm-component-imports-exports.

wasm-component-exports:

Using a Rust `cdylib`, a simple guest program implementing basic arithmetic functions is shown. Similar to `math.wat` from lesson 1, the `src/lib.rs` generates `add`, `sub`, and `square` functions. These functions implement the Math trait auto-generated from the WIT interface description. To easily build components wit files are created, wit-bindgen generates binding code, and guest programs implement the interfaces. Serialization and deserialization is handled automatically by the bindings.

To see the macro (`wit_bindgen::generate!` / `bindgen!`) generated code use the `expand` command: `cargo expand`. When run in the plugin directory expand will show the guest component code. When run from the main directory expand will show the bindings and host code.

The developer flow is generally this:
- create wit interface file
- implement lib or command to satisfy bindings
- build wasm
- update wasm to a wasm component

For more details see the `plugin/BUILD` script.

To run:
```bash
cd plugin
bash BUILD
cd ..
cargo run
```

wasm-component-imports-exports:

Use a Rust `cdylib`, a simple message passing system is built from host export/import and guest export/import functionality. The wit describes host functionality to subscribe to a topic and to return the list of current topics. The guest functionality to be satisfied is an init function and a process function to receive a message.

This wit demonstrates using records as complex types, guess exports, host exports, and type usage. As with the former example (wasm-component-exports), using the `cargo expand` command will show generated guest and host code.

To run:
```bash
cd plugin
bash BUILD
cd ..
cargo run
# ctrl-c to exit runtime loop
```
