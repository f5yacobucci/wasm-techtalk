
;;  (func $powN (type 2) (param $base i32) (param $exponent i32) (result i64)
;;        (local $i i32)
;;        (local $acc i64)
;;
;;        i32.const 1
;;        local.set $i
;;
;;        local.get $base
;;        i64.extend_i32_s
;;        local.set $acc
;;
;;        local.get $exponent
;;        i32.const 0
;;        i32.eq
;;        (if
;;          (then
;;            i64.const 1
;;            return
;;          )
;;          (else
;;            local.get $exponent
;;            i32.const 1
;;            i32.eq
;;            (if
;;              (then
;;                local.get $base
;;                i64.extend_i32_s
;;                return
;;              )
;;              (else
;;                (loop $power_loop
;;                      local.get $i
;;                      i32.const 1
;;                      i32.add
;;                      local.set $i
;;
;;                      local.get $base
;;                      i64.extend_i32_s
;;                      local.get $acc
;;                      i64.mul
;;                      local.set $acc
;;
;;                      local.get $i
;;                      local.get $exponent
;;                      i32.lt_s
;;                      br_if $power_loop
;;                )
;;              )
;;            )
;;          )
;;        )
;;        
;;        ;;(loop $power_loop
;;        ;;      local.get $i
;;        ;;      i32.const 1
;;        ;;      i32.add
;;        ;;      local.set $i
;;
;;        ;;      local.get $base
;;        ;;      local.get $acc
;;        ;;      i32.mul
;;        ;;      local.set $acc
;;
;;        ;;      local.get $i
;;        ;;      local.get $exponent
;;        ;;      i32.lt_s
;;        ;;      br_if $power_loop
;;        ;;)
;;        local.get $acc
;;  )
