(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))

  (func $add (type 0) (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs
        local.get $rhs
        i32.add
  )
  (func $subtract (type 0) (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs
        local.get $rhs
        i32.sub
  )
  (func $pow2 (type 1) (param $base i32) (result i32)
        local.get $base
        local.get $base
        i32.mul
  )
  (func $powN (type 0) (param $base i32) (param $exponent i32) (result i32)
        (local $i i32)
        (local $acc i32)

        i32.const 1
        local.set $i

        local.get $base
        local.set $acc

        local.get $exponent
        i32.const 0
        i32.eq
        (if
          (then
            i32.const 1
            return
          )
          (else
            local.get $exponent
            i32.const 1
            i32.eq
            (if
              (then
                local.get $base
                return
              )
              (else
                (loop $power_loop
                      local.get $i
                      i32.const 1
                      i32.add
                      local.set $i

                      local.get $base
                      local.get $acc
                      i32.mul
                      local.set $acc

                      local.get $i
                      local.get $exponent
                      i32.lt_s
                      br_if $power_loop
                )
              )
            )
          )
        )
        local.get $acc
  )
 
  (export "add" (func $add))
  (export "subtract" (func $subtract))
  (export "pow2" (func $pow2))
  (export "powN" (func $powN))
)
