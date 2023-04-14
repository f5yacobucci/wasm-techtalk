package main

import (
	"fmt"
	"log"

	"example.com/extismdemo/common"

	"github.com/extism/extism"
)

/*
#cgo LDFLAGS: -L/usr/local/bin -lextism
#include <extism.h>
*/

func main() {
	inputs := []string{
		"Jaded zombies acted quaintly but kept driving their oxen forward.",
		" ",
		"Tiny hummingbirds sip nectar, hover with precision, and gracefully fly, displaying their agility and beauty.",
	}
	md5Ctx := common.Md5Context{}
	ctx := extism.NewContext()

	// Can add host functions here
	plugin, err := ctx.PluginFromManifest(
		extism.Manifest{
			Wasm: []extism.Wasm{
				extism.WasmFile{
					Path: "./plugin/md5.wasm",
				},
			},
			Timeout: 500,
		},
		nil, // Any host side functions for guest interaction
		true,
	)

	// Can validate guest APIs
	for _, s := range []string{"md5_init_", "md5_update_", "md5_final_"} {
		valid := plugin.FunctionExists(s)
		if !valid {
			log.Fatalf("plugin does not provide symbol - %s", s)
		}
	}

	out, err := plugin.Call("md5_init_", nil)
	if err != nil {
		log.Fatalf("md5_init_ failed with error: %w", err)
	}
	if len(out) == 0 {
		log.Fatal("md5_init_ did not return context buffer")
	}

	err = md5Ctx.From(out)
	if err != nil {
		log.Fatal("cannot store md5 context")
	}
	//fmt.Println("After INIT call:")
	//md5Ctx.Dump()

	// Hash
	var input []byte
	for _, msg := range inputs {
		input := make([]byte, common.CtxLength+1+len(msg))
		md5Ctx.Into(input)
		input[common.CtxLength] = byte(len(msg))
		copy(input[common.CtxLength+1:], []byte(msg))

		out, err = plugin.Call("md5_update_", input)
		if err != nil {
			log.Fatalf("md5_update_ failed with error: %w", err)
		}
		if len(out) == 0 {
			log.Fatalf("md5_udpate_ did not return update buffer")
		}

		err = md5Ctx.From(out)
		if err != nil {
			log.Fatal("cannot store md5 context after update")
		}
		//fmt.Println("After UPDATE call:")
		//md5Ctx.Dump()
	}

	input = make([]byte, common.CtxLength)
	md5Ctx.Into(input)
	out, err = plugin.Call("md5_final_", input)
	if err != nil {
		log.Fatalf("md5_final_ failed with error: %w", err)
	}
	if len(out) == 0 {
		log.Fatalf("md5_final_ did not return final hash")
	}

	fmt.Println("RESULT:")
	for _, i := range out {
		fmt.Printf("%x", i)
	}
	fmt.Println()
}
