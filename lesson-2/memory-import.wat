(module
  (import "console" "log" (func $log (param i32 i32)))
  (import "js" "mem" (memory 1))
  (data (i32.const 0) "A message from WASM")

  (type (;0;) (func))

  (func $writeMsgFromWasm (type 0)
        i32.const 0
        i32.const 19
        call $log
  )

  (export "writeMsgFromWasm" (func $writeMsgFromWasm))
)
