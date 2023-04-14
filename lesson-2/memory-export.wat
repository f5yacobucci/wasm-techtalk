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
