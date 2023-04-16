package main

import (
	"flag"
	"fmt"
	"log"

	wasmtime "github.com/bytecodealliance/wasmtime-go/v7"
)

func main() {
	funcExport := flag.String("export", "", "A WASM function to run")
	inputNum := flag.Int("input", 0, "A non-negative integer")
	flag.Parse()

	config := wasmtime.NewConfig()
	engine := wasmtime.NewEngineWithConfig(config)
	module, err := wasmtime.NewModuleFromFile(engine, "./fibonacci/fibonacci.wasm")
	if err != nil {
		log.Fatalf("cannot compile wasm module: %w", err)
	}

	// Link in WASI (fd_write)
	linker := wasmtime.NewLinker(engine)
	err = linker.DefineWasi()
	if err != nil {
		log.Fatalf("cannot link WASI: %w", err)
	}
	wasiConfig := wasmtime.NewWasiConfig()
	wasiConfig.InheritStdout()
	wasiConfig.InheritStdin()
	wasiConfig.InheritStderr()

	store := wasmtime.NewStore(engine)
	store.SetWasi(wasiConfig)

	instance, err := linker.Instantiate(store, module)
	if err != nil {
		log.Fatalf("cannot instantiate wasm module: %s", err)
	}

	f := instance.GetFunc(store, *funcExport)
	r, err := f.Call(store, *inputNum)
	if err != nil {
		log.Fatalf("failed calling function: '%s', err: %w", *funcExport, err)
	}
	i := r.(int32)
	fmt.Printf("Fibonacci number for %d is %d\n", *inputNum, i)
}
