package main

import (
	"fmt"
	"log"

	wasmtime "github.com/bytecodealliance/wasmtime-go/v7"
)

func main() {
	store := wasmtime.NewStore(wasmtime.NewEngine())
	wasm, err := wasmtime.Wat2Wasm(`
(module

  (memory $memory 1)
  (export "memory" (memory $memory))

  (type (;0;) (func(param i32 i32)))
  (type (;1;) (func(param i32) (result i32)))

  (func $putByte (type 0) (param $offset i32) (param $byte i32)
        local.get $offset
        local.get $byte

        i32.store
  )

  (func $getByte (type 1) (param $offset i32) (result i32)
        local.get $offset

        i32.load
  )

  (export "putByte" (func $putByte))
  (export "getByte" (func $getByte))
)
`)
	if err != nil {
		log.Fatalf("cannot transcode wat to wasm: %w", err)
	}

	module, err := wasmtime.NewModule(store.Engine, wasm)
	if err != nil {
		log.Fatalf("cannot compile wasm module: %w", err)
	}

	instance, err := wasmtime.NewInstance(store, module, []wasmtime.AsExtern{})
	if err != nil {
		log.Fatal("cannot instantiate wasm module: %w", err)
	}

	memory := instance.GetExport(store, "memory").Memory()

	putByte := instance.GetFunc(store, "putByte")
	getByte := instance.GetFunc(store, "getByte")

	if memory.Size(store) != 1 {
		log.Fatal("imported memory should be a single page")
	}
	if memory.DataSize(store) != 0x10000 {
		log.Fatal("a single page memory should be 64k")
	}

	buf := memory.UnsafeData(store)

	for i := 0; i < 16; i++ {
		offset := i * 4
		putval := i * 2

		_, err := putByte.Call(store, offset, putval)
		if err != nil {
			log.Fatalf("failed putting value to store: offset = %d, value = %d", offset, putval)
		}

		gotval, err := getByte.Call(store, offset)
		if err != nil {
			log.Fatalf("failed getting value from store: offset = %d", offset)
		}

		exportval := buf[offset]
		fmt.Printf("put byte %d at offset %d\n", putval, offset)
		fmt.Printf("got byte %d at offset %d\n", gotval, offset)
		fmt.Printf("read mem %d at offset %d\n", exportval, offset)

		buf[offset] = exportval * 2
		setval, err := getByte.Call(store, offset)
		if err != nil {
			log.Fatalf("failed getting value from store after set: offset = %d", offset)
		}
		fmt.Printf("set mem  %d at offset %d\n\n", setval, offset)
	}
}
