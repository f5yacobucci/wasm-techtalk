(component
  (type (;0;)
    (instance
      (type (;0;) u32)
      (export (;1;) "input-stream" (type (eq 0)))
      (type (;2;) (func (param "this" 1)))
      (export (;0;) "drop-input-stream" (func (type 2)))
      (type (;3;) u32)
      (export (;4;) "output-stream" (type (eq 3)))
      (type (;5;) (list u8))
      (type (;6;) (record))
      (export (;7;) "stream-error" (type (eq 6)))
      (type (;8;) (result u64 (error 7)))
      (type (;9;) (func (param "this" 4) (param "buf" 5) (result 8)))
      (export (;1;) "write" (func (type 9)))
      (export (;2;) "blocking-write" (func (type 9)))
      (type (;10;) (func (param "this" 4)))
      (export (;3;) "drop-output-stream" (func (type 10)))
    )
  )
  (import "streams" "path:/io/streams/streams" (instance (;0;) (type 0)))
  (alias export 0 "output-stream" (type (;1;)))
  (type (;2;)
    (instance
      (type (;0;) u32)
      (export (;1;) "descriptor" (type (eq 0)))
      (type (;2;) u64)
      (export (;3;) "filesize" (type (eq 2)))
      (alias outer 1 1 (type (;4;)))
      (export (;5;) "output-stream" (type (eq 4)))
      (type (;6;) (func (param "this" 1) (param "offset" 3) (result 5)))
      (export (;0;) "write-via-stream" (func (type 6)))
      (type (;7;) (func (param "this" 1) (result 5)))
      (export (;1;) "append-via-stream" (func (type 7)))
      (type (;8;) (enum "unknown" "block-device" "character-device" "directory" "fifo" "symbolic-link" "regular-file" "socket"))
      (export (;9;) "descriptor-type" (type (eq 8)))
      (type (;10;) (enum "access" "would-block" "already" "bad-descriptor" "busy" "deadlock" "quota" "exist" "file-too-large" "illegal-byte-sequence" "in-progress" "interrupted" "invalid" "io" "is-directory" "loop" "too-many-links" "message-size" "name-too-long" "no-device" "no-entry" "no-lock" "insufficient-memory" "insufficient-space" "not-directory" "not-empty" "not-recoverable" "unsupported" "no-tty" "no-such-device" "overflow" "not-permitted" "pipe" "read-only" "invalid-seek" "text-file-busy" "cross-device"))
      (export (;11;) "error-code" (type (eq 10)))
      (type (;12;) (result 9 (error 11)))
      (type (;13;) (func (param "this" 1) (result 12)))
      (export (;2;) "get-type" (func (type 13)))
      (type (;14;) (func (param "this" 1)))
      (export (;3;) "drop-descriptor" (func (type 14)))
    )
  )
  (import "filesystem" "path:/filesystem/filesystem/filesystem" (instance (;1;) (type 2)))
  (alias export 0 "input-stream" (type (;3;)))
  (alias export 0 "output-stream" (type (;4;)))
  (alias export 1 "descriptor" (type (;5;)))
  (type (;6;)
    (instance
      (alias outer 1 3 (type (;0;)))
      (export (;1;) "input-stream" (type (eq 0)))
      (alias outer 1 4 (type (;2;)))
      (export (;3;) "output-stream" (type (eq 2)))
      (type (;4;) (record (field "stdin" 1) (field "stdout" 3) (field "stderr" 3)))
      (export (;5;) "stdio-preopens" (type (eq 4)))
      (type (;6;) (func (result 5)))
      (export (;0;) "get-stdio" (func (type 6)))
      (alias outer 1 5 (type (;7;)))
      (export (;8;) "descriptor" (type (eq 7)))
      (type (;9;) (tuple 8 string))
      (type (;10;) (list 9))
      (type (;11;) (func (result 10)))
      (export (;1;) "get-directories" (func (type 11)))
    )
  )
  (import "preopens" "path:/wasi-base/preopens/preopens" (instance (;2;) (type 6)))
  (core module (;0;)
    (type $.rodata (;0;) (func (param i32)))
    (type $.data (;1;) (func))
    (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;3;) (func (param i32 i32)))
    (type (;4;) (func (result i32)))
    (type (;5;) (func (param i32 i32) (result i32)))
    (type (;6;) (func (param i32) (result i32)))
    (type (;7;) (func (param i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32)))
    (type (;8;) (func (param i32 i32 i32)))
    (type (;9;) (func (param i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)))
    (type (;10;) (func (param i32 i32 i32 i32 i32 i32)))
    (type (;11;) (func (param i32 i32 i32 i32)))
    (type (;12;) (func (param i64 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
    (type (;13;) (func (param i64 i32 i32 i32 i32 i32 i32) (result i32)))
    (import "wasi_snapshot_preview1" "fd_write" (func $runtime.fd_write (;0;) (type 2)))
    (func $__wasm_call_ctors (;1;) (type $.data)
      nop
    )
    (func $tinygo_getCurrentStackPointer (;2;) (type 4) (result i32)
      global.get $__stack_pointer
    )
    (func $tinygo_unwind (;3;) (type $.rodata) (param i32)
      i32.const 65840
      i32.load8_u
      if ;; label = @1
        call $asyncify_stop_rewind
        i32.const 65840
        i32.const 0
        i32.store8
      else
        local.get 0
        global.get $__stack_pointer
        i32.store offset=4
        local.get 0
        call $asyncify_start_unwind
      end
    )
    (func $tinygo_launch (;4;) (type $.rodata) (param i32)
      (local i32)
      global.get $__stack_pointer
      local.set 1
      local.get 0
      i32.load offset=12
      global.set $__stack_pointer
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load
      call_indirect (type $.rodata)
      call $asyncify_stop_unwind
      local.get 1
      global.set $__stack_pointer
    )
    (func $tinygo_rewind (;5;) (type $.rodata) (param i32)
      (local i32 i32 i32)
      global.get $__stack_pointer
      local.set 1
      local.get 0
      i32.load offset=12
      global.set $__stack_pointer
      local.get 0
      i32.load offset=4
      local.set 2
      local.get 0
      i32.load
      local.set 3
      i32.const 65840
      i32.const 1
      i32.store8
      local.get 0
      i32.const 8
      i32.add
      call $asyncify_start_rewind
      local.get 2
      local.get 3
      call_indirect (type $.rodata)
      call $asyncify_stop_unwind
      local.get 1
      global.set $__stack_pointer
    )
    (func $abort (;6;) (type $.data)
      unreachable
    )
    (func $internal/task.Pause (;7;) (type $.data)
      (local i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 0
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 1
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          i32.const 65844
          i32.load
          local.tee 0
          i32.eqz
          local.set 2
        end
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 2
                br_if 1 (;@4;)
                local.get 0
                i32.const 28
                i32.add
                local.tee 0
                i32.load
                i32.load
                i32.const -1204030091
                i32.ne
                br_if 2 (;@3;)
              end
              local.get 1
              i32.const 0
              global.get 1
              select
              i32.eqz
              if ;; label = @5
                local.get 0
                call $tinygo_unwind
                i32.const 0
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                i32.const 65844
                i32.load
                local.tee 0
                br_if 3 (;@2;)
              end
            end
            local.get 1
            i32.const 1
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              call $runtime.nilPanic
              i32.const 1
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              unreachable
            end
          end
          local.get 1
          i32.const 2
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            i32.const 65536
            i32.const 14
            call $runtime.runtimePanic.llvm.17335636212724678214
            i32.const 2
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          i32.const 28
          i32.add
          i32.load
          i32.const -1204030091
          i32.store
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.nilPanic (;8;) (type $.data)
      (local i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if (result i32) ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
        else
          i32.const 0
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65682
          i32.const 23
          call $runtime.runtimePanic.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.runtimePanic.llvm.17335636212724678214 (;9;) (type 3) (param i32 i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 8
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 1
        i32.load
        local.set 0
        local.get 1
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        block (result i32) ;; label = @2
          global.get 1
          i32.const 2
          i32.eq
          if ;; label = @3
            global.get 2
            global.get 2
            i32.load
            i32.const 4
            i32.sub
            i32.store
            global.get 2
            i32.load
            i32.load
            local.set 2
          end
          local.get 2
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65660
          i32.const 22
          call $runtime.printstring.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        local.get 2
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 0
          local.get 1
          call $runtime.printstring.llvm.17335636212724678214
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        local.get 2
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.printnl.llvm.17335636212724678214
          i32.const 2
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.add
      i32.store
    )
    (func $#func10<_encoding/binary.littleEndian_.Uint32> (@name "(encoding/binary.littleEndian).Uint32") (;10;) (type 5) (param i32 i32) (result i32)
      (local i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 2
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          i32.const 4
          i32.ge_u
          if ;; label = @3
            local.get 0
            i32.load align=1
            return
          end
        end
        local.get 2
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          call $runtime.lookupPanic.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        unreachable
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      i32.const 0
    )
    (func $runtime.lookupPanic.llvm.17335636212724678214 (;11;) (type $.data)
      (local i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if (result i32) ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
        else
          i32.const 0
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65705
          i32.const 18
          call $runtime.runtimePanic.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $md5_init (;12;) (type $.rodata) (param i32)
      (local i32 i32 i32 i32 i32 i32 i64 i32 i64 i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const -64
        i32.add
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=8
        local.set 2
        local.get 3
        i32.load offset=16
        local.set 5
        local.get 3
        i64.load offset=20 align=4
        local.set 7
        local.get 3
        i32.load offset=28
        local.set 8
        local.get 3
        i64.load offset=32 align=4
        local.set 9
        local.get 3
        i32.load offset=40
        local.set 10
        local.get 3
        i32.load offset=44
        local.set 11
        local.get 3
        i32.load offset=48
        local.set 12
        local.get 3
        i32.load offset=52
        local.set 13
        local.get 3
        i32.load offset=56
        local.set 14
        local.get 3
        i32.load offset=60
        local.set 15
        local.get 3
        i32.load offset=12
        local.set 4
        local.get 3
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 6
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 544
          i32.sub
          local.tee 1
          global.set $__stack_pointer
          local.get 1
          i32.const 33
          i32.store offset=404
          local.get 1
          i32.const 408
          i32.add
          i32.const 0
          i32.const 132
          memory.fill
          local.get 1
          i32.const 66028
          i32.load
          local.tee 8
          i32.store offset=400
          i32.const 66028
          local.get 1
          i32.const 400
          i32.add
          local.tee 4
          i32.store
          i32.const 0
          local.set 5
        end
        local.get 6
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 64
          call $runtime.alloc.llvm.17335636212724678214
          local.set 3
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 3
          local.set 4
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 4
          i32.store offset=416
          local.get 1
          local.get 4
          i32.store offset=420
          local.get 1
          local.get 4
          i32.store offset=412
          local.get 1
          local.get 4
          i32.store offset=432
          local.get 1
          local.get 4
          i32.store offset=428
          local.get 1
          local.get 4
          i32.store offset=424
          local.get 1
          local.get 4
          i32.store offset=408
          i64.const 0
          local.set 7
          local.get 1
          i32.const 360
          i32.add
          local.set 2
        end
        local.get 6
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 2
          i32.const 0
          i64.const 0
          i32.const 1732584193
          i32.const -271733879
          i32.const -1732584194
          i32.const 271733878
          local.get 4
          i32.const 64
          i32.const 64
          i32.const 0
          call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 4
          i32.store offset=440
          local.get 1
          local.get 1
          i32.load offset=384
          i32.store offset=436
          local.get 1
          i64.load offset=360
          local.set 9
          local.get 1
          i32.const 320
          i32.add
          local.set 2
        end
        local.get 6
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 2
          i32.const 0
          i64.const 0
          i32.const 1732584193
          i32.const -271733879
          i32.const -1732584194
          i32.const 271733878
          local.get 4
          i32.const 64
          i32.const 64
          i32.const 0
          call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
          i32.const 2
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 4
          i32.store offset=448
          local.get 1
          local.get 1
          i32.load offset=344
          i32.store offset=444
          local.get 1
          i32.load offset=328
          local.set 10
          local.get 1
          i32.const 280
          i32.add
          local.set 2
        end
        local.get 6
        i32.const 3
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 2
          i32.const 0
          i64.const 0
          i32.const 1732584193
          i32.const -271733879
          i32.const -1732584194
          i32.const 271733878
          local.get 4
          i32.const 64
          i32.const 64
          i32.const 0
          call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
          i32.const 3
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 4
          i32.store offset=456
          local.get 1
          local.get 1
          i32.load offset=304
          i32.store offset=452
          local.get 1
          i32.load offset=292
          local.set 11
          local.get 1
          i32.const 240
          i32.add
          local.set 2
        end
        local.get 6
        i32.const 4
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 2
          i32.const 0
          i64.const 0
          i32.const 1732584193
          i32.const -271733879
          i32.const -1732584194
          i32.const 271733878
          local.get 4
          i32.const 64
          i32.const 64
          i32.const 0
          call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
          i32.const 4
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 4
          i32.store offset=464
          local.get 1
          local.get 1
          i32.load offset=264
          i32.store offset=460
          local.get 1
          i32.load offset=256
          local.set 12
          local.get 1
          i32.const 200
          i32.add
          local.set 2
        end
        local.get 6
        i32.const 5
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 2
          i32.const 0
          i64.const 0
          i32.const 1732584193
          i32.const -271733879
          i32.const -1732584194
          i32.const 271733878
          local.get 4
          i32.const 64
          i32.const 64
          i32.const 0
          call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
          i32.const 5
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 4
          i32.store offset=472
          local.get 1
          local.get 1
          i32.load offset=224
          i32.store offset=468
          local.get 1
          i32.load offset=220
          local.set 13
          local.get 1
          i32.const 160
          i32.add
          local.set 2
        end
        local.get 6
        i32.const 6
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 2
          i32.const 0
          i64.const 0
          i32.const 1732584193
          i32.const -271733879
          i32.const -1732584194
          i32.const 271733878
          local.get 4
          i32.const 64
          i32.const 64
          i32.const 0
          call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
          i32.const 6
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 1
          i32.load offset=184
          i32.store offset=476
          local.get 1
          i32.load offset=188
          i32.eqz
          local.set 2
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 2
            br_if 1 (;@2;)
            local.get 1
            local.get 4
            i32.store offset=488
            local.get 1
            i32.const 120
            i32.add
            local.set 5
          end
          local.get 6
          i32.const 7
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            local.get 5
            i32.const 0
            i64.const 0
            i32.const 1732584193
            i32.const -271733879
            i32.const -1732584194
            i32.const 271733878
            local.get 4
            i32.const 64
            i32.const 64
            i32.const 0
            call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
            i32.const 7
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 1
            local.get 1
            i32.load offset=144
            i32.store offset=492
            local.get 1
            i32.load offset=148
            local.set 5
          end
          local.get 6
          i32.const 8
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            local.get 5
            call $malloc
            local.set 3
            i32.const 8
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
            local.get 3
            local.set 5
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 1
            local.get 5
            i32.store offset=520
            local.get 1
            local.get 5
            i32.store offset=524
            local.get 1
            local.get 5
            i32.store offset=500
            local.get 1
            local.get 4
            i32.store offset=504
            local.get 1
            local.get 5
            i32.store offset=496
            local.get 1
            i32.const 80
            i32.add
            local.set 2
          end
          local.get 6
          i32.const 9
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            local.get 2
            i32.const 0
            i64.const 0
            i32.const 1732584193
            i32.const -271733879
            i32.const -1732584194
            i32.const 271733878
            local.get 4
            i32.const 64
            i32.const 64
            i32.const 0
            call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
            i32.const 9
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 1
            local.get 4
            i32.store offset=512
            local.get 1
            local.get 1
            i32.load offset=104
            i32.store offset=508
            local.get 1
            i32.load offset=108
            local.set 14
            local.get 1
            i32.const 40
            i32.add
            local.set 2
          end
          local.get 6
          i32.const 10
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            local.get 2
            i32.const 0
            i64.const 0
            i32.const 1732584193
            i32.const -271733879
            i32.const -1732584194
            i32.const 271733878
            local.get 4
            i32.const 64
            i32.const 64
            i32.const 0
            call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
            i32.const 10
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 1
            local.get 1
            i32.load offset=64
            i32.store offset=516
            local.get 1
            i32.load offset=68
            local.tee 2
            i32.const 0
            i32.gt_s
            local.set 3
            local.get 2
            i32.const 0
            local.get 3
            select
            local.set 15
            i32.const 0
            local.set 2
          end
          loop ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 2
              local.get 15
              i32.eq
              if ;; label = @5
                local.get 14
                i64.extend_i32_u
                i64.const 32
                i64.shl
                local.set 7
                br 3 (;@2;)
              end
              local.get 1
              local.get 4
              i32.store offset=528
            end
            local.get 6
            i32.const 11
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              local.get 1
              i32.const 0
              i64.const 0
              i32.const 1732584193
              i32.const -271733879
              i32.const -1732584194
              i32.const 271733878
              local.get 4
              i32.const 64
              i32.const 64
              i32.const 0
              call $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_>
              i32.const 11
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 1
              local.get 1
              i32.load offset=24
              local.tee 3
              i32.store offset=532
              local.get 2
              local.get 1
              i32.load offset=28
              i32.lt_u
              if ;; label = @5
                local.get 2
                local.get 5
                i32.add
                local.get 2
                local.get 3
                i32.add
                i32.load8_u
                i32.store8
                local.get 2
                i32.const 1
                i32.add
                local.set 2
                br 2 (;@3;)
              end
            end
          end
          local.get 6
          i32.const 12
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.lookupPanic.llvm.17335636212724678214
            i32.const 12
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 5
          i32.store offset=480
          local.get 1
          local.get 5
          i32.store offset=484
          local.get 0
          if ;; label = @3
            local.get 0
            local.get 9
            i64.store offset=8
            local.get 0
            i32.const 0
            i32.store8
            i32.const 66028
            local.get 8
            i32.store
            local.get 0
            local.get 5
            i64.extend_i32_u
            local.get 7
            i64.or
            i64.store offset=32
            local.get 0
            local.get 10
            i64.extend_i32_u
            local.get 11
            i64.extend_i32_u
            i64.const 32
            i64.shl
            i64.or
            i64.store offset=16
            local.get 0
            local.get 12
            i64.extend_i32_u
            local.get 13
            i64.extend_i32_u
            i64.const 32
            i64.shl
            i64.or
            i64.store offset=24
            local.get 1
            i32.const 544
            i32.add
            global.set $__stack_pointer
            return
          end
        end
        local.get 6
        i32.const 13
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.nilPanic
          i32.const 13
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 3
      local.get 2
      i32.store offset=8
      local.get 3
      local.get 4
      i32.store offset=12
      local.get 3
      local.get 5
      i32.store offset=16
      local.get 3
      local.get 7
      i64.store offset=20 align=4
      local.get 3
      local.get 8
      i32.store offset=28
      local.get 3
      local.get 9
      i64.store offset=32 align=4
      local.get 3
      local.get 10
      i32.store offset=40
      local.get 3
      local.get 11
      i32.store offset=44
      local.get 3
      local.get 12
      i32.store offset=48
      local.get 3
      local.get 13
      i32.store offset=52
      local.get 3
      local.get 14
      i32.store offset=56
      local.get 3
      local.get 15
      i32.store offset=60
      global.get 2
      global.get 2
      i32.load
      i32.const -64
      i32.sub
      i32.store
    )
    (func $runtime.alloc.llvm.17335636212724678214 (;13;) (type 6) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 28
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=12
        local.set 4
        local.get 3
        i32.load offset=16
        local.set 5
        local.get 3
        i32.load offset=20
        local.set 6
        local.get 3
        i32.load offset=24
        local.set 7
        local.get 3
        i32.load offset=8
        local.set 2
        local.get 3
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 8
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          i32.eqz
          if ;; label = @3
            i32.const 66024
            return
          end
          i32.const 66000
          i32.const 66000
          i64.load
          local.get 0
          i64.extend_i32_u
          i64.add
          i64.store
          i32.const 66008
          i32.const 66008
          i64.load
          i64.const 1
          i64.add
          i64.store
          local.get 0
          i32.const 15
          i32.add
          i32.const 4
          i32.shr_u
          local.set 7
          i32.const 65988
          i32.load
          local.tee 4
          local.set 5
          i32.const 0
          local.set 6
          i32.const 0
          local.set 2
        end
        loop ;; label = @2
          local.get 1
          local.get 4
          local.get 5
          i32.eq
          global.get 1
          select
          local.set 1
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 2
                      local.set 1
                      br 2 (;@6;)
                    end
                    local.get 2
                    i32.const 255
                    i32.and
                    local.set 4
                    i32.const 1
                    local.set 1
                  end
                  block ;; label = @7
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      block ;; label = @9
                        local.get 4
                        br_table 3 (;@6;) 0 (;@9;) 2 (;@7;)
                      end
                      i32.const 66028
                      i32.load
                      drop
                      i32.const 65844
                      i32.load
                      local.set 2
                    end
                    block ;; label = @8
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 2
                        br_if 1 (;@8;)
                        call $tinygo_getCurrentStackPointer
                        local.set 2
                      end
                      local.get 8
                      i32.const 0
                      global.get 1
                      select
                      i32.eqz
                      if ;; label = @9
                        local.get 2
                        i32.const 65536
                        call $runtime.markRoots
                        i32.const 0
                        global.get 1
                        i32.const 1
                        i32.eq
                        br_if 8 (;@1;)
                        drop
                      end
                    end
                    local.get 8
                    i32.const 1
                    i32.eq
                    i32.const 1
                    global.get 1
                    select
                    if ;; label = @8
                      i32.const 65536
                      i32.const 66368
                      call $runtime.markRoots
                      i32.const 1
                      global.get 1
                      i32.const 1
                      i32.eq
                      br_if 7 (;@1;)
                      drop
                    end
                    loop ;; label = @8
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        i32.const 66025
                        i32.load8_u
                        i32.eqz
                        if ;; label = @10
                          i32.const 0
                          local.set 2
                          i32.const 0
                          local.set 4
                          i32.const 0
                          local.set 1
                          loop ;; label = @11
                            block ;; label = @12
                              block ;; label = @13
                                local.get 1
                                i32.const 65992
                                i32.load
                                i32.lt_u
                                if ;; label = @14
                                  block ;; label = @15
                                    block ;; label = @16
                                      block ;; label = @17
                                        block ;; label = @18
                                          local.get 1
                                          call $#func28<_runtime.gcBlock_.state>
                                          i32.const 255
                                          i32.and
                                          br_table 3 (;@15;) 0 (;@18;) 1 (;@17;) 2 (;@16;) 6 (;@12;)
                                        end
                                        local.get 1
                                        call $#func29<_runtime.gcBlock_.markFree>
                                        i32.const 66016
                                        i32.const 66016
                                        i64.load
                                        i64.const 1
                                        i64.add
                                        i64.store
                                        br 4 (;@13;)
                                      end
                                      local.get 4
                                      i32.const 1
                                      i32.and
                                      local.set 3
                                      i32.const 0
                                      local.set 4
                                      local.get 3
                                      i32.eqz
                                      br_if 4 (;@12;)
                                      local.get 1
                                      call $#func29<_runtime.gcBlock_.markFree>
                                      br 3 (;@13;)
                                    end
                                    i32.const 0
                                    local.set 4
                                    i32.const 65984
                                    i32.load
                                    local.get 1
                                    i32.const 2
                                    i32.shr_u
                                    i32.add
                                    local.tee 3
                                    i32.load8_u
                                    i32.const 2
                                    local.get 1
                                    i32.const 1
                                    i32.shl
                                    i32.const 6
                                    i32.and
                                    i32.shl
                                    i32.const -1
                                    i32.xor
                                    i32.and
                                    local.set 9
                                    local.get 3
                                    local.get 9
                                    i32.store8
                                    br 3 (;@12;)
                                  end
                                  local.get 2
                                  i32.const 16
                                  i32.add
                                  local.set 2
                                  br 2 (;@12;)
                                end
                                i32.const 2
                                local.set 1
                                i32.const 65984
                                i32.load
                                i32.const 66368
                                i32.sub
                                i32.const 3
                                i32.div_u
                                local.get 2
                                i32.le_u
                                br_if 7 (;@6;)
                                call $runtime.growHeap
                                drop
                                br 7 (;@6;)
                              end
                              local.get 2
                              i32.const 16
                              i32.add
                              local.set 2
                              i32.const 1
                              local.set 4
                            end
                            local.get 1
                            i32.const 1
                            i32.add
                            local.set 1
                            br 0 (;@11;)
                          end
                          unreachable
                        end
                        i32.const 66025
                        i32.const 0
                        i32.store8
                        i32.const 65992
                        i32.load
                        local.set 2
                        i32.const 0
                        local.set 1
                      end
                      loop ;; label = @9
                        global.get 1
                        i32.eqz
                        if ;; label = @10
                          local.get 1
                          local.get 2
                          i32.ge_u
                          local.tee 4
                          br_if 2 (;@8;)
                          local.get 1
                          call $#func28<_runtime.gcBlock_.state>
                          i32.const 255
                          i32.and
                          i32.const 3
                          i32.ne
                          local.set 4
                        end
                        global.get 1
                        i32.const 1
                        local.get 4
                        select
                        if ;; label = @10
                          local.get 8
                          i32.const 2
                          i32.eq
                          i32.const 1
                          global.get 1
                          select
                          if ;; label = @11
                            local.get 1
                            call $runtime.startMark
                            i32.const 2
                            global.get 1
                            i32.const 1
                            i32.eq
                            br_if 10 (;@1;)
                            drop
                          end
                          global.get 1
                          if (result i32) ;; label = @11
                            local.get 2
                          else
                            i32.const 65992
                            i32.load
                          end
                          local.set 2
                        end
                        global.get 1
                        i32.eqz
                        if ;; label = @10
                          local.get 1
                          i32.const 1
                          i32.add
                          local.set 1
                          br 1 (;@9;)
                        end
                      end
                    end
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 2
                    local.set 1
                    call $runtime.growHeap
                    i32.const 1
                    i32.and
                    i32.eqz
                    br_if 2 (;@5;)
                  end
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  i32.const 65992
                  i32.load
                  local.get 5
                  i32.eq
                  if ;; label = @7
                    i32.const 0
                    local.set 5
                    br 3 (;@4;)
                  end
                  local.get 5
                  call $#func28<_runtime.gcBlock_.state>
                  i32.const 255
                  i32.and
                  if ;; label = @7
                    local.get 5
                    i32.const 1
                    i32.add
                    local.set 5
                    br 3 (;@4;)
                  end
                  local.get 5
                  i32.const 1
                  i32.add
                  local.set 2
                  local.get 6
                  i32.const 1
                  i32.add
                  local.tee 6
                  local.get 7
                  i32.ne
                  if ;; label = @7
                    local.get 2
                    local.set 5
                    br 4 (;@3;)
                  end
                  i32.const 65988
                  local.get 2
                  i32.store
                  local.get 2
                  local.get 7
                  i32.sub
                  local.tee 2
                  i32.const 1
                  call $#func32<_runtime.gcBlock_.setState>
                  local.get 5
                  local.get 7
                  i32.sub
                  i32.const 2
                  i32.add
                  local.set 1
                  loop ;; label = @7
                    local.get 1
                    i32.const 65988
                    i32.load
                    i32.ne
                    if ;; label = @8
                      local.get 1
                      i32.const 2
                      call $#func32<_runtime.gcBlock_.setState>
                      local.get 1
                      i32.const 1
                      i32.add
                      local.set 1
                      br 1 (;@7;)
                    end
                  end
                  local.get 2
                  i32.const 4
                  i32.shl
                  i32.const 66368
                  i32.add
                  local.tee 1
                  i32.const 0
                  local.get 0
                  memory.fill
                  local.get 1
                  return
                end
              end
              local.get 8
              i32.const 3
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                i32.const 65640
                i32.const 13
                call $runtime.runtimePanic.llvm.17335636212724678214
                i32.const 3
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                unreachable
              end
            end
            local.get 6
            i32.const 0
            global.get 1
            select
            local.set 6
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            i32.const 65988
            i32.load
            local.set 4
            local.get 1
            local.set 2
            br 1 (;@2;)
          end
        end
        unreachable
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 3
      local.get 2
      i32.store offset=8
      local.get 3
      local.get 4
      i32.store offset=12
      local.get 3
      local.get 5
      i32.store offset=16
      local.get 3
      local.get 6
      i32.store offset=20
      local.get 3
      local.get 7
      i32.store offset=24
      global.get 2
      global.get 2
      i32.load
      i32.const 28
      i32.add
      i32.store
      i32.const 0
    )
    (func $#func14<_example.com/md5component/md5.Result_example.com/md5component/md5.Md5Context__example.com/md5component/md5.Md5Errno__.Unwrap_example.com/md5component/md5.Md5Context_example.com/md5component/md5.Md5Errno_> (@name "(example.com/md5component/md5.Result[example.com/md5component/md5.Md5Context, example.com/md5component/md5.Md5Errno]).Unwrap[example.com/md5component/md5.Md5Context example.com/md5component/md5.Md5Errno]") (;14;) (type 7) (param i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 40
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 9
        i32.load
        local.set 0
        local.get 9
        i64.load offset=4 align=4
        local.set 2
        local.get 9
        i32.load offset=12
        local.set 3
        local.get 9
        i32.load offset=16
        local.set 4
        local.get 9
        i32.load offset=20
        local.set 5
        local.get 9
        i32.load offset=24
        local.set 6
        local.get 9
        i32.load offset=28
        local.set 7
        local.get 9
        i32.load offset=32
        local.set 8
        local.get 9
        i32.load offset=36
        local.set 9
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 11
        end
        global.get 1
        i32.const 1
        local.get 1
        local.get 1
        i32.eqz
        global.get 1
        select
        select
        if ;; label = @2
          local.get 11
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            i32.const 65568
            call $runtime._panic.llvm.17335636212724678214
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          local.get 2
          i64.store
          local.get 0
          local.get 3
          i32.store offset=8
          local.get 0
          local.get 4
          i32.store offset=12
          local.get 0
          local.get 5
          i32.store offset=16
          local.get 0
          local.get 6
          i32.store offset=20
          local.get 0
          local.get 7
          i32.store offset=24
          local.get 0
          local.get 8
          i32.store offset=28
          local.get 0
          local.get 9
          i32.store offset=32
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 1
      local.get 0
      i32.store
      local.get 1
      local.get 2
      i64.store offset=4 align=4
      local.get 1
      local.get 3
      i32.store offset=12
      local.get 1
      local.get 4
      i32.store offset=16
      local.get 1
      local.get 5
      i32.store offset=20
      local.get 1
      local.get 6
      i32.store offset=24
      local.get 1
      local.get 7
      i32.store offset=28
      local.get 1
      local.get 8
      i32.store offset=32
      local.get 1
      local.get 9
      i32.store offset=36
      global.get 2
      global.get 2
      i32.load
      i32.const 40
      i32.add
      i32.store
    )
    (func $malloc (;15;) (type 6) (param i32) (result i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 16
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=12
        local.set 4
        local.get 2
        i32.load offset=8
        local.set 3
        local.get 2
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 5
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 32
          i32.sub
          local.tee 1
          global.set $__stack_pointer
          local.get 1
          i32.const 2
          i32.store offset=20
          i32.const 66028
          i32.load
          local.set 4
          i32.const 66028
          local.get 1
          i32.const 16
          i32.add
          i32.store
          local.get 1
          local.get 4
          i32.store offset=16
          local.get 0
          i32.eqz
          local.set 6
          i32.const 0
          local.set 3
        end
        block ;; label = @2
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 6
              br_if 1 (;@3;)
              local.get 0
              i32.const 0
              i32.lt_s
              local.tee 3
              br_if 2 (;@2;)
            end
            local.get 5
            i32.const 0
            global.get 1
            select
            i32.eqz
            if ;; label = @4
              local.get 0
              call $runtime.alloc.llvm.17335636212724678214
              local.set 2
              i32.const 0
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
              local.get 2
              local.set 3
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 1
              local.get 3
              i32.store offset=24
              local.get 1
              local.get 3
              i32.store offset=28
              local.get 1
              local.get 0
              i32.store offset=8
              local.get 1
              local.get 0
              i32.store offset=4
              local.get 1
              local.get 3
              i32.store
              local.get 1
              local.get 3
              i32.store offset=12
              local.get 1
              i32.const 12
              i32.add
              local.set 0
            end
            local.get 5
            i32.const 1
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              local.get 0
              local.get 1
              call $runtime.hashmapBinarySet.llvm.17335636212724678214
              i32.const 1
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            i32.const 66028
            local.get 4
            i32.store
            local.get 1
            i32.const 32
            i32.add
            global.set $__stack_pointer
            local.get 3
            return
          end
        end
        local.get 5
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.slicePanic.llvm.17335636212724678214
          i32.const 2
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        unreachable
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      local.get 2
      local.get 3
      i32.store offset=8
      local.get 2
      local.get 4
      i32.store offset=12
      global.get 2
      global.get 2
      i32.load
      i32.const 16
      i32.add
      i32.store
      i32.const 0
    )
    (func $md5_update (;16;) (type 8) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i64 i32 i64 i64 i32 i32 i32 i32 i64 i64 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 96
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=8
        local.set 2
        local.get 3
        i32.load offset=12
        local.set 4
        local.get 3
        i32.load offset=16
        local.set 5
        local.get 3
        i32.load offset=20
        local.set 6
        local.get 3
        i32.load offset=24
        local.set 7
        local.get 3
        i32.load offset=28
        local.set 9
        local.get 3
        i32.load offset=32
        local.set 8
        local.get 3
        i64.load offset=36 align=4
        local.set 10
        local.get 3
        i64.load offset=44 align=4
        local.set 12
        local.get 3
        i64.load offset=52 align=4
        local.set 13
        local.get 3
        i32.load offset=60
        local.set 14
        local.get 3
        i32.load offset=64
        local.set 15
        local.get 3
        i32.load offset=68
        local.set 16
        local.get 3
        i32.load offset=72
        local.set 17
        local.get 3
        i64.load offset=76 align=4
        local.set 18
        local.get 3
        i64.load offset=84 align=4
        local.set 19
        local.get 3
        i32.load offset=92
        local.set 20
        local.get 3
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 11
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 160
          i32.sub
          local.tee 5
          global.set $__stack_pointer
          local.get 5
          i32.const 17
          i32.store offset=84
          local.get 5
          i32.const 88
          i32.add
          i32.const 0
          i32.const 68
          memory.fill
          local.get 5
          local.get 0
          i32.store offset=48
          local.get 5
          i64.const 0
          i64.store offset=40
          local.get 5
          local.get 1
          i32.store offset=64
          local.get 5
          i32.const 1
          i32.store offset=56
          local.get 5
          i32.const 66028
          i32.load
          local.tee 20
          i32.store offset=80
          i32.const 66028
          local.get 5
          i32.const 80
          i32.add
          i32.store
          local.get 5
          local.get 5
          i32.const 40
          i32.add
          i32.store offset=60
          local.get 0
          i32.eqz
          local.set 6
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 6
            br_if 1 (;@2;)
            local.get 0
            i32.const 28
            i32.add
            i32.load
            local.tee 9
            i32.const 0
            i32.lt_s
            local.set 6
          end
          block ;; label = @3
            block ;; label = @4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 6
                br_if 1 (;@4;)
                local.get 0
                i32.load offset=20
                local.set 14
                local.get 0
                i32.load offset=16
                local.set 15
                local.get 0
                i32.load offset=12
                local.set 16
                local.get 0
                i32.load offset=8
                local.set 17
                local.get 0
                i64.load
                local.set 10
              end
              local.get 11
              i32.const 0
              global.get 1
              select
              i32.eqz
              if ;; label = @5
                local.get 9
                call $runtime.alloc.llvm.17335636212724678214
                local.set 3
                i32.const 0
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 3
                local.set 7
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 5
                local.get 7
                i32.store offset=136
                local.get 5
                local.get 7
                i32.store offset=148
                local.get 5
                local.get 7
                i32.store offset=124
                local.get 5
                local.get 7
                i32.store offset=120
                local.get 5
                local.get 7
                i32.store offset=116
                local.get 5
                local.get 7
                i32.store offset=112
                local.get 5
                local.get 7
                i32.store offset=88
                block ;; label = @6
                  local.get 0
                  i32.load offset=28
                  local.tee 6
                  i32.eqz
                  local.tee 4
                  br_if 0 (;@6;)
                  i32.const 0
                  local.set 4
                  local.get 6
                  i32.const 0
                  local.get 6
                  i32.const 0
                  i32.gt_s
                  select
                  local.set 8
                  loop ;; label = @7
                    local.get 4
                    local.get 8
                    i32.eq
                    br_if 1 (;@6;)
                    local.get 5
                    local.get 0
                    i32.load offset=24
                    local.tee 6
                    i32.store offset=96
                    local.get 5
                    local.get 6
                    i32.store offset=92
                    local.get 4
                    local.get 9
                    i32.eq
                    br_if 4 (;@3;)
                    local.get 4
                    local.get 7
                    i32.add
                    local.get 4
                    local.get 6
                    i32.add
                    i32.load8_u
                    i32.store8
                    local.get 4
                    i32.const 1
                    i32.add
                    local.set 4
                    br 0 (;@7;)
                  end
                  unreachable
                end
                local.get 1
                i32.eqz
                br_if 3 (;@2;)
                local.get 1
                i32.load offset=4
                local.tee 0
                i32.const 0
                i32.lt_s
                local.tee 6
                br_if 1 (;@4;)
              end
              local.get 11
              i32.const 1
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 0
                call $runtime.alloc.llvm.17335636212724678214
                local.set 3
                i32.const 1
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 3
                local.set 8
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 5
                local.get 8
                i32.store offset=100
                block ;; label = @6
                  local.get 1
                  i32.load offset=4
                  local.tee 6
                  i32.eqz
                  local.tee 4
                  br_if 0 (;@6;)
                  i32.const 0
                  local.set 4
                  local.get 6
                  i32.const 0
                  local.get 6
                  i32.const 0
                  i32.gt_s
                  select
                  local.set 3
                  loop ;; label = @7
                    local.get 3
                    local.get 4
                    i32.eq
                    local.tee 6
                    br_if 1 (;@6;)
                    local.get 5
                    local.get 1
                    i32.load
                    local.tee 6
                    i32.store offset=108
                    local.get 5
                    local.get 6
                    i32.store offset=104
                    local.get 0
                    local.get 4
                    i32.eq
                    br_if 4 (;@3;)
                    local.get 4
                    local.get 8
                    i32.add
                    local.get 4
                    local.get 6
                    i32.add
                    i32.load8_u
                    i32.store8
                    local.get 4
                    i32.const 1
                    i32.add
                    local.set 4
                    br 0 (;@7;)
                  end
                  unreachable
                end
                local.get 0
                i64.extend_i32_u
                local.tee 12
                local.get 10
                i64.add
                local.set 18
                local.get 10
                i64.const 63
                i64.and
                local.tee 10
                i64.eqz
                local.set 1
              end
              block (result i32) ;; label = @5
                block ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 1
                    br_if 1 (;@6;)
                    local.get 9
                    i64.extend_i32_u
                    local.set 13
                    local.get 12
                    i64.const 64
                    local.get 10
                    i64.sub
                    local.tee 19
                    i64.lt_u
                    if ;; label = @8
                      local.get 10
                      local.get 13
                      i64.gt_u
                      br_if 4 (;@4;)
                      local.get 7
                      local.get 10
                      i32.wrap_i64
                      local.tee 4
                      i32.add
                      local.set 6
                      local.get 9
                      local.get 4
                      i32.sub
                      local.tee 4
                      local.get 0
                      i32.gt_u
                      local.set 1
                      local.get 6
                      local.get 8
                      local.get 0
                      local.get 4
                      local.get 1
                      select
                      local.tee 0
                      memory.copy
                      local.get 5
                      i32.const 72
                      i32.add
                      br 3 (;@5;)
                    end
                    local.get 10
                    local.get 13
                    i64.gt_u
                    br_if 3 (;@4;)
                    local.get 7
                    local.get 10
                    i32.wrap_i64
                    local.tee 4
                    i32.add
                    local.set 6
                    local.get 9
                    local.get 4
                    i32.sub
                    local.tee 4
                    local.get 0
                    i32.gt_u
                    local.set 1
                    local.get 6
                    local.get 8
                    local.get 0
                    local.get 4
                    local.get 1
                    select
                    memory.copy
                    local.get 5
                    i32.const 24
                    i32.add
                    local.set 1
                  end
                  local.get 11
                  i32.const 2
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 1
                    local.get 18
                    local.get 17
                    local.get 16
                    local.get 15
                    local.get 14
                    local.get 7
                    local.get 9
                    local.get 9
                    local.get 7
                    local.get 9
                    local.get 9
                    i64.const 64
                    call $main.md5Body
                    i32.const 2
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 6 (;@1;)
                    drop
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 5
                    local.get 5
                    i32.load offset=24
                    local.tee 1
                    i32.store offset=128
                    local.get 12
                    local.get 19
                    i64.sub
                    local.set 12
                    local.get 8
                    local.get 19
                    i32.wrap_i64
                    local.tee 4
                    i32.add
                    local.set 8
                    local.get 0
                    local.get 4
                    i32.sub
                    local.set 0
                  end
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 5
                  local.get 8
                  i32.store offset=132
                  local.get 12
                  i64.const 63
                  i64.le_u
                  local.set 1
                end
                block ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 1
                    br_if 1 (;@6;)
                    local.get 12
                    i64.const -64
                    i64.and
                    local.set 13
                    local.get 5
                    i32.const 8
                    i32.add
                    local.set 1
                  end
                  local.get 11
                  i32.const 3
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 1
                    local.get 18
                    local.get 17
                    local.get 16
                    local.get 15
                    local.get 14
                    local.get 7
                    local.get 9
                    local.get 9
                    local.get 8
                    local.get 0
                    local.get 0
                    local.get 13
                    call $main.md5Body
                    i32.const 3
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 6 (;@1;)
                    drop
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 5
                    local.get 5
                    i32.load offset=8
                    local.tee 8
                    i32.store offset=140
                    local.get 5
                    i32.load offset=12
                    local.set 0
                  end
                end
                global.get 1
                if (result i32) ;; label = @6
                  local.get 4
                else
                  local.get 5
                  local.get 8
                  i32.store offset=144
                  local.get 7
                  local.get 8
                  local.get 0
                  local.get 9
                  local.get 0
                  local.get 9
                  i32.lt_u
                  local.tee 1
                  select
                  local.tee 0
                  memory.copy
                  local.get 5
                  i32.const 72
                  i32.add
                end
              end
              local.set 4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 4
                i32.const 0
                i32.store offset=4
                local.get 5
                local.get 4
                i32.store offset=152
                local.get 2
                i32.eqz
                local.tee 0
                br_if 3 (;@2;)
                local.get 2
                i32.const 0
                i32.store16 align=1
                local.get 5
                i32.const 56
                i32.add
                local.set 4
              end
              loop ;; label = @5
                block ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 4
                    i32.eqz
                    br_if 1 (;@6;)
                    local.get 4
                    i32.load offset=4
                    local.set 6
                    local.get 4
                    i32.load
                    local.set 1
                    local.get 4
                    i32.load offset=8
                    local.set 0
                  end
                  block ;; label = @7
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 1
                      br_if 1 (;@7;)
                      local.get 0
                      i32.const 24
                      i32.add
                      local.set 0
                    end
                    local.get 11
                    i32.const 4
                    i32.eq
                    i32.const 1
                    global.get 1
                    select
                    if ;; label = @8
                      local.get 0
                      call $md5_list_u8_free
                      i32.const 4
                      global.get 1
                      i32.const 1
                      i32.eq
                      br_if 7 (;@1;)
                      drop
                    end
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 6
                      local.set 4
                      br 3 (;@5;)
                    end
                  end
                  local.get 11
                  i32.const 5
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 0
                    call $md5_list_u8_free
                    i32.const 5
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 6 (;@1;)
                    drop
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 6
                    local.set 4
                    br 2 (;@5;)
                  end
                end
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                i32.const 66028
                local.get 20
                i32.store
                local.get 5
                i32.const 160
                i32.add
                global.set $__stack_pointer
                return
              end
            end
            local.get 11
            i32.const 6
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              call $runtime.slicePanic.llvm.17335636212724678214
              i32.const 6
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              unreachable
            end
          end
          local.get 11
          i32.const 7
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.lookupPanic.llvm.17335636212724678214
            i32.const 7
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        local.get 11
        i32.const 8
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.nilPanic
          i32.const 8
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 3
      local.get 2
      i32.store offset=8
      local.get 3
      local.get 4
      i32.store offset=12
      local.get 3
      local.get 5
      i32.store offset=16
      local.get 3
      local.get 6
      i32.store offset=20
      local.get 3
      local.get 7
      i32.store offset=24
      local.get 3
      local.get 9
      i32.store offset=28
      local.get 3
      local.get 8
      i32.store offset=32
      local.get 3
      local.get 10
      i64.store offset=36 align=4
      local.get 3
      local.get 12
      i64.store offset=44 align=4
      local.get 3
      local.get 13
      i64.store offset=52 align=4
      local.get 3
      local.get 14
      i32.store offset=60
      local.get 3
      local.get 15
      i32.store offset=64
      local.get 3
      local.get 16
      i32.store offset=68
      local.get 3
      local.get 17
      i32.store offset=72
      local.get 3
      local.get 18
      i64.store offset=76 align=4
      local.get 3
      local.get 19
      i64.store offset=84 align=4
      local.get 3
      local.get 20
      i32.store offset=92
      global.get 2
      global.get 2
      i32.load
      i32.const 96
      i32.add
      i32.store
    )
    (func $main.md5Body (;17;) (type 9) (param i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 24
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=8
        local.set 10
        local.get 2
        i32.load offset=12
        local.set 11
        local.get 2
        i64.load offset=16 align=4
        local.set 12
        local.get 2
        i32.load offset=4
        local.set 9
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 13
        end
        block ;; label = @2
          loop ;; label = @3
            global.get 1
            i32.const 1
            local.get 12
            i64.eqz
            select
            if ;; label = @4
              local.get 13
              i32.const 0
              global.get 1
              select
              i32.eqz
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 0
                call $main._SET
                drop
                i32.const 0
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 1
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 1
                call $main._SET
                drop
                i32.const 1
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 2
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 2
                call $main._SET
                drop
                i32.const 2
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 3
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 3
                call $main._SET
                drop
                i32.const 3
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 4
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 4
                call $main._SET
                drop
                i32.const 4
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 5
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 5
                call $main._SET
                drop
                i32.const 5
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 6
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 6
                call $main._SET
                drop
                i32.const 6
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 7
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 7
                call $main._SET
                drop
                i32.const 7
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 8
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 8
                call $main._SET
                drop
                i32.const 8
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 9
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 9
                call $main._SET
                drop
                i32.const 9
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 10
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 10
                call $main._SET
                drop
                i32.const 10
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 11
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 11
                call $main._SET
                drop
                i32.const 11
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 12
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 12
                call $main._SET
                drop
                i32.const 12
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 13
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 13
                call $main._SET
                drop
                i32.const 13
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 14
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 14
                call $main._SET
                drop
                i32.const 14
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 15
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 15
                call $main._SET
                drop
                i32.const 15
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 16
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 1
                call $main._GET
                drop
                i32.const 16
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 17
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 6
                call $main._GET
                drop
                i32.const 17
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 18
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 11
                call $main._GET
                drop
                i32.const 18
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 19
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 0
                call $main._GET
                drop
                i32.const 19
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 20
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 5
                call $main._GET
                drop
                i32.const 20
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 21
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 10
                call $main._GET
                drop
                i32.const 21
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 22
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 15
                call $main._GET
                drop
                i32.const 22
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 23
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 4
                call $main._GET
                drop
                i32.const 23
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 24
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 9
                call $main._GET
                drop
                i32.const 24
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 25
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 14
                call $main._GET
                drop
                i32.const 25
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 26
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 3
                call $main._GET
                drop
                i32.const 26
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 27
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 8
                call $main._GET
                drop
                i32.const 27
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 28
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 13
                call $main._GET
                drop
                i32.const 28
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 29
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 2
                call $main._GET
                drop
                i32.const 29
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 30
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 7
                call $main._GET
                drop
                i32.const 30
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 31
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 12
                call $main._GET
                drop
                i32.const 31
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 32
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 5
                call $main._GET
                drop
                i32.const 32
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 33
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 8
                call $main._GET
                drop
                i32.const 33
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 34
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 11
                call $main._GET
                drop
                i32.const 34
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 35
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 14
                call $main._GET
                drop
                i32.const 35
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 36
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 1
                call $main._GET
                drop
                i32.const 36
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 37
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 4
                call $main._GET
                drop
                i32.const 37
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 38
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 7
                call $main._GET
                drop
                i32.const 38
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 39
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 10
                call $main._GET
                drop
                i32.const 39
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 40
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 13
                call $main._GET
                drop
                i32.const 40
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 41
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 0
                call $main._GET
                drop
                i32.const 41
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 42
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 3
                call $main._GET
                drop
                i32.const 42
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 43
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 6
                call $main._GET
                drop
                i32.const 43
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 44
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 9
                call $main._GET
                drop
                i32.const 44
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 45
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 12
                call $main._GET
                drop
                i32.const 45
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 46
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 15
                call $main._GET
                drop
                i32.const 46
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 47
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 2
                call $main._GET
                drop
                i32.const 47
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 48
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 0
                call $main._GET
                drop
                i32.const 48
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 49
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 7
                call $main._GET
                drop
                i32.const 49
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 50
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 14
                call $main._GET
                drop
                i32.const 50
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 51
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 5
                call $main._GET
                drop
                i32.const 51
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 52
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 12
                call $main._GET
                drop
                i32.const 52
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 53
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 3
                call $main._GET
                drop
                i32.const 53
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 54
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 10
                call $main._GET
                drop
                i32.const 54
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 55
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 1
                call $main._GET
                drop
                i32.const 55
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 56
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 8
                call $main._GET
                drop
                i32.const 56
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 57
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 15
                call $main._GET
                drop
                i32.const 57
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 58
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 6
                call $main._GET
                drop
                i32.const 58
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 59
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 13
                call $main._GET
                drop
                i32.const 59
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 60
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 4
                call $main._GET
                drop
                i32.const 60
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 61
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 11
                call $main._GET
                drop
                i32.const 61
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 62
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 2
                call $main._GET
                drop
                i32.const 62
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              local.get 13
              i32.const 63
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 9
                local.get 10
                local.get 11
                i32.const 9
                call $main._GET
                drop
                i32.const 63
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 10
                i32.const 64
                i32.lt_u
                local.get 10
                local.get 11
                i32.gt_u
                i32.or
                br_if 3 (;@2;)
                local.get 12
                i64.const -64
                i64.add
                local.set 12
                local.get 11
                i32.const -64
                i32.add
                local.set 11
                local.get 10
                i32.const -64
                i32.add
                local.set 10
                local.get 9
                i32.const -64
                i32.sub
                local.set 9
                br 2 (;@3;)
              end
            end
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 0
            local.get 11
            i32.store offset=8
            local.get 0
            local.get 10
            i32.store offset=4
            local.get 0
            local.get 9
            i32.store
            return
          end
        end
        local.get 13
        i32.const 64
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.slicePanic.llvm.17335636212724678214
          i32.const 64
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 9
      i32.store offset=4
      local.get 2
      local.get 10
      i32.store offset=8
      local.get 2
      local.get 11
      i32.store offset=12
      local.get 2
      local.get 12
      i64.store offset=16 align=4
      global.get 2
      global.get 2
      i32.load
      i32.const 24
      i32.add
      i32.store
    )
    (func $runtime.slicePanic.llvm.17335636212724678214 (;18;) (type $.data)
      (local i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if (result i32) ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
        else
          i32.const 0
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65723
          i32.const 18
          call $runtime.runtimePanic.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $md5_hash (;19;) (type 3) (param i32 i32)
      (local i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i64)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 60
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 5
        i32.load
        local.set 0
        local.get 5
        i32.load offset=8
        local.set 2
        local.get 5
        i32.load offset=12
        local.set 3
        local.get 5
        i32.load offset=16
        local.set 4
        local.get 5
        i32.load offset=20
        local.set 6
        local.get 5
        i32.load offset=24
        local.set 7
        local.get 5
        i64.load offset=28 align=4
        local.set 8
        local.get 5
        i32.load offset=36
        local.set 10
        local.get 5
        i32.load offset=40
        local.set 11
        local.get 5
        i32.load offset=44
        local.set 12
        local.get 5
        i32.load offset=48
        local.set 13
        local.get 5
        i32.load offset=52
        local.set 14
        local.get 5
        i32.load offset=56
        local.set 15
        local.get 5
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 9
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 304
          i32.sub
          local.tee 2
          global.set $__stack_pointer
          local.get 2
          i32.const 36
          i32.store offset=156
          local.get 2
          i32.const 160
          i32.add
          i32.const 0
          i32.const 144
          memory.fill
          local.get 2
          local.get 0
          i32.store offset=72
          local.get 2
          i64.const 0
          i64.store offset=64
          local.get 2
          i32.const 66028
          i32.load
          local.tee 15
          i32.store offset=152
          i32.const 66028
          local.get 2
          i32.const 152
          i32.add
          i32.store
          local.get 0
          i32.eqz
          local.set 3
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 3
            br_if 1 (;@2;)
            local.get 0
            i32.const 28
            i32.add
            i32.load
            local.tee 7
            i32.const 0
            i32.lt_s
            local.set 3
          end
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 3
                  br_if 1 (;@5;)
                  local.get 0
                  i32.load offset=20
                  local.set 10
                  local.get 0
                  i32.load offset=16
                  local.set 11
                  local.get 0
                  i32.load offset=12
                  local.set 12
                  local.get 0
                  i32.load offset=8
                  local.set 13
                  local.get 0
                  i64.load
                  local.set 8
                end
                local.get 9
                i32.const 0
                global.get 1
                select
                i32.eqz
                if ;; label = @6
                  local.get 7
                  call $runtime.alloc.llvm.17335636212724678214
                  local.set 5
                  i32.const 0
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                  local.get 5
                  local.set 6
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 2
                  local.get 6
                  i32.store offset=212
                  local.get 2
                  local.get 6
                  i32.store offset=216
                  local.get 2
                  local.get 6
                  i32.store offset=208
                  local.get 2
                  local.get 6
                  i32.store offset=204
                  local.get 2
                  local.get 6
                  i32.store offset=200
                  local.get 2
                  local.get 6
                  i32.store offset=196
                  local.get 2
                  local.get 6
                  i32.store offset=192
                  local.get 2
                  local.get 6
                  i32.store offset=188
                  local.get 2
                  local.get 6
                  i32.store offset=184
                  local.get 2
                  local.get 6
                  i32.store offset=180
                  local.get 2
                  local.get 6
                  i32.store offset=176
                  local.get 2
                  local.get 6
                  i32.store offset=172
                  local.get 2
                  local.get 6
                  i32.store offset=160
                  block ;; label = @7
                    local.get 0
                    i32.load offset=28
                    local.tee 4
                    i32.eqz
                    br_if 0 (;@7;)
                    i32.const 0
                    local.set 3
                    local.get 4
                    i32.const 0
                    local.get 4
                    i32.const 0
                    i32.gt_s
                    select
                    local.set 14
                    loop ;; label = @8
                      local.get 3
                      local.get 14
                      i32.eq
                      br_if 1 (;@7;)
                      local.get 2
                      local.get 0
                      i32.load offset=24
                      local.tee 4
                      i32.store offset=168
                      local.get 2
                      local.get 4
                      i32.store offset=164
                      local.get 3
                      local.get 7
                      i32.eq
                      br_if 4 (;@4;)
                      local.get 3
                      local.get 6
                      i32.add
                      local.get 3
                      local.get 4
                      i32.add
                      i32.load8_u
                      i32.store8
                      local.get 3
                      i32.const 1
                      i32.add
                      local.set 3
                      br 0 (;@8;)
                    end
                    unreachable
                  end
                  local.get 2
                  i32.const 80
                  i32.add
                  i32.const 0
                  i32.const 72
                  memory.fill
                  i32.const 55
                  local.get 8
                  i32.wrap_i64
                  i32.sub
                  i32.const 63
                  i32.and
                  local.tee 4
                  local.get 2
                  i32.const 80
                  i32.add
                  i32.add
                  local.tee 3
                  i32.const 8
                  i32.add
                  local.get 8
                  i64.const 56
                  i64.shr_u
                  i64.store8
                  local.get 3
                  i32.const 7
                  i32.add
                  local.get 8
                  i64.const 48
                  i64.shr_u
                  i64.store8
                  local.get 3
                  i32.const 6
                  i32.add
                  local.get 8
                  i64.const 40
                  i64.shr_u
                  i64.store8
                  local.get 3
                  i32.const 5
                  i32.add
                  local.get 8
                  i64.const 32
                  i64.shr_u
                  i64.store8
                  local.get 3
                  i32.const 4
                  i32.add
                  local.get 8
                  i64.const 24
                  i64.shr_u
                  i64.store8
                  local.get 3
                  i32.const 3
                  i32.add
                  local.get 8
                  i64.const 16
                  i64.shr_u
                  i64.store8
                  local.get 3
                  i32.const 2
                  i32.add
                  local.get 8
                  i64.const 8
                  i64.shr_u
                  i64.store8
                  local.get 3
                  i32.const 1
                  i32.add
                  local.get 8
                  i64.store8
                  local.get 2
                  i32.const 128
                  i32.store8 offset=80
                  local.get 8
                  i64.const 63
                  i64.and
                  local.tee 16
                  local.get 7
                  i64.extend_i32_u
                  i64.gt_u
                  local.tee 0
                  br_if 1 (;@5;)
                  local.get 6
                  local.get 16
                  i32.wrap_i64
                  local.tee 3
                  i32.add
                  local.set 0
                  local.get 7
                  local.get 3
                  i32.sub
                  local.tee 3
                  local.get 4
                  i32.const 9
                  i32.add
                  local.tee 4
                  i32.gt_u
                  local.set 5
                  local.get 0
                  local.get 2
                  i32.const 80
                  i32.add
                  local.tee 14
                  local.get 4
                  local.get 3
                  local.get 5
                  select
                  local.tee 3
                  memory.copy
                  local.get 7
                  i32.const 57
                  i32.lt_u
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 3
                  i64.shl
                  local.tee 8
                  i64.store8 offset=56
                  local.get 7
                  i32.const 57
                  i32.eq
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 8
                  i64.shr_u
                  i64.store8 offset=57
                  local.get 7
                  i32.const 59
                  i32.lt_u
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 16
                  i64.shr_u
                  i64.store8 offset=58
                  local.get 7
                  i32.const 59
                  i32.eq
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 24
                  i64.shr_u
                  i64.store8 offset=59
                  local.get 7
                  i32.const 61
                  i32.lt_u
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 32
                  i64.shr_u
                  i64.store8 offset=60
                  local.get 7
                  i32.const 61
                  i32.eq
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 40
                  i64.shr_u
                  i64.store8 offset=61
                  local.get 7
                  i32.const 63
                  i32.lt_u
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 48
                  i64.shr_u
                  i64.store8 offset=62
                  local.get 7
                  i32.const 63
                  i32.eq
                  local.tee 0
                  br_if 2 (;@4;)
                  local.get 6
                  local.get 8
                  i64.const 56
                  i64.shr_u
                  i64.store8 offset=63
                  local.get 2
                  i32.const 48
                  i32.add
                  local.set 0
                end
                local.get 9
                i32.const 1
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  local.get 8
                  local.get 13
                  local.get 12
                  local.get 11
                  local.get 10
                  local.get 6
                  local.get 7
                  local.get 7
                  local.get 6
                  local.get 7
                  local.get 7
                  i64.const 64
                  call $main.md5Body
                  i32.const 1
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 2
                  local.get 2
                  i32.load offset=48
                  local.tee 0
                  i32.store offset=220
                end
                local.get 9
                i32.const 2
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  i32.const 16
                  call $runtime.alloc.llvm.17335636212724678214
                  local.set 5
                  i32.const 2
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                  local.get 5
                  local.set 4
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 10
                  i32.const 24
                  i32.shr_u
                  i32.store8 offset=15
                  local.get 4
                  local.get 10
                  i32.const 16
                  i32.shr_u
                  i32.store8 offset=14
                  local.get 4
                  local.get 10
                  i32.const 8
                  i32.shr_u
                  i32.store8 offset=13
                  local.get 4
                  local.get 10
                  i32.store8 offset=12
                  local.get 4
                  local.get 11
                  i32.const 24
                  i32.shr_u
                  i32.store8 offset=11
                  local.get 4
                  local.get 11
                  i32.const 16
                  i32.shr_u
                  i32.store8 offset=10
                  local.get 4
                  local.get 11
                  i32.const 8
                  i32.shr_u
                  i32.store8 offset=9
                  local.get 4
                  local.get 11
                  i32.store8 offset=8
                  local.get 4
                  local.get 12
                  i32.const 24
                  i32.shr_u
                  i32.store8 offset=7
                  local.get 4
                  local.get 12
                  i32.const 16
                  i32.shr_u
                  i32.store8 offset=6
                  local.get 4
                  local.get 12
                  i32.const 8
                  i32.shr_u
                  i32.store8 offset=5
                  local.get 4
                  local.get 12
                  i32.store8 offset=4
                  local.get 4
                  local.get 13
                  i32.const 24
                  i32.shr_u
                  i32.store8 offset=3
                  local.get 4
                  local.get 13
                  i32.const 16
                  i32.shr_u
                  i32.store8 offset=2
                  local.get 4
                  local.get 13
                  i32.const 8
                  i32.shr_u
                  i32.store8 offset=1
                  local.get 4
                  local.get 13
                  i32.store8
                  local.get 2
                  local.get 4
                  i32.store offset=280
                  local.get 2
                  local.get 4
                  i32.store offset=296
                  local.get 2
                  local.get 4
                  i32.store offset=272
                  local.get 2
                  local.get 4
                  i32.store offset=256
                  local.get 2
                  local.get 4
                  i32.store offset=244
                  local.get 2
                  local.get 4
                  i32.store offset=240
                  local.get 2
                  local.get 4
                  i32.store offset=236
                  local.get 2
                  local.get 4
                  i32.store offset=232
                  local.get 2
                  local.get 4
                  i32.store offset=228
                  local.get 2
                  local.get 4
                  i32.store offset=224
                  i32.const 0
                  local.set 3
                  local.get 2
                  i32.const 40
                  i32.add
                  local.set 0
                end
                local.get 9
                i32.const 3
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  i32.const 0
                  local.get 4
                  i32.const 16
                  i32.const 16
                  i32.const 0
                  call $#func20<_example.com/md5component/md5.Result___uint8__example.com/md5component/md5.Md5Errno__.Unwrap___uint8_example.com/md5component/md5.Md5Errno_>
                  i32.const 3
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 2
                  local.get 2
                  i32.load offset=40
                  i32.store offset=248
                  local.get 2
                  i32.load offset=44
                  local.tee 0
                  i32.eqz
                  if ;; label = @7
                    i32.const 0
                    local.set 7
                    br 4 (;@3;)
                  end
                  local.get 2
                  i32.const 32
                  i32.add
                  local.set 0
                end
                local.get 9
                i32.const 4
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  i32.const 0
                  local.get 4
                  i32.const 16
                  i32.const 16
                  i32.const 0
                  call $#func20<_example.com/md5component/md5.Result___uint8__example.com/md5component/md5.Md5Errno__.Unwrap___uint8_example.com/md5component/md5.Md5Errno_>
                  i32.const 4
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 2
                  local.get 2
                  i32.load offset=32
                  i32.store offset=260
                  local.get 2
                  i32.load offset=36
                  local.set 0
                end
                local.get 9
                i32.const 5
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  call $malloc
                  local.set 5
                  i32.const 5
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                  local.get 5
                  local.set 7
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 2
                  local.get 7
                  i32.store offset=288
                  local.get 2
                  local.get 7
                  i32.store offset=292
                  local.get 2
                  local.get 7
                  i32.store offset=268
                  local.get 2
                  local.get 7
                  i32.store offset=264
                  local.get 2
                  i32.const 24
                  i32.add
                  local.set 0
                end
                local.get 9
                i32.const 6
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  i32.const 0
                  local.get 4
                  i32.const 16
                  i32.const 16
                  i32.const 0
                  call $#func20<_example.com/md5component/md5.Result___uint8__example.com/md5component/md5.Md5Errno__.Unwrap___uint8_example.com/md5component/md5.Md5Errno_>
                  i32.const 6
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 2
                  local.get 2
                  i32.load offset=24
                  i32.store offset=276
                  local.get 2
                  i32.load offset=28
                  local.set 14
                  local.get 2
                  i32.const 16
                  i32.add
                  local.set 0
                end
                local.get 9
                i32.const 7
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  i32.const 0
                  local.get 4
                  i32.const 16
                  i32.const 16
                  i32.const 0
                  call $#func20<_example.com/md5component/md5.Result___uint8__example.com/md5component/md5.Md5Errno__.Unwrap___uint8_example.com/md5component/md5.Md5Errno_>
                  i32.const 7
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 2
                  local.get 2
                  i32.load offset=16
                  i32.store offset=284
                  local.get 2
                  i32.load offset=20
                  local.tee 3
                  i32.const 0
                  i32.gt_s
                  local.set 0
                  local.get 3
                  i32.const 0
                  local.get 0
                  select
                  local.set 0
                  i32.const 0
                  local.set 3
                end
                loop ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 0
                    local.get 3
                    i32.eq
                    if ;; label = @8
                      local.get 14
                      local.set 3
                      br 5 (;@3;)
                    end
                    local.get 2
                    i32.const 8
                    i32.add
                    local.set 6
                  end
                  local.get 9
                  i32.const 8
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 6
                    i32.const 0
                    local.get 4
                    i32.const 16
                    i32.const 16
                    i32.const 0
                    call $#func20<_example.com/md5component/md5.Result___uint8__example.com/md5component/md5.Md5Errno__.Unwrap___uint8_example.com/md5component/md5.Md5Errno_>
                    i32.const 8
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 6 (;@1;)
                    drop
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 2
                    local.get 2
                    i32.load offset=8
                    local.tee 6
                    i32.store offset=300
                    local.get 2
                    i32.load offset=12
                    local.get 3
                    i32.le_u
                    br_if 3 (;@4;)
                    local.get 3
                    local.get 7
                    i32.add
                    local.get 3
                    local.get 6
                    i32.add
                    i32.load8_u
                    local.tee 6
                    i32.store8
                    local.get 3
                    i32.const 1
                    i32.add
                    local.set 3
                    br 1 (;@6;)
                  end
                end
              end
              local.get 9
              i32.const 9
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                call $runtime.slicePanic.llvm.17335636212724678214
                i32.const 9
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                unreachable
              end
            end
            local.get 9
            i32.const 10
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              call $runtime.lookupPanic.llvm.17335636212724678214
              i32.const 10
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              unreachable
            end
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 2
            local.get 7
            i32.store offset=252
            local.get 1
            i32.eqz
            local.tee 0
            br_if 1 (;@2;)
            local.get 1
            local.get 3
            i32.store offset=8
            local.get 1
            local.get 7
            i32.store offset=4
            local.get 1
            i32.const 0
            i32.store8
            local.get 2
            i32.const -64
            i32.sub
            local.set 3
          end
          loop ;; label = @3
            block ;; label = @4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 3
                i32.eqz
                br_if 1 (;@4;)
                local.get 3
                i32.load offset=8
                local.set 4
                local.get 3
                i32.load offset=4
                local.set 3
                local.get 4
                i32.const 24
                i32.add
                local.set 0
              end
              local.get 9
              i32.const 11
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 0
                call $md5_list_u8_free
                i32.const 11
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              global.get 1
              i32.eqz
              br_if 1 (;@3;)
            end
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            i32.const 66028
            local.get 15
            i32.store
            local.get 2
            i32.const 304
            i32.add
            global.set $__stack_pointer
            return
          end
        end
        local.get 9
        i32.const 12
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.nilPanic
          i32.const 12
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 5
      global.get 2
      i32.load
      local.get 5
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 5
      local.get 0
      i32.store
      local.get 5
      local.get 1
      i32.store offset=4
      local.get 5
      local.get 2
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 5
      local.get 4
      i32.store offset=16
      local.get 5
      local.get 6
      i32.store offset=20
      local.get 5
      local.get 7
      i32.store offset=24
      local.get 5
      local.get 8
      i64.store offset=28 align=4
      local.get 5
      local.get 10
      i32.store offset=36
      local.get 5
      local.get 11
      i32.store offset=40
      local.get 5
      local.get 12
      i32.store offset=44
      local.get 5
      local.get 13
      i32.store offset=48
      local.get 5
      local.get 14
      i32.store offset=52
      local.get 5
      local.get 15
      i32.store offset=56
      global.get 2
      global.get 2
      i32.load
      i32.const 60
      i32.add
      i32.store
    )
    (func $#func20<_example.com/md5component/md5.Result___uint8__example.com/md5component/md5.Md5Errno__.Unwrap___uint8_example.com/md5component/md5.Md5Errno_> (@name "(example.com/md5component/md5.Result[[]uint8, example.com/md5component/md5.Md5Errno]).Unwrap[[]uint8 example.com/md5component/md5.Md5Errno]") (;20;) (type 10) (param i32 i32 i32 i32 i32 i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=4
        local.set 2
        local.get 3
        i32.load offset=8
        local.set 3
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 6
        end
        global.get 1
        i32.const 1
        local.get 1
        local.get 1
        i32.eqz
        global.get 1
        select
        select
        if ;; label = @2
          local.get 6
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            i32.const 65568
            call $runtime._panic.llvm.17335636212724678214
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          local.get 2
          i32.store
          local.get 0
          local.get 3
          i32.store offset=4
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 1
      local.get 0
      i32.store
      local.get 1
      local.get 2
      i32.store offset=4
      local.get 1
      local.get 3
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
    )
    (func $runtime._panic.llvm.17335636212724678214 (;21;) (type $.rodata) (param i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 0
      end
      block (result i32) ;; label = @1
        block (result i32) ;; label = @2
          global.get 1
          i32.const 2
          i32.eq
          if ;; label = @3
            global.get 2
            global.get 2
            i32.load
            i32.const 4
            i32.sub
            i32.store
            global.get 2
            i32.load
            i32.load
            local.set 1
          end
          local.get 1
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65653
          i32.const 7
          call $runtime.printstring.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        local.get 1
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          local.get 0
          call $runtime.printitf.llvm.17335636212724678214
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        local.get 1
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.printnl.llvm.17335636212724678214
          i32.const 2
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.memequal (;22;) (type 2) (param i32 i32 i32 i32) (result i32)
      (local i32 i32)
      i32.const 0
      local.set 3
      block (result i32) ;; label = @1
        loop ;; label = @2
          local.get 2
          local.get 2
          local.get 3
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 1
          local.get 3
          i32.add
          local.set 4
          local.get 0
          local.get 3
          i32.add
          local.set 5
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 4
          i32.load8_u
          local.get 5
          i32.load8_u
          i32.eq
          br_if 0 (;@2;)
        end
        local.get 3
        i32.const 1
        i32.sub
      end
      local.get 2
      i32.ge_u
    )
    (func $runtime.hash32.llvm.17335636212724678214 (;23;) (type 2) (param i32 i32 i32 i32) (result i32)
      local.get 1
      i32.const -962287725
      i32.mul
      local.get 2
      i32.xor
      i32.const -1130422988
      i32.xor
      local.set 2
      loop ;; label = @1
        local.get 1
        i32.const 4
        i32.ge_s
        if ;; label = @2
          local.get 0
          i32.load align=1
          local.get 2
          i32.add
          i32.const -962287725
          i32.mul
          local.tee 2
          i32.const 16
          i32.shr_u
          local.set 3
          local.get 2
          local.get 3
          i32.xor
          local.set 2
          local.get 1
          i32.const 4
          i32.sub
          local.set 1
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          br 1 (;@1;)
        end
      end
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 1
              i32.const 1
              i32.sub
              br_table 2 (;@2;) 1 (;@3;) 0 (;@4;) 3 (;@1;)
            end
            local.get 2
            local.get 0
            i32.load8_u offset=2
            i32.const 16
            i32.shl
            i32.add
            local.set 2
          end
          local.get 2
          local.get 0
          i32.load8_u offset=1
          i32.const 8
          i32.shl
          i32.add
          local.set 2
        end
        local.get 2
        local.get 0
        i32.load8_u
        i32.add
        i32.const -962287725
        i32.mul
        local.tee 1
        i32.const 24
        i32.shr_u
        local.get 1
        i32.xor
        local.set 2
      end
      local.get 2
    )
    (func $runtime.printstring.llvm.17335636212724678214 (;24;) (type 3) (param i32 i32)
      (local i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=4
        local.set 1
        local.get 2
        i32.load offset=8
        local.set 2
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 3
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          i32.const 0
          local.get 1
          i32.const 0
          i32.gt_s
          local.tee 2
          select
          local.set 1
        end
        loop ;; label = @2
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 1
              i32.eqz
              br_if 1 (;@3;)
              local.get 0
              i32.load8_u
              local.set 2
            end
            local.get 3
            i32.const 0
            global.get 1
            select
            i32.eqz
            if ;; label = @4
              local.get 2
              call $runtime.putchar.llvm.17335636212724678214
              i32.const 0
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 1
              i32.const 1
              i32.sub
              local.set 1
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              br 2 (;@2;)
            end
          end
        end
        return
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 3
      local.get 2
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
    )
    (func $runtime.printnl.llvm.17335636212724678214 (;25;) (type $.data)
      (local i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if (result i32) ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
        else
          i32.const 0
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 10
          call $runtime.putchar.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.putchar.llvm.17335636212724678214 (;26;) (type $.rodata) (param i32)
      (local i32 i32 i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 2
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          i32.const 65852
          i32.load
          local.tee 3
          i32.const 119
          i32.gt_u
          local.set 1
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 1
            br_if 1 (;@2;)
            i32.const 65852
            local.get 3
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            local.get 3
            i32.const 65856
            i32.add
            local.get 0
            i32.store8
            local.get 0
            i32.const 255
            i32.and
            i32.const 10
            i32.eq
            local.set 0
          end
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 0
              i32.const 1
              local.get 3
              i32.const 119
              i32.ne
              select
              i32.eqz
              br_if 1 (;@3;)
              i32.const 65796
              local.get 1
              i32.store
            end
            local.get 2
            i32.const 0
            global.get 1
            select
            i32.eqz
            if ;; label = @4
              i32.const 1
              i32.const 65792
              i32.const 1
              i32.const 66032
              call $runtime.fd_write
              drop
              i32.const 0
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              i32.const 65852
              i32.const 0
              i32.store
            end
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            return
          end
        end
        local.get 2
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.lookupPanic.llvm.17335636212724678214
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.markRoots (;27;) (type 3) (param i32 i32)
      (local i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 16
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=4
        local.set 1
        local.get 2
        i32.load offset=8
        local.set 3
        local.get 2
        i32.load offset=12
        local.set 2
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 4
        end
        loop ;; label = @2
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 0
              local.get 1
              i32.ge_u
              br_if 1 (;@3;)
              local.get 0
              i32.load
              local.tee 3
              i32.const 66368
              i32.lt_u
              local.set 2
            end
            block ;; label = @4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 2
                br_if 1 (;@4;)
                local.get 3
                i32.const 65984
                i32.load
                i32.ge_u
                local.tee 2
                br_if 1 (;@4;)
                local.get 3
                i32.const 66368
                i32.sub
                i32.const 4
                i32.shr_u
                local.tee 3
                call $#func28<_runtime.gcBlock_.state>
                i32.const 255
                i32.and
                i32.eqz
                local.tee 2
                br_if 1 (;@4;)
                local.get 3
                call $#func34<_runtime.gcBlock_.findHead>
                local.tee 3
                call $#func28<_runtime.gcBlock_.state>
                i32.const 255
                i32.and
                i32.const 3
                i32.eq
                local.tee 2
                br_if 1 (;@4;)
              end
              local.get 4
              i32.const 0
              global.get 1
              select
              i32.eqz
              if ;; label = @5
                local.get 3
                call $runtime.startMark
                i32.const 0
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 0
              i32.const 4
              i32.add
              local.set 0
              br 2 (;@2;)
            end
          end
        end
        return
      end
      local.set 4
      global.get 2
      i32.load
      local.get 4
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 4
      local.get 0
      i32.store
      local.get 4
      local.get 1
      i32.store offset=4
      local.get 4
      local.get 3
      i32.store offset=8
      local.get 4
      local.get 2
      i32.store offset=12
      global.get 2
      global.get 2
      i32.load
      i32.const 16
      i32.add
      i32.store
    )
    (func $#func28<_runtime.gcBlock_.state> (@name "(runtime.gcBlock).state") (;28;) (type 6) (param i32) (result i32)
      i32.const 65984
      i32.load
      local.get 0
      i32.const 2
      i32.shr_u
      i32.add
      i32.load8_u
      local.get 0
      i32.const 1
      i32.shl
      i32.const 6
      i32.and
      i32.shr_u
      i32.const 3
      i32.and
    )
    (func $#func29<_runtime.gcBlock_.markFree> (@name "(runtime.gcBlock).markFree") (;29;) (type $.rodata) (param i32)
      (local i32 i32)
      i32.const 65984
      i32.load
      local.get 0
      i32.const 2
      i32.shr_u
      i32.add
      local.tee 1
      i32.load8_u
      local.set 2
      local.get 1
      local.get 2
      i32.const 3
      local.get 0
      i32.const 1
      i32.shl
      i32.const 6
      i32.and
      i32.shl
      i32.const -1
      i32.xor
      i32.and
      i32.store8
    )
    (func $runtime.growHeap (;30;) (type 4) (result i32)
      (local i32 i32 i32)
      memory.size
      memory.grow
      i32.const -1
      i32.ne
      local.tee 1
      if ;; label = @1
        memory.size
        local.set 0
        i32.const 65848
        i32.load
        local.set 2
        i32.const 65848
        local.get 0
        i32.const 16
        i32.shl
        i32.store
        i32.const 65984
        i32.load
        local.set 0
        call $runtime.calculateHeapAddresses
        i32.const 65984
        i32.load
        local.get 0
        local.get 2
        local.get 0
        i32.sub
        memory.copy
      end
      local.get 1
    )
    (func $runtime.startMark (;31;) (type $.rodata) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 6
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const -64
          i32.add
          local.tee 3
          global.set $__stack_pointer
          local.get 3
          i32.const 4
          i32.add
          i32.const 0
          i32.const 60
          memory.fill
          local.get 3
          local.get 0
          i32.store
          local.get 0
          i32.const 3
          call $#func32<_runtime.gcBlock_.setState>
          i32.const 1
          local.set 2
          block ;; label = @3
            loop ;; label = @4
              local.get 2
              i32.const 1
              i32.ge_s
              if ;; label = @5
                local.get 2
                i32.const 1
                i32.sub
                local.tee 2
                i32.const 15
                i32.gt_u
                br_if 2 (;@3;)
                local.get 3
                local.get 2
                i32.const 2
                i32.shl
                i32.add
                i32.load
                local.tee 1
                i32.const 4
                i32.shl
                local.set 0
                block ;; label = @6
                  block ;; label = @7
                    local.get 1
                    call $#func28<_runtime.gcBlock_.state>
                    i32.const 255
                    i32.and
                    i32.const 1
                    i32.sub
                    br_table 0 (;@7;) 1 (;@6;) 0 (;@7;) 1 (;@6;)
                  end
                  local.get 1
                  i32.const 1
                  i32.add
                  local.set 1
                end
                local.get 0
                i32.const 66368
                i32.add
                local.set 5
                local.get 1
                i32.const 4
                i32.shl
                local.tee 4
                local.get 0
                i32.sub
                local.set 7
                local.get 4
                i32.const 66368
                i32.add
                local.set 4
                i32.const 65984
                i32.load
                local.set 8
                loop ;; label = @6
                  block ;; label = @7
                    local.get 7
                    local.set 0
                    local.get 4
                    local.get 8
                    i32.ge_u
                    br_if 0 (;@7;)
                    local.get 0
                    i32.const 16
                    i32.add
                    local.set 7
                    local.get 4
                    i32.const 16
                    i32.add
                    local.set 4
                    local.get 1
                    call $#func28<_runtime.gcBlock_.state>
                    local.set 9
                    local.get 1
                    i32.const 1
                    i32.add
                    local.set 1
                    local.get 9
                    i32.const 255
                    i32.and
                    i32.const 2
                    i32.eq
                    br_if 1 (;@6;)
                  end
                end
                loop ;; label = @6
                  local.get 0
                  i32.eqz
                  br_if 2 (;@4;)
                  block ;; label = @7
                    local.get 5
                    i32.load
                    local.tee 1
                    i32.const 66368
                    i32.lt_u
                    br_if 0 (;@7;)
                    local.get 1
                    i32.const 65984
                    i32.load
                    i32.ge_u
                    br_if 0 (;@7;)
                    local.get 1
                    i32.const 66368
                    i32.sub
                    i32.const 4
                    i32.shr_u
                    local.tee 1
                    call $#func28<_runtime.gcBlock_.state>
                    i32.const 255
                    i32.and
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 1
                    call $#func34<_runtime.gcBlock_.findHead>
                    local.tee 1
                    call $#func28<_runtime.gcBlock_.state>
                    i32.const 255
                    i32.and
                    i32.const 3
                    i32.eq
                    br_if 0 (;@7;)
                    local.get 1
                    i32.const 3
                    call $#func32<_runtime.gcBlock_.setState>
                    local.get 2
                    i32.const 16
                    i32.eq
                    if ;; label = @8
                      i32.const 66025
                      i32.const 1
                      i32.store8
                      i32.const 16
                      local.set 2
                      br 1 (;@7;)
                    end
                    local.get 2
                    i32.const 15
                    i32.gt_u
                    br_if 4 (;@3;)
                    local.get 3
                    local.get 2
                    i32.const 2
                    i32.shl
                    i32.add
                    local.get 1
                    i32.store
                    local.get 2
                    i32.const 1
                    i32.add
                    local.set 2
                  end
                  local.get 0
                  i32.const 4
                  i32.sub
                  local.set 0
                  local.get 5
                  i32.const 4
                  i32.add
                  local.set 5
                  br 0 (;@6;)
                end
                unreachable
              end
            end
            local.get 3
            i32.const -64
            i32.sub
            global.set $__stack_pointer
            return
          end
        end
        local.get 6
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          call $runtime.lookupPanic.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $#func32<_runtime.gcBlock_.setState> (@name "(runtime.gcBlock).setState") (;32;) (type 3) (param i32 i32)
      (local i32 i32)
      i32.const 65984
      i32.load
      local.get 0
      i32.const 2
      i32.shr_u
      i32.add
      local.tee 2
      i32.load8_u
      local.set 3
      local.get 2
      local.get 3
      local.get 1
      local.get 0
      i32.const 1
      i32.shl
      i32.const 6
      i32.and
      i32.shl
      i32.or
      i32.store8
    )
    (func $runtime.calculateHeapAddresses (;33;) (type $.data)
      (local i32 i32)
      i32.const 65848
      i32.load
      local.tee 0
      i32.const 66304
      i32.sub
      i32.const 65
      i32.div_u
      local.set 1
      i32.const 65984
      local.get 0
      local.get 1
      i32.sub
      local.tee 0
      i32.store
      i32.const 65992
      local.get 0
      i32.const 66368
      i32.sub
      i32.const 4
      i32.shr_u
      i32.store
    )
    (func $#func34<_runtime.gcBlock_.findHead> (@name "(runtime.gcBlock).findHead") (;34;) (type 6) (param i32) (result i32)
      (local i32 i32)
      loop ;; label = @1
        local.get 0
        call $#func28<_runtime.gcBlock_.state>
        local.set 1
        local.get 0
        i32.const 1
        i32.sub
        local.tee 2
        local.set 0
        local.get 1
        i32.const 255
        i32.and
        i32.const 2
        i32.eq
        br_if 0 (;@1;)
      end
      local.get 2
      i32.const 1
      i32.add
    )
    (func $runtime.hashmapBinarySet.llvm.17335636212724678214 (;35;) (type 3) (param i32 i32)
      (local i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=4
        local.set 1
        local.get 2
        i32.load offset=8
        local.set 2
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 3
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          i32.const 65812
          i32.load
          i32.const 65804
          i32.load
          local.get 0
          call $runtime.hash32.llvm.17335636212724678214
          local.set 2
        end
        local.get 3
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65800
          local.get 0
          local.get 1
          local.get 2
          call $runtime.hashmapSet.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        return
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 3
      local.get 2
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
    )
    (func $free (;36;) (type $.rodata) (param i32)
      (local i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=4
        local.set 1
        local.get 2
        i32.load offset=8
        local.set 3
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 4
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 16
          i32.sub
          local.tee 3
          global.set $__stack_pointer
          local.get 0
          i32.eqz
          local.set 1
        end
        block ;; label = @2
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 1
              br_if 1 (;@3;)
              local.get 3
              local.get 0
              i32.store offset=12
              local.get 3
              i32.const 12
              i32.add
              local.set 1
            end
            local.get 4
            i32.const 0
            global.get 1
            select
            i32.eqz
            if ;; label = @4
              local.get 1
              local.get 3
              call $runtime.hashmapBinaryGet.llvm.17335636212724678214
              local.set 2
              i32.const 0
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
              local.get 2
              local.set 1
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 1
              i32.const 1
              i32.and
              i32.eqz
              br_if 2 (;@2;)
              local.get 3
              local.get 0
              i32.store
            end
            local.get 4
            i32.const 1
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              local.get 3
              call $runtime.hashmapBinaryDelete.llvm.17335636212724678214
              i32.const 1
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 3
            i32.const 16
            i32.add
            global.set $__stack_pointer
            return
          end
        end
        local.get 4
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          i32.const 65600
          call $runtime._panic.llvm.17335636212724678214
          i32.const 2
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      local.get 2
      local.get 3
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
    )
    (func $runtime.hashmapBinaryGet.llvm.17335636212724678214 (;37;) (type 5) (param i32 i32) (result i32)
      (local i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=4
        local.set 1
        local.get 3
        i32.load offset=8
        local.set 3
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 2
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          i32.const 65812
          i32.load
          i32.const 65804
          i32.load
          local.get 0
          call $runtime.hash32.llvm.17335636212724678214
          local.set 3
        end
        local.get 2
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65800
          local.get 0
          local.get 1
          local.get 3
          call $runtime.hashmapGet.llvm.17335636212724678214
          local.set 2
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 2
          local.set 0
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          return
        end
        unreachable
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      local.get 2
      local.get 3
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
      i32.const 0
    )
    (func $runtime.hashmapBinaryDelete.llvm.17335636212724678214 (;38;) (type $.rodata) (param i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 44
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 1
        i32.load
        local.set 0
        local.get 1
        i32.load offset=8
        local.set 3
        local.get 1
        i32.load offset=16
        local.set 5
        local.get 1
        i32.load offset=20
        local.set 6
        local.get 1
        i32.load offset=24
        local.set 7
        local.get 1
        i32.load offset=28
        local.set 8
        local.get 1
        i32.load offset=32
        local.set 9
        local.get 1
        i32.load offset=36
        local.set 10
        local.get 1
        i32.load offset=40
        local.set 11
        local.get 1
        i32.load offset=12
        local.set 4
        local.get 1
        i32.load offset=4
        local.set 2
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 12
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 32
          i32.sub
          local.tee 2
          global.set $__stack_pointer
          local.get 2
          i32.const 24
          i32.add
          i64.const 0
          i64.store
          local.get 2
          i64.const 0
          i64.store offset=16
          local.get 2
          i32.const 6
          i32.store offset=4
          i32.const 66028
          i32.load
          local.set 7
          i32.const 66028
          local.get 2
          i32.store
          local.get 2
          local.get 7
          i32.store
          local.get 0
          i32.const 65812
          i32.load
          local.tee 3
          i32.const 65804
          i32.load
          local.get 5
          call $runtime.hash32.llvm.17335636212724678214
          local.set 5
          local.get 2
          i32.const 65800
          i32.load
          local.tee 4
          i32.store offset=8
          local.get 5
          i32.const 24
          i32.shr_u
          local.tee 6
          i32.const 1
          local.get 6
          select
          local.set 10
          i32.const 65816
          i32.load
          local.get 3
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          local.set 6
          local.get 4
          local.get 6
          local.get 5
          i32.const -1
          i32.const -1
          i32.const 65820
          i32.load8_u
          local.tee 3
          i32.shl
          i32.const -1
          i32.xor
          local.tee 8
          local.get 3
          i32.const 31
          i32.gt_u
          select
          i32.and
          i32.mul
          i32.add
          local.set 3
        end
        block ;; label = @2
          loop ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 2
              local.get 3
              i32.store offset=12
              local.get 2
              local.get 3
              i32.store offset=16
              local.get 3
              i32.eqz
              br_if 2 (;@2;)
              i32.const 0
              local.set 5
            end
            block ;; label = @4
              loop ;; label = @5
                block ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 5
                    i32.const 8
                    i32.eq
                    local.tee 4
                    br_if 1 (;@6;)
                    local.get 10
                    local.get 3
                    local.get 5
                    i32.add
                    local.tee 8
                    i32.load8_u
                    i32.ne
                    local.set 4
                  end
                  block ;; label = @7
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 4
                      br_if 1 (;@7;)
                      i32.const 65812
                      i32.load
                      local.set 6
                      local.get 2
                      i32.const 65824
                      i32.load
                      local.tee 11
                      i32.store offset=20
                      local.get 2
                      i32.const 65828
                      i32.load
                      local.tee 4
                      i32.store offset=24
                      local.get 4
                      i32.eqz
                      br_if 4 (;@4;)
                      local.get 5
                      local.get 6
                      i32.mul
                      local.get 3
                      i32.add
                      i32.const 12
                      i32.add
                      local.set 9
                    end
                    local.get 12
                    i32.const 0
                    global.get 1
                    select
                    i32.eqz
                    if ;; label = @8
                      local.get 0
                      local.get 9
                      local.get 6
                      local.get 11
                      local.get 4
                      call_indirect (type 2)
                      local.set 1
                      i32.const 0
                      global.get 1
                      i32.const 1
                      i32.eq
                      br_if 7 (;@1;)
                      drop
                      local.get 1
                      local.set 4
                    end
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 4
                      i32.const 1
                      i32.and
                      i32.eqz
                      local.tee 4
                      br_if 1 (;@7;)
                      local.get 8
                      i32.const 0
                      i32.store8
                      i32.const 65808
                      i32.const 65808
                      i32.load
                      i32.const 1
                      i32.sub
                      i32.store
                      br 6 (;@2;)
                    end
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 5
                    i32.const 1
                    i32.add
                    local.set 5
                    br 2 (;@5;)
                  end
                end
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 2
                local.get 3
                i32.load offset=8
                local.tee 3
                i32.store offset=28
                br 2 (;@3;)
              end
            end
          end
          local.get 12
          i32.const 1
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.nilPanic
            i32.const 1
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          i32.const 66028
          local.get 7
          i32.store
          local.get 2
          i32.const 32
          i32.add
          global.set $__stack_pointer
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 1
      local.get 0
      i32.store
      local.get 1
      local.get 2
      i32.store offset=4
      local.get 1
      local.get 3
      i32.store offset=8
      local.get 1
      local.get 4
      i32.store offset=12
      local.get 1
      local.get 5
      i32.store offset=16
      local.get 1
      local.get 6
      i32.store offset=20
      local.get 1
      local.get 7
      i32.store offset=24
      local.get 1
      local.get 8
      i32.store offset=28
      local.get 1
      local.get 9
      i32.store offset=32
      local.get 1
      local.get 10
      i32.store offset=36
      local.get 1
      local.get 11
      i32.store offset=40
      global.get 2
      global.get 2
      i32.load
      i32.const 44
      i32.add
      i32.store
    )
    (func $calloc (;39;) (type 5) (param i32 i32) (result i32)
      (local i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load offset=8
        local.set 2
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 4
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 16
          i32.sub
          local.tee 3
          global.set $__stack_pointer
          i32.const 66028
          i32.load
          local.set 2
          i32.const 66028
          local.get 3
          i32.store
          local.get 0
          local.get 1
          i32.mul
          local.set 0
        end
        local.get 4
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          local.get 0
          call $malloc
          local.set 1
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 1
          local.set 0
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          i32.const 66028
          local.get 2
          i32.store
          local.get 3
          i32.const 16
          i32.add
          global.set $__stack_pointer
          local.get 0
          return
        end
        unreachable
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 1
      local.get 0
      i32.store
      local.get 1
      local.get 3
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
      i32.const 0
    )
    (func $realloc (;40;) (type 5) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 24
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=8
        local.set 2
        local.get 3
        i32.load offset=12
        local.set 4
        local.get 3
        i32.load offset=16
        local.set 5
        local.get 3
        i32.load offset=20
        local.set 7
        local.get 3
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 6
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 32
          i32.sub
          local.tee 2
          global.set $__stack_pointer
          local.get 2
          i32.const 2
          i32.store offset=20
          i32.const 66028
          i32.load
          local.set 7
          i32.const 66028
          local.get 2
          i32.const 16
          i32.add
          local.tee 4
          i32.store
          local.get 2
          local.get 7
          i32.store offset=16
          i32.const 0
          local.set 5
        end
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              global.get 1
              i32.const 1
              local.get 1
              select
              if ;; label = @5
                local.get 6
                i32.const 0
                global.get 1
                select
                i32.eqz
                if ;; label = @6
                  local.get 0
                  call $free
                  i32.const 0
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                end
                global.get 1
                i32.eqz
                br_if 1 (;@4;)
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 1
                i32.const 0
                i32.lt_s
                local.tee 5
                br_if 2 (;@3;)
              end
              local.get 6
              i32.const 1
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 1
                call $runtime.alloc.llvm.17335636212724678214
                local.set 3
                i32.const 1
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 3
                local.set 5
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 2
                local.get 5
                i32.store offset=24
                local.get 2
                local.get 5
                i32.store offset=28
                local.get 0
                i32.eqz
                local.set 4
              end
              block ;; label = @5
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  br_if 1 (;@5;)
                  local.get 2
                  local.get 0
                  i32.store offset=12
                  local.get 2
                  i32.const 12
                  i32.add
                  local.set 4
                end
                local.get 6
                i32.const 2
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 4
                  local.get 2
                  call $runtime.hashmapBinaryGet.llvm.17335636212724678214
                  local.set 3
                  i32.const 2
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                  local.get 3
                  local.set 4
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  i32.const 1
                  i32.and
                  i32.eqz
                  br_if 4 (;@2;)
                  local.get 5
                  local.get 2
                  i32.load
                  local.get 2
                  i32.load offset=4
                  local.tee 4
                  local.get 1
                  local.get 1
                  local.get 4
                  i32.gt_u
                  select
                  memory.copy
                  local.get 2
                  local.get 0
                  i32.store
                end
                local.get 6
                i32.const 3
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 2
                  call $runtime.hashmapBinaryDelete.llvm.17335636212724678214
                  i32.const 3
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                end
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 2
                local.get 1
                i32.store offset=8
                local.get 2
                local.get 1
                i32.store offset=4
                local.get 2
                local.get 5
                i32.store
                local.get 2
                local.get 5
                i32.store offset=12
                local.get 2
                i32.const 12
                i32.add
                local.set 0
              end
              local.get 6
              i32.const 4
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 0
                local.get 2
                call $runtime.hashmapBinarySet.llvm.17335636212724678214
                i32.const 4
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              i32.const 66028
              local.get 7
              i32.store
              local.get 2
              i32.const 32
              i32.add
              global.set $__stack_pointer
              local.get 5
              return
            end
          end
          local.get 6
          i32.const 5
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.slicePanic.llvm.17335636212724678214
            i32.const 5
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        local.get 6
        i32.const 6
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          i32.const 65632
          call $runtime._panic.llvm.17335636212724678214
          i32.const 6
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        unreachable
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 3
      local.get 2
      i32.store offset=8
      local.get 3
      local.get 4
      i32.store offset=12
      local.get 3
      local.get 5
      i32.store offset=16
      local.get 3
      local.get 7
      i32.store offset=20
      global.get 2
      global.get 2
      i32.load
      i32.const 24
      i32.add
      i32.store
      i32.const 0
    )
    (func $_start (;41;) (type $.data)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 20
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=8
        local.set 2
        local.get 3
        i32.load offset=12
        local.set 4
        local.get 3
        i32.load offset=16
        local.set 6
        local.get 3
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 5
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const -64
          i32.add
          local.tee 2
          global.set $__stack_pointer
          local.get 2
          i32.const 14
          i32.store offset=4
          local.get 2
          i32.const 8
          i32.add
          i32.const 0
          i32.const 56
          memory.fill
          local.get 2
          i32.const 66028
          i32.load
          local.tee 6
          i32.store
          i32.const 66028
          local.get 2
          i32.store
          i32.const 65848
          memory.size
          i32.const 16
          i32.shl
          local.tee 1
          i32.store
          call $runtime.calculateHeapAddresses
          local.get 2
          i32.const 65984
          i32.load
          local.tee 0
          i32.store offset=12
          local.get 2
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          local.get 1
          local.get 0
          i32.sub
          local.tee 1
          memory.fill
        end
        local.get 5
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 48
          call $runtime.alloc.llvm.17335636212724678214
          local.set 3
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 3
          local.set 0
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          i32.const 1
          i32.store offset=20
          local.get 0
          i32.const 24
          i32.add
          local.tee 1
          i32.const 0
          i32.store
          local.get 2
          local.get 0
          i32.store offset=16
          local.get 0
          i32.const 28
          i32.add
          local.set 4
        end
        local.get 5
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          i32.const 16384
          call $runtime.alloc.llvm.17335636212724678214
          local.set 3
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 3
          local.set 1
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 4
          local.get 1
          i32.store
          local.get 1
          i32.const -1204030091
          i32.store
          local.get 0
          i32.const 32
          i32.add
          local.get 1
          i32.const 16384
          i32.add
          i32.store
          local.get 2
          local.get 1
          i32.store offset=24
          local.get 2
          local.get 1
          i32.store offset=28
          local.get 2
          local.get 1
          i32.store offset=20
          local.get 2
          i32.const 65980
          i32.load
          local.tee 1
          i32.store offset=32
          local.get 1
          if ;; label = @3
            local.get 2
            local.get 1
            i32.store offset=36
            local.get 1
            local.get 0
            i32.store
          end
          local.get 0
          i32.const 0
          i32.store
          i32.const 65980
          local.get 0
          i32.store
          local.get 2
          i32.const 65976
          i32.load
          local.tee 1
          i32.store offset=40
          local.get 1
          i32.eqz
          if ;; label = @3
            i32.const 65976
            local.get 0
            i32.store
          end
        end
        loop ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            i32.const 66036
            i32.load8_u
            local.set 0
          end
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              block ;; label = @5
                local.get 0
                i32.eqz
                if ;; label = @6
                  local.get 2
                  i32.const 65976
                  i32.load
                  local.tee 0
                  i32.store offset=56
                  local.get 2
                  local.get 0
                  i32.store offset=44
                  local.get 0
                  i32.eqz
                  local.tee 1
                  br_if 1 (;@5;)
                  i32.const 65976
                  local.get 0
                  i32.load
                  local.tee 1
                  i32.store
                  local.get 2
                  local.get 1
                  i32.store offset=48
                  local.get 2
                  i32.const 65980
                  i32.load
                  local.tee 1
                  i32.store offset=52
                  local.get 0
                  local.get 1
                  i32.eq
                  if ;; label = @7
                    i32.const 65980
                    i32.const 0
                    i32.store
                  end
                  local.get 0
                  i32.const 0
                  i32.store
                  i32.const 65844
                  i32.load
                  local.set 1
                  i32.const 65844
                  local.get 0
                  i32.store
                  local.get 2
                  local.get 1
                  i32.store offset=60
                  local.get 0
                  i32.load offset=16
                  local.set 4
                  local.get 0
                  i32.const 66028
                  i32.load
                  i32.store offset=16
                  i32.const 66028
                  local.get 4
                  i32.store
                  local.get 0
                  i32.const 20
                  i32.add
                  local.set 4
                  local.get 0
                  i32.const 36
                  i32.add
                  i32.load8_u
                  if ;; label = @7
                    local.get 4
                    call $tinygo_rewind
                    br 4 (;@3;)
                  end
                  local.get 4
                  call $tinygo_launch
                  local.get 0
                  i32.const 1
                  i32.store8 offset=36
                  br 3 (;@3;)
                end
                i32.const 66028
                local.get 6
                i32.store
                local.get 2
                i32.const -64
                i32.sub
                global.set $__stack_pointer
                return
              end
            end
            local.get 5
            i32.const 2
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              call $runtime.waitForEvents
              i32.const 2
              global.get 1
              i32.const 1
              i32.eq
              br_if 3 (;@1;)
              drop
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              unreachable
            end
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            i32.const 65844
            local.get 1
            i32.store
            i32.const 66028
            i32.load
            local.set 1
            i32.const 66028
            local.get 0
            i32.load offset=16
            i32.store
            local.get 0
            local.get 1
            i32.store offset=16
            local.get 0
            i32.const 28
            i32.add
            i32.load
            local.tee 1
            local.get 0
            i32.const 32
            i32.add
            i32.load
            i32.le_u
            local.tee 0
            br_if 1 (;@2;)
          end
        end
        local.get 5
        i32.const 3
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          i32.const 65536
          i32.const 14
          call $runtime.runtimePanic.llvm.17335636212724678214
          i32.const 3
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 0
      i32.store
      local.get 3
      local.get 1
      i32.store offset=4
      local.get 3
      local.get 2
      i32.store offset=8
      local.get 3
      local.get 4
      i32.store offset=12
      local.get 3
      local.get 6
      i32.store offset=16
      global.get 2
      global.get 2
      i32.load
      i32.const 20
      i32.add
      i32.store
    )
    (func $runtime.run$1$gowrapper (;42;) (type $.rodata) (param i32)
      (local i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 1
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          call $runtime.run$1
        end
        local.get 1
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          call $runtime.deadlock
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.waitForEvents (;43;) (type $.data)
      (local i32)
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if (result i32) ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
        else
          i32.const 0
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65760
          i32.const 27
          call $runtime.runtimePanic.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.run$1 (;44;) (type $.data)
      i32.const 65848
      memory.size
      i32.const 16
      i32.shl
      i32.store
      call $__wasm_call_ctors
      i32.const 66036
      i32.const 1
      i32.store8
    )
    (func $runtime.deadlock (;45;) (type $.data)
      (local i32)
      block (result i32) ;; label = @1
        block (result i32) ;; label = @2
          global.get 1
          i32.const 2
          i32.eq
          if ;; label = @3
            global.get 2
            global.get 2
            i32.load
            i32.const 4
            i32.sub
            i32.store
            global.get 2
            i32.load
            i32.load
            local.set 0
          end
          local.get 0
        end
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          call $internal/task.Pause
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        local.get 0
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          i32.const 65752
          call $runtime._panic.llvm.17335636212724678214
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        return
      end
      local.set 0
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $runtime.printitf.llvm.17335636212724678214 (;46;) (type $.rodata) (param i32)
      (local i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 8
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 1
        i32.load
        local.set 0
        local.get 1
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 2
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 0
          i32.load
          local.set 1
          local.get 0
          i32.load offset=4
          local.set 0
        end
        local.get 2
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 0
          call $runtime.printstring.llvm.17335636212724678214
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        return
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.add
      i32.store
    )
    (func $runtime.hashmapGet.llvm.17335636212724678214 (;47;) (type 2) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 52
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 4
        i32.load
        local.set 0
        local.get 4
        i32.load offset=8
        local.set 2
        local.get 4
        i32.load offset=12
        local.set 3
        local.get 4
        i32.load offset=16
        local.set 5
        local.get 4
        i32.load offset=20
        local.set 6
        local.get 4
        i32.load offset=24
        local.set 7
        local.get 4
        i32.load offset=28
        local.set 8
        local.get 4
        i32.load offset=32
        local.set 9
        local.get 4
        i32.load offset=36
        local.set 10
        local.get 4
        i32.load offset=40
        local.set 11
        local.get 4
        i32.load offset=44
        local.set 12
        local.get 4
        i32.load offset=48
        local.set 13
        local.get 4
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 14
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 48
          i32.sub
          local.tee 5
          global.set $__stack_pointer
          local.get 5
          i32.const 40
          i32.add
          i32.const 0
          i32.store
          local.get 5
          i64.const 0
          i64.store offset=32
          local.get 5
          i32.const 7
          i32.store offset=12
          i32.const 66028
          i32.load
          local.set 9
          i32.const 66028
          local.get 5
          i32.const 8
          i32.add
          i32.store
          local.get 5
          local.get 9
          i32.store offset=8
          local.get 5
          local.get 0
          i32.load
          local.tee 6
          i32.store offset=16
          local.get 6
          local.get 0
          i32.load offset=16
          local.get 0
          i32.load offset=12
          i32.add
          i32.const 3
          i32.shl
          i32.const 12
          i32.add
          local.tee 8
          i32.const -1
          i32.const -1
          local.get 0
          i32.load8_u offset=20
          local.tee 7
          i32.shl
          i32.const -1
          i32.xor
          local.tee 10
          local.get 7
          i32.const 31
          i32.gt_u
          select
          local.get 3
          i32.and
          i32.mul
          local.tee 7
          i32.add
          local.set 6
          local.get 3
          i32.const 24
          i32.shr_u
          local.tee 3
          i32.const 1
          local.get 3
          select
          local.set 11
        end
        block ;; label = @2
          block ;; label = @3
            loop ;; label = @4
              block ;; label = @5
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 5
                  local.get 6
                  i32.store offset=24
                  local.get 5
                  local.get 6
                  i32.store offset=28
                  local.get 5
                  local.get 6
                  i32.store offset=20
                  local.get 6
                  i32.eqz
                  br_if 1 (;@5;)
                  i32.const 0
                  local.set 3
                end
                loop ;; label = @6
                  block ;; label = @7
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 3
                      i32.const 8
                      i32.eq
                      local.tee 7
                      br_if 1 (;@7;)
                      local.get 11
                      local.get 3
                      local.get 6
                      i32.add
                      i32.load8_u
                      i32.ne
                      local.set 7
                    end
                    block ;; label = @8
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 7
                        br_if 1 (;@8;)
                        local.get 0
                        i32.load offset=12
                        local.set 7
                        local.get 0
                        i32.load offset=16
                        local.set 13
                        local.get 5
                        local.get 0
                        i32.load offset=24
                        local.tee 10
                        i32.store offset=32
                        local.get 5
                        local.get 0
                        i32.load offset=28
                        local.tee 8
                        i32.store offset=36
                        local.get 8
                        i32.eqz
                        br_if 6 (;@3;)
                        local.get 3
                        local.get 7
                        i32.mul
                        local.get 6
                        i32.add
                        i32.const 12
                        i32.add
                        local.set 12
                      end
                      local.get 14
                      i32.const 0
                      global.get 1
                      select
                      i32.eqz
                      if ;; label = @9
                        local.get 1
                        local.get 12
                        local.get 7
                        local.get 10
                        local.get 8
                        call_indirect (type 2)
                        local.set 4
                        i32.const 0
                        global.get 1
                        i32.const 1
                        i32.eq
                        br_if 8 (;@1;)
                        drop
                        local.get 4
                        local.set 8
                      end
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 8
                        i32.const 1
                        i32.and
                        i32.eqz
                        local.tee 8
                        br_if 1 (;@8;)
                        local.get 2
                        local.get 6
                        local.get 3
                        local.get 13
                        i32.mul
                        local.get 7
                        i32.const 3
                        i32.shl
                        i32.add
                        i32.add
                        i32.const 12
                        i32.add
                        local.get 0
                        i32.load offset=16
                        memory.copy
                        br 7 (;@2;)
                      end
                    end
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 3
                      i32.const 1
                      i32.add
                      local.set 3
                      br 2 (;@6;)
                    end
                  end
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 5
                  local.get 6
                  i32.load offset=8
                  local.tee 6
                  i32.store offset=40
                  br 2 (;@4;)
                end
              end
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 2
              i32.const 0
              local.get 0
              i32.load offset=16
              memory.fill
              br 2 (;@2;)
            end
          end
          local.get 14
          i32.const 1
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.nilPanic
            i32.const 1
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          i32.const 66028
          local.get 9
          i32.store
          local.get 5
          i32.const 48
          i32.add
          global.set $__stack_pointer
          local.get 6
          i32.const 0
          i32.ne
          return
        end
        unreachable
      end
      local.set 4
      global.get 2
      i32.load
      local.get 4
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 4
      local.get 0
      i32.store
      local.get 4
      local.get 1
      i32.store offset=4
      local.get 4
      local.get 2
      i32.store offset=8
      local.get 4
      local.get 3
      i32.store offset=12
      local.get 4
      local.get 5
      i32.store offset=16
      local.get 4
      local.get 6
      i32.store offset=20
      local.get 4
      local.get 7
      i32.store offset=24
      local.get 4
      local.get 8
      i32.store offset=28
      local.get 4
      local.get 9
      i32.store offset=32
      local.get 4
      local.get 10
      i32.store offset=36
      local.get 4
      local.get 11
      i32.store offset=40
      local.get 4
      local.get 12
      i32.store offset=44
      local.get 4
      local.get 13
      i32.store offset=48
      global.get 2
      global.get 2
      i32.load
      i32.const 52
      i32.add
      i32.store
      i32.const 0
    )
    (func $runtime.hashmapSet.llvm.17335636212724678214 (;48;) (type 11) (param i32 i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 68
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 5
        i32.load
        local.set 0
        local.get 5
        i32.load offset=8
        local.set 2
        local.get 5
        i32.load offset=12
        local.set 3
        local.get 5
        i32.load offset=16
        local.set 4
        local.get 5
        i32.load offset=20
        local.set 6
        local.get 5
        i32.load offset=24
        local.set 7
        local.get 5
        i32.load offset=28
        local.set 8
        local.get 5
        i32.load offset=32
        local.set 9
        local.get 5
        i32.load offset=36
        local.set 10
        local.get 5
        i32.load offset=40
        local.set 11
        local.get 5
        i32.load offset=44
        local.set 12
        local.get 5
        i32.load offset=48
        local.set 14
        local.get 5
        i32.load offset=52
        local.set 15
        local.get 5
        i32.load offset=56
        local.set 16
        local.get 5
        i32.load offset=60
        local.set 17
        local.get 5
        i32.load offset=64
        local.set 18
        local.get 5
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 13
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 256
          i32.sub
          local.tee 4
          global.set $__stack_pointer
          local.get 4
          i32.const 50
          i32.store offset=52
          local.get 4
          i32.const 56
          i32.add
          i32.const 0
          i32.const 200
          memory.fill
          local.get 4
          i32.const 66028
          i32.load
          local.tee 17
          i32.store offset=48
          i32.const 66028
          local.get 4
          i32.const 48
          i32.add
          i32.store
          local.get 0
          i32.eqz
          local.set 6
        end
        block ;; label = @2
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 6
              br_if 1 (;@3;)
              local.get 0
              i32.load8_u offset=20
              local.tee 7
              i32.const 29
              i32.gt_u
              local.set 6
            end
            block ;; label = @4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 6
                br_if 1 (;@4;)
                i32.const 6
                local.get 7
                i32.shl
                local.tee 9
                local.get 0
                i32.load offset=8
                i32.ge_u
                local.tee 6
                br_if 1 (;@4;)
                local.get 4
                i64.const 0
                i64.store offset=24
                local.get 4
                local.get 0
                i32.load offset=36
                local.tee 3
                i32.store offset=72
                local.get 4
                local.get 0
                i32.load offset=32
                local.tee 6
                i32.store offset=68
                local.get 4
                local.get 0
                i32.load offset=28
                local.tee 8
                i32.store offset=64
                local.get 4
                local.get 0
                i32.load offset=24
                local.tee 10
                i32.store offset=60
                local.get 4
                local.get 0
                i32.load
                i32.store offset=56
                local.get 4
                local.get 3
                i32.store offset=44
                local.get 4
                local.get 6
                i32.store offset=40
                local.get 4
                local.get 8
                i32.store offset=36
                local.get 4
                local.get 10
                i32.store offset=32
                local.get 4
                local.get 0
                i32.load offset=16
                i32.store offset=24
                local.get 4
                local.get 0
                i32.load offset=12
                i32.store offset=20
                i32.const 65788
                i32.load
                local.tee 3
                i32.const 7
                i32.shl
                local.set 6
                local.get 3
                local.get 6
                i32.xor
                local.tee 3
                i32.const 1
                i32.shr_u
                local.set 6
                local.get 3
                local.get 6
                i32.xor
                local.tee 3
                i32.const 9
                i32.shl
                local.set 6
                i32.const 65788
                local.get 3
                local.get 6
                i32.xor
                local.tee 3
                i32.store
                local.get 4
                i32.const 0
                i32.store offset=16
                local.get 4
                local.get 3
                i32.store offset=12
                local.get 4
                local.get 7
                i32.const 1
                i32.add
                local.tee 3
                i32.store8 offset=28
                local.get 0
                i32.load offset=12
                local.tee 9
                local.get 0
                i32.load offset=16
                i32.add
                i32.const 3
                i32.shl
                i32.const 12
                i32.add
                local.tee 6
                local.get 3
                i32.shl
                local.set 3
              end
              local.get 13
              i32.const 0
              global.get 1
              select
              i32.eqz
              if ;; label = @5
                local.get 3
                call $runtime.alloc.llvm.17335636212724678214
                local.set 5
                i32.const 0
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 5
                local.set 3
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 4
                local.get 3
                i32.store offset=8
                local.get 4
                local.get 3
                i32.store offset=76
                local.get 0
                i32.load offset=12
                local.set 3
              end
              local.get 13
              i32.const 1
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 3
                call $runtime.alloc.llvm.17335636212724678214
                local.set 5
                i32.const 1
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 5
                local.set 6
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 4
                local.get 6
                i32.store offset=80
                local.get 0
                i32.load offset=16
                local.set 3
              end
              local.get 13
              i32.const 2
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 3
                call $runtime.alloc.llvm.17335636212724678214
                local.set 5
                i32.const 2
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 5
                local.set 15
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 4
                local.get 15
                i32.store offset=84
                i32.const 0
                local.set 9
                i32.const 0
                local.set 14
                i32.const 0
                local.set 12
                i32.const 0
                local.set 7
                i32.const 0
                local.set 3
              end
              loop ;; label = @5
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 12
                  i32.store offset=88
                  local.get 12
                  i32.eqz
                  if ;; label = @7
                    local.get 4
                    local.get 0
                    i32.load
                    local.tee 12
                    i32.store offset=92
                    i32.const 0
                    i32.const 1
                    local.get 0
                    i32.load8_u offset=20
                    local.tee 8
                    i32.shl
                    local.tee 10
                    local.get 8
                    i32.const 31
                    i32.gt_u
                    local.tee 8
                    select
                    local.set 14
                  end
                  local.get 4
                  local.get 12
                  i32.store offset=108
                  local.get 4
                  local.get 12
                  i32.store offset=124
                end
                block ;; label = @6
                  loop ;; label = @7
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 4
                      local.get 3
                      i32.store offset=96
                      local.get 7
                      i32.const 255
                      i32.and
                      i32.const 8
                      i32.lt_u
                      local.tee 8
                      i32.eqz
                      if ;; label = @9
                        local.get 3
                        i32.eqz
                        br_if 6 (;@3;)
                        local.get 4
                        local.get 3
                        i32.load offset=8
                        local.tee 3
                        i32.store offset=100
                        i32.const 0
                        local.set 7
                      end
                      local.get 4
                      local.get 3
                      i32.store offset=104
                      local.get 3
                      i32.eqz
                      if ;; label = @9
                        local.get 9
                        local.get 14
                        i32.ge_u
                        local.tee 3
                        br_if 3 (;@6;)
                        local.get 12
                        local.get 9
                        local.get 0
                        i32.load offset=16
                        local.get 0
                        i32.load offset=12
                        i32.add
                        i32.const 3
                        i32.shl
                        i32.const 12
                        i32.add
                        i32.mul
                        i32.add
                        local.set 3
                        local.get 9
                        i32.const 1
                        i32.add
                        local.set 9
                      end
                      local.get 4
                      local.get 3
                      i32.store offset=116
                      local.get 4
                      local.get 3
                      i32.store offset=120
                      local.get 4
                      local.get 3
                      i32.store offset=112
                      local.get 3
                      i32.eqz
                      br_if 5 (;@3;)
                      local.get 7
                      i32.const 255
                      i32.and
                      local.tee 10
                      local.get 3
                      i32.add
                      i32.load8_u
                      local.tee 8
                      i32.eqz
                      if ;; label = @9
                        local.get 7
                        i32.const 1
                        i32.add
                        local.set 7
                        br 2 (;@7;)
                      end
                      local.get 6
                      local.get 10
                      local.get 0
                      i32.load offset=12
                      local.tee 8
                      i32.mul
                      local.get 3
                      i32.add
                      i32.const 12
                      i32.add
                      local.get 8
                      memory.copy
                      local.get 4
                      local.get 0
                      i32.load
                      local.tee 11
                      i32.store offset=128
                      local.get 11
                      local.get 12
                      i32.ne
                      local.set 11
                    end
                    block ;; label = @8
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 11
                        i32.eqz
                        if ;; label = @10
                          local.get 8
                          i32.const 3
                          i32.shl
                          local.set 11
                          local.get 15
                          local.get 11
                          local.get 10
                          local.get 0
                          i32.load offset=16
                          local.tee 8
                          i32.mul
                          i32.add
                          local.get 3
                          i32.add
                          i32.const 12
                          i32.add
                          local.tee 10
                          local.get 8
                          memory.copy
                          local.get 7
                          i32.const 1
                          i32.add
                          local.set 7
                          br 2 (;@8;)
                        end
                        local.get 4
                        local.get 0
                        i32.load offset=32
                        local.tee 11
                        i32.store offset=132
                        local.get 4
                        local.get 0
                        i32.load offset=36
                        local.tee 10
                        i32.store offset=136
                        local.get 10
                        i32.eqz
                        br_if 6 (;@3;)
                        local.get 0
                        i32.load offset=4
                        local.set 16
                        local.get 7
                        i32.const 1
                        i32.add
                        local.set 7
                      end
                      local.get 13
                      i32.const 3
                      i32.eq
                      i32.const 1
                      global.get 1
                      select
                      if ;; label = @9
                        local.get 6
                        local.get 8
                        local.get 16
                        local.get 11
                        local.get 10
                        call_indirect (type 2)
                        local.set 5
                        i32.const 3
                        global.get 1
                        i32.const 1
                        i32.eq
                        br_if 8 (;@1;)
                        drop
                        local.get 5
                        local.set 8
                      end
                      local.get 13
                      i32.const 4
                      i32.eq
                      i32.const 1
                      global.get 1
                      select
                      if ;; label = @9
                        local.get 0
                        local.get 6
                        local.get 15
                        local.get 8
                        call $runtime.hashmapGet.llvm.17335636212724678214
                        local.set 5
                        i32.const 4
                        global.get 1
                        i32.const 1
                        i32.eq
                        br_if 8 (;@1;)
                        drop
                        local.get 5
                        local.set 8
                      end
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 8
                        i32.const 1
                        i32.and
                        i32.eqz
                        local.tee 8
                        br_if 2 (;@7;)
                      end
                    end
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 4
                    local.get 4
                    i32.load offset=40
                    local.tee 10
                    i32.store offset=140
                    local.get 4
                    local.get 4
                    i32.load offset=44
                    local.tee 8
                    i32.store offset=144
                    local.get 8
                    i32.eqz
                    br_if 4 (;@3;)
                    local.get 4
                    i32.load offset=20
                    local.set 16
                    local.get 4
                    i32.load offset=12
                    local.set 18
                    local.get 4
                    i32.const 8
                    i32.add
                    local.set 11
                  end
                  local.get 13
                  i32.const 5
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 6
                    local.get 16
                    local.get 18
                    local.get 10
                    local.get 8
                    call_indirect (type 2)
                    local.set 5
                    i32.const 5
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 6 (;@1;)
                    drop
                    local.get 5
                    local.set 8
                  end
                  local.get 13
                  i32.const 6
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 11
                    local.get 6
                    local.get 15
                    local.get 8
                    call $runtime.hashmapSet.llvm.17335636212724678214
                    i32.const 6
                    global.get 1
                    i32.const 1
                    i32.eq
                    br_if 6 (;@1;)
                    drop
                  end
                  global.get 1
                  i32.eqz
                  br_if 1 (;@5;)
                end
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 0
                local.get 4
                i32.load offset=8
                local.tee 3
                i32.store
                local.get 0
                local.get 4
                i64.load offset=12 align=4
                i64.store offset=4 align=4
                local.get 0
                local.get 4
                i64.load offset=20 align=4
                i64.store offset=12 align=4
                local.get 0
                local.get 4
                i32.load8_u offset=28
                i32.store8 offset=20
                local.get 0
                local.get 4
                i32.load offset=32
                local.tee 7
                i32.store offset=24
                local.get 0
                local.get 4
                i32.load offset=36
                local.tee 6
                i32.store offset=28
                local.get 0
                local.get 4
                i32.load offset=40
                local.tee 8
                i32.store offset=32
                local.get 0
                local.get 4
                i32.load offset=44
                local.tee 10
                i32.store offset=36
                local.get 4
                local.get 3
                i32.store offset=148
                local.get 4
                local.get 7
                i32.store offset=152
                local.get 4
                local.get 6
                i32.store offset=156
                local.get 4
                local.get 8
                i32.store offset=160
                local.get 4
                local.get 10
                i32.store offset=164
                local.get 4
                local.get 0
                i32.load offset=32
                local.tee 7
                i32.store offset=168
                local.get 4
                local.get 0
                i32.load offset=36
                local.tee 3
                i32.store offset=172
                local.get 3
                i32.eqz
                br_if 2 (;@3;)
                local.get 0
                i32.load offset=4
                local.set 9
                local.get 0
                i32.load offset=12
                local.set 6
              end
              local.get 13
              i32.const 7
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 1
                local.get 6
                local.get 9
                local.get 7
                local.get 3
                call_indirect (type 2)
                local.set 5
                i32.const 7
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 5
                local.set 3
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 0
                i32.load8_u offset=20
                local.set 7
              end
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 4
              local.get 0
              i32.load
              local.tee 6
              i32.store offset=176
              local.get 0
              i32.load offset=12
              local.get 0
              i32.load offset=16
              i32.add
              i32.const 3
              i32.shl
              i32.const 12
              i32.add
              i32.const -1
              i32.const -1
              local.get 7
              i32.const 255
              i32.and
              local.tee 7
              i32.shl
              i32.const -1
              i32.xor
              local.get 7
              i32.const 31
              i32.gt_u
              select
              local.get 3
              i32.and
              i32.mul
              local.get 6
              i32.add
              local.set 9
              local.get 3
              i32.const 24
              i32.shr_u
              local.tee 3
              i32.const 1
              local.get 3
              select
              local.set 14
              i32.const 0
              local.set 7
              i32.const 0
              local.set 10
              i32.const 0
              local.set 8
              i32.const 0
              local.set 3
            end
            loop ;; label = @4
              block ;; label = @5
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 9
                  local.tee 6
                  i32.store offset=212
                  local.get 4
                  local.get 6
                  i32.store offset=216
                  local.get 4
                  local.get 6
                  i32.store offset=196
                  local.get 4
                  local.get 3
                  i32.store offset=192
                  local.get 4
                  local.get 7
                  i32.store offset=188
                  local.get 4
                  local.get 10
                  i32.store offset=184
                  local.get 4
                  local.get 8
                  i32.store offset=180
                  local.get 6
                  i32.eqz
                  local.tee 9
                  br_if 1 (;@5;)
                  i32.const 0
                  local.set 3
                end
                loop ;; label = @6
                  block ;; label = @7
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 4
                      local.get 10
                      i32.store offset=204
                      local.get 4
                      local.get 7
                      i32.store offset=208
                      local.get 4
                      local.get 8
                      i32.store offset=200
                      local.get 3
                      i32.const 8
                      i32.eq
                      br_if 1 (;@7;)
                      local.get 3
                      local.get 6
                      i32.add
                      local.tee 9
                      i32.load8_u
                      local.get 7
                      i32.or
                      local.set 11
                      local.get 4
                      local.get 8
                      local.get 9
                      local.get 11
                      select
                      local.tee 8
                      i32.store offset=220
                      local.get 4
                      local.get 7
                      local.get 0
                      i32.load offset=12
                      local.tee 12
                      local.get 3
                      i32.mul
                      local.get 6
                      i32.add
                      i32.const 12
                      i32.add
                      local.tee 15
                      local.get 11
                      select
                      local.tee 7
                      i32.store offset=228
                      local.get 4
                      local.get 10
                      local.get 0
                      i32.load offset=16
                      local.get 3
                      i32.mul
                      local.get 12
                      i32.const 3
                      i32.shl
                      i32.add
                      local.get 6
                      i32.add
                      i32.const 12
                      i32.add
                      local.tee 16
                      local.get 11
                      select
                      local.tee 10
                      i32.store offset=224
                      local.get 14
                      local.get 9
                      i32.load8_u
                      i32.ne
                      local.set 9
                    end
                    block ;; label = @8
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 9
                        br_if 1 (;@8;)
                        local.get 4
                        local.get 0
                        i32.load offset=24
                        local.tee 11
                        i32.store offset=232
                        local.get 4
                        local.get 0
                        i32.load offset=28
                        local.tee 9
                        i32.store offset=236
                        local.get 9
                        i32.eqz
                        br_if 6 (;@3;)
                      end
                      local.get 13
                      i32.const 8
                      i32.eq
                      i32.const 1
                      global.get 1
                      select
                      if ;; label = @9
                        local.get 1
                        local.get 15
                        local.get 12
                        local.get 11
                        local.get 9
                        call_indirect (type 2)
                        local.set 5
                        i32.const 8
                        global.get 1
                        i32.const 1
                        i32.eq
                        br_if 8 (;@1;)
                        drop
                        local.get 5
                        local.set 9
                      end
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 9
                        i32.const 1
                        i32.and
                        i32.eqz
                        local.tee 9
                        br_if 1 (;@8;)
                        local.get 16
                        local.get 2
                        local.get 0
                        i32.load offset=16
                        memory.copy
                        br 7 (;@2;)
                      end
                    end
                    global.get 1
                    i32.eqz
                    if ;; label = @8
                      local.get 3
                      i32.const 1
                      i32.add
                      local.set 3
                      br 2 (;@6;)
                    end
                  end
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 6
                  i32.load offset=8
                  local.tee 9
                  i32.store offset=240
                  local.get 6
                  local.set 3
                  br 2 (;@4;)
                end
              end
            end
            block ;; label = @4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 7
                br_if 1 (;@4;)
                local.get 0
                i32.load offset=16
                local.get 0
                i32.load offset=12
                i32.add
                i32.const 3
                i32.shl
                i32.const 12
                i32.add
                local.set 6
              end
              local.get 13
              i32.const 9
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 6
                call $runtime.alloc.llvm.17335636212724678214
                local.set 5
                i32.const 9
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 5
                local.set 7
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 0
                local.get 0
                i32.load offset=8
                i32.const 1
                i32.add
                i32.store offset=8
                local.get 4
                local.get 7
                i32.store offset=248
                local.get 4
                local.get 7
                i32.store offset=252
                local.get 4
                local.get 7
                i32.store offset=244
                local.get 7
                i32.const 12
                i32.add
                local.tee 6
                local.get 1
                local.get 0
                i32.load offset=12
                local.tee 8
                memory.copy
                local.get 6
                local.get 8
                i32.const 3
                i32.shl
                i32.add
                local.get 2
                local.get 0
                i32.load offset=16
                memory.copy
                local.get 7
                local.get 14
                i32.store8
                local.get 3
                i32.eqz
                br_if 2 (;@3;)
                local.get 3
                local.get 7
                i32.store offset=8
                br 3 (;@2;)
              end
            end
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 0
              local.get 0
              i32.load offset=8
              i32.const 1
              i32.add
              i32.store offset=8
              local.get 7
              local.get 1
              local.get 0
              i32.load offset=12
              memory.copy
              local.get 10
              local.get 2
              local.get 0
              i32.load offset=16
              memory.copy
              local.get 8
              i32.eqz
              br_if 1 (;@3;)
              local.get 8
              local.get 14
              i32.store8
              br 2 (;@2;)
            end
          end
          local.get 13
          i32.const 10
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.nilPanic
            i32.const 10
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          i32.const 66028
          local.get 17
          i32.store
          local.get 4
          i32.const 256
          i32.add
          global.set $__stack_pointer
        end
        return
      end
      local.set 5
      global.get 2
      i32.load
      local.get 5
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 5
      local.get 0
      i32.store
      local.get 5
      local.get 1
      i32.store offset=4
      local.get 5
      local.get 2
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 5
      local.get 4
      i32.store offset=16
      local.get 5
      local.get 6
      i32.store offset=20
      local.get 5
      local.get 7
      i32.store offset=24
      local.get 5
      local.get 8
      i32.store offset=28
      local.get 5
      local.get 9
      i32.store offset=32
      local.get 5
      local.get 10
      i32.store offset=36
      local.get 5
      local.get 11
      i32.store offset=40
      local.get 5
      local.get 12
      i32.store offset=44
      local.get 5
      local.get 14
      i32.store offset=48
      local.get 5
      local.get 15
      i32.store offset=52
      local.get 5
      local.get 16
      i32.store offset=56
      local.get 5
      local.get 17
      i32.store offset=60
      local.get 5
      local.get 18
      i32.store offset=64
      global.get 2
      global.get 2
      i32.load
      i32.const 68
      i32.add
      i32.store
    )
    (func $main._SET (;49;) (type 2) (param i32 i32 i32 i32) (result i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 8
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 1
        i32.load
        local.set 0
        local.get 1
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 4
        end
        local.get 2
        local.get 1
        local.get 2
        i32.gt_u
        global.get 1
        select
        local.set 2
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 2
            br_if 1 (;@2;)
            local.get 3
            i32.const 2
            i32.shl
            local.tee 2
            local.get 1
            i32.gt_u
            br_if 1 (;@2;)
            local.get 1
            local.get 2
            i32.sub
            local.set 1
            local.get 0
            local.get 2
            i32.add
            local.set 0
          end
          local.get 4
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            local.get 0
            local.get 1
            call $#func10<_encoding/binary.littleEndian_.Uint32>
            local.set 2
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
            local.get 2
            local.set 0
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 0
            return
          end
        end
        local.get 4
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.slicePanic.llvm.17335636212724678214
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        unreachable
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.add
      i32.store
      i32.const 0
    )
    (func $main._GET (;50;) (type 2) (param i32 i32 i32 i32) (result i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 8
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 1
        i32.load
        local.set 0
        local.get 1
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 4
        end
        local.get 2
        local.get 1
        local.get 2
        i32.gt_u
        global.get 1
        select
        local.set 2
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 2
            br_if 1 (;@2;)
            local.get 3
            i32.const 2
            i32.shl
            local.tee 2
            local.get 1
            i32.gt_u
            br_if 1 (;@2;)
            local.get 1
            local.get 2
            i32.sub
            local.set 1
            local.get 0
            local.get 2
            i32.add
            local.set 0
          end
          local.get 4
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            local.get 0
            local.get 1
            call $#func10<_encoding/binary.littleEndian_.Uint32>
            local.set 2
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
            local.get 2
            local.set 0
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 0
            return
          end
        end
        local.get 4
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.slicePanic.llvm.17335636212724678214
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          unreachable
        end
        unreachable
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.add
      i32.store
      i32.const 0
    )
    (func $__wasm_export_md5_init_post_return (;51;) (type $.rodata) (param i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 0
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 1
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 0
            i32.load8_u
            br_if 1 (;@2;)
            local.get 0
            i32.const 36
            i32.add
            i32.load
            i32.const 1
            i32.lt_s
            br_if 1 (;@2;)
            local.get 0
            i32.const 32
            i32.add
            i32.load
            local.set 0
          end
          local.get 1
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            local.get 0
            call $free
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $__wasm_export_md5_hash_post_return (;52;) (type $.rodata) (param i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 0
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 1
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 0
            i32.load8_u
            br_if 1 (;@2;)
            local.get 0
            i32.const 8
            i32.add
            i32.load
            i32.const 1
            i32.lt_s
            br_if 1 (;@2;)
            local.get 0
            i32.const 4
            i32.add
            i32.load
            local.set 0
          end
          local.get 1
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            local.get 0
            call $free
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $cabi_realloc (;53;) (type 2) (param i32 i32 i32 i32) (result i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 3
        i32.load
        local.set 0
        local.get 3
        i32.load offset=4
        local.set 2
        local.get 3
        i32.load offset=8
        local.set 3
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 4
        end
        block ;; label = @2
          global.get 1
          i32.const 1
          local.get 1
          local.get 3
          i32.eqz
          global.get 1
          select
          select
          i32.eqz
          br_if 0 (;@2;)
          local.get 4
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            local.get 0
            local.get 3
            call $realloc
            local.set 1
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
            local.get 1
            local.set 2
          end
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 2
            br_if 1 (;@2;)
            call $abort
            unreachable
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 2
          return
        end
        unreachable
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 1
      local.get 0
      i32.store
      local.get 1
      local.get 2
      i32.store offset=4
      local.get 1
      local.get 3
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
      i32.const 0
    )
    (func $md5_list_u8_free (;54;) (type $.rodata) (param i32)
      (local i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 4
        i32.sub
        i32.store
        global.get 2
        i32.load
        i32.load
        local.set 0
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 1
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 0
            i32.load offset=4
            i32.eqz
            br_if 1 (;@2;)
            local.get 0
            i32.load
            local.set 0
          end
          local.get 1
          i32.const 0
          global.get 1
          select
          i32.eqz
          if ;; label = @3
            local.get 0
            call $free
            i32.const 0
            global.get 1
            i32.const 1
            i32.eq
            br_if 2 (;@1;)
            drop
          end
        end
        return
      end
      local.set 1
      global.get 2
      i32.load
      local.get 1
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.get 0
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
    )
    (func $__wasm_export_md5_init (;55;) (type 4) (result i32)
      (local i32 i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 8
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 1
        i32.load
        local.set 0
        local.get 1
        i32.load offset=4
        local.set 1
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 2
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 48
          i32.sub
          local.tee 0
          global.set $__stack_pointer
          local.get 0
          i32.const 8
          i32.add
          local.set 1
        end
        local.get 2
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          local.get 1
          call $md5_init
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          block ;; label = @3
            local.get 0
            i32.load8_u offset=8
            if ;; label = @4
              i32.const 66320
              i32.const 1
              i32.store8
              i32.const 66328
              local.get 0
              i32.load8_u offset=16
              i32.store8
              br 1 (;@3;)
            end
            i32.const 66328
            local.get 0
            i64.load offset=16
            i64.store
            i32.const 66336
            local.get 0
            i32.const 24
            i32.add
            i64.load
            i64.store
            i32.const 66344
            local.get 0
            i32.const 32
            i32.add
            i64.load
            i64.store
            i32.const 66352
            local.get 0
            i32.const 40
            i32.add
            i64.load
            i64.store
            i32.const 66320
            i32.const 0
            i32.store8
          end
          local.get 0
          i32.const 48
          i32.add
          global.set $__stack_pointer
          i32.const 66320
          return
        end
        unreachable
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.add
      i32.store
      i32.const 0
    )
    (func $__wasm_export_md5_update (;56;) (type 12) (param i64 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
      (local i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 12
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 9
        i32.load
        local.set 1
        local.get 9
        i32.load offset=4
        local.set 2
        local.get 9
        i32.load offset=8
        local.set 9
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 10
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 48
          i32.sub
          local.tee 9
          global.set $__stack_pointer
          local.get 9
          i32.const 44
          i32.add
          local.get 6
          i32.store
          local.get 9
          local.get 5
          i32.store offset=40
          local.get 9
          local.get 4
          i32.store offset=36
          local.get 9
          local.get 3
          i32.store offset=32
          local.get 9
          local.get 2
          i32.store offset=28
          local.get 9
          local.get 1
          i32.store offset=24
          local.get 9
          local.get 0
          i64.store offset=16
          local.get 9
          local.get 8
          i32.store offset=12
          local.get 9
          local.get 7
          i32.store offset=8
          local.get 9
          i32.const 8
          i32.add
          local.set 2
          local.get 9
          i32.const 16
          i32.add
          local.set 1
        end
        local.get 10
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 2
          local.get 9
          call $md5_update
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          block ;; label = @3
            local.get 9
            i32.load8_u
            if ;; label = @4
              i32.const 66320
              i32.const 1
              i32.store8
              i32.const 66321
              local.get 9
              i32.load8_u offset=1
              i32.store8
              br 1 (;@3;)
            end
            i32.const 66320
            i32.const 0
            i32.store8
          end
          local.get 9
          i32.const 48
          i32.add
          global.set $__stack_pointer
          i32.const 66320
          return
        end
        unreachable
      end
      local.set 3
      global.get 2
      i32.load
      local.get 3
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 3
      local.get 1
      i32.store
      local.get 3
      local.get 2
      i32.store offset=4
      local.get 3
      local.get 9
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
      i32.const 0
    )
    (func $__wasm_export_md5_hash (;57;) (type 13) (param i64 i32 i32 i32 i32 i32 i32) (result i32)
      (local i32 i32)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 8
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 7
        i32.load
        local.set 1
        local.get 7
        i32.load offset=4
        local.set 7
      end
      block (result i32) ;; label = @1
        global.get 1
        i32.const 2
        i32.eq
        if ;; label = @2
          global.get 2
          global.get 2
          i32.load
          i32.const 4
          i32.sub
          i32.store
          global.get 2
          i32.load
          i32.load
          local.set 8
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 48
          i32.sub
          local.tee 7
          global.set $__stack_pointer
          local.get 7
          i32.const 44
          i32.add
          local.get 6
          i32.store
          local.get 7
          local.get 5
          i32.store offset=40
          local.get 7
          local.get 4
          i32.store offset=36
          local.get 7
          local.get 3
          i32.store offset=32
          local.get 7
          local.get 2
          i32.store offset=28
          local.get 7
          local.get 1
          i32.store offset=24
          local.get 7
          local.get 0
          i64.store offset=16
          local.get 7
          i32.const 16
          i32.add
          local.set 1
        end
        local.get 8
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 7
          call $md5_hash
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          block ;; label = @3
            local.get 7
            i32.load8_u
            if ;; label = @4
              i32.const 66320
              i32.const 1
              i32.store8
              i32.const 66324
              local.get 7
              i32.load8_u offset=4
              i32.store8
              br 1 (;@3;)
            end
            i32.const 66324
            local.get 7
            i64.load offset=4 align=4
            i64.store align=4
            i32.const 66320
            i32.const 0
            i32.store8
          end
          local.get 7
          i32.const 48
          i32.add
          global.set $__stack_pointer
          i32.const 66320
          return
        end
        unreachable
      end
      local.set 2
      global.get 2
      i32.load
      local.get 2
      i32.store
      global.get 2
      global.get 2
      i32.load
      i32.const 4
      i32.add
      i32.store
      global.get 2
      i32.load
      local.tee 2
      local.get 1
      i32.store
      local.get 2
      local.get 7
      i32.store offset=4
      global.get 2
      global.get 2
      i32.load
      i32.const 8
      i32.add
      i32.store
      i32.const 0
    )
    (func $asyncify_start_unwind (;58;) (type $.rodata) (param i32)
      i32.const 1
      global.set 1
      local.get 0
      global.set 2
      global.get 2
      i32.load
      global.get 2
      i32.load offset=4
      i32.gt_u
      if ;; label = @1
        unreachable
      end
    )
    (func $asyncify_stop_unwind (;59;) (type $.data)
      i32.const 0
      global.set 1
      global.get 2
      i32.load
      global.get 2
      i32.load offset=4
      i32.gt_u
      if ;; label = @1
        unreachable
      end
    )
    (func $asyncify_start_rewind (;60;) (type $.rodata) (param i32)
      i32.const 2
      global.set 1
      local.get 0
      global.set 2
      global.get 2
      i32.load
      global.get 2
      i32.load offset=4
      i32.gt_u
      if ;; label = @1
        unreachable
      end
    )
    (func $asyncify_stop_rewind (;61;) (type $.data)
      i32.const 0
      global.set 1
      global.get 2
      i32.load
      global.get 2
      i32.load offset=4
      i32.gt_u
      if ;; label = @1
        unreachable
      end
    )
    (func $asyncify_get_state (;62;) (type 4) (result i32)
      global.get 1
    )
    (table (;0;) 4 4 funcref)
    (memory (;0;) 2)
    (global $__stack_pointer (;0;) (mut i32) i32.const 65536)
    (global (;1;) (mut i32) i32.const 0)
    (global (;2;) (mut i32) i32.const 0)
    (export "memory" (memory 0))
    (export "md5_init" (func $md5_init))
    (export "md5_update" (func $md5_update))
    (export "md5_hash" (func $md5_hash))
    (export "malloc" (func $malloc))
    (export "free" (func $free))
    (export "calloc" (func $calloc))
    (export "realloc" (func $realloc))
    (export "_start" (func $_start))
    (export "cabi_post_md5#init" (func $__wasm_export_md5_init_post_return))
    (export "cabi_post_md5#hash" (func $__wasm_export_md5_hash_post_return))
    (export "cabi_realloc" (func $cabi_realloc))
    (export "md5#init" (func $__wasm_export_md5_init))
    (export "md5#update" (func $__wasm_export_md5_update))
    (export "md5#hash" (func $__wasm_export_md5_hash))
    (export "asyncify_start_unwind" (func $asyncify_start_unwind))
    (export "asyncify_stop_unwind" (func $asyncify_stop_unwind))
    (export "asyncify_start_rewind" (func $asyncify_start_rewind))
    (export "asyncify_stop_rewind" (func $asyncify_stop_rewind))
    (export "asyncify_get_state" (func $asyncify_get_state))
    (elem (;0;) (i32.const 1) func $runtime.run$1$gowrapper $runtime.memequal $runtime.hash32.llvm.17335636212724678214)
    (data (;0;) (i32.const 65536) "stack overflowResult is Err\00\00\00\00\00\0e\00\01\00\0d\00\00\00free: invalid pointer\00\00\00(\00\01\00\15\00\00\00realloc: invalid pointerH\00\01\00\18\00\00\00out of memorypanic: panic: runtime error: nil pointer dereferenceindex out of rangeslice out of rangeunreachable\cd\00\01\00\0b\00\00\00deadlocked: no event source")
    (data (;1;) (i32.const 65788) "\c1\82\01\00@\01\01\00\00\00\00\00\f8\01\01\00\c1\82\01\00\00\00\00\00\04\00\00\00\0c\00\00\00\01\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\03")
  )
  (core module (;1;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32)))
    (type (;2;) (func (param i32 i32 i32 i32)))
    (type (;3;) (func (param i32) (result i32)))
    (type (;4;) (func (param i32 i32 i32)))
    (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;6;) (func (param i32 i64) (result i32)))
    (type (;7;) (func (result i32)))
    (type (;8;) (func (param i32 i32 i32) (result i32)))
    (type (;9;) (func (param i32 i32) (result i32)))
    (type (;10;) (func))
    (import "env" "memory" (memory (;0;) 0))
    (import "preopens" "get-directories" (func $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new19get_preopens_import17h4205590bf7df760dE (;0;) (type 0)))
    (import "filesystem" "get-type" (func $_ZN22wasi_snapshot_preview18bindings10filesystem8get_type10wit_import17h7d090d2e7a2ae18cE (;1;) (type 1)))
    (import "__main_module__" "cabi_realloc" (func $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17h6763862ee909b463E (;2;) (type 5)))
    (import "filesystem" "write-via-stream" (func $_ZN22wasi_snapshot_preview18bindings10filesystem16write_via_stream10wit_import17hcb22d44430a4a03fE (;3;) (type 6)))
    (import "filesystem" "append-via-stream" (func $_ZN22wasi_snapshot_preview18bindings10filesystem17append_via_stream10wit_import17h86207e845b06f098E (;4;) (type 3)))
    (import "filesystem" "drop-descriptor" (func $_ZN22wasi_snapshot_preview18bindings10filesystem15drop_descriptor10wit_import17ha65ceeff45dc784bE (;5;) (type 0)))
    (import "streams" "write" (func $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h736cb40cc9906a18E (;6;) (type 2)))
    (import "streams" "drop-input-stream" (func $_ZN22wasi_snapshot_preview18bindings7streams17drop_input_stream10wit_import17h11fabb9ee311ffdcE (;7;) (type 0)))
    (import "streams" "drop-output-stream" (func $_ZN22wasi_snapshot_preview18bindings7streams18drop_output_stream10wit_import17hf0ccada48d35a6d6E (;8;) (type 0)))
    (import "preopens" "get-stdio" (func $_ZN22wasi_snapshot_preview18bindings8preopens9get_stdio10wit_import17h581cf6df510702daE (;9;) (type 0)))
    (import "streams" "blocking-write" (func $_ZN22wasi_snapshot_preview18bindings7streams14blocking_write10wit_import17h903b9f1ee503dfe3E (;10;) (type 2)))
    (func $cabi_import_realloc (;11;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 0
                br_if 0 (;@5;)
                local.get 1
                br_if 0 (;@5;)
                call $_ZN22wasi_snapshot_preview15State3ptr17hfc8a4fb8633db0ffE
                local.tee 0
                i32.load
                local.tee 1
                i32.const 2147483647
                i32.ge_u
                br_if 1 (;@4;)
                local.get 0
                local.get 1
                i32.const 1
                i32.add
                i32.store
                local.get 0
                i32.load offset=8
                i32.const 560490357
                i32.ne
                br_if 2 (;@3;)
                block ;; label = @6
                  local.get 0
                  i32.const 65532
                  i32.add
                  i32.load
                  i32.const 560490357
                  i32.ne
                  br_if 0 (;@6;)
                  block ;; label = @7
                    local.get 0
                    i32.const 20
                    i32.add
                    i32.load
                    local.tee 1
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 1
                    local.get 2
                    local.get 3
                    call $_ZN22wasi_snapshot_preview19BumpArena5alloc17h1b2bb61f300673d6E
                    local.set 2
                    br 6 (;@1;)
                  end
                  local.get 0
                  i32.load offset=12
                  local.tee 1
                  i32.eqz
                  br_if 4 (;@2;)
                  block ;; label = @7
                    local.get 2
                    local.get 1
                    i32.add
                    i32.const -1
                    i32.add
                    i32.const 0
                    local.get 2
                    i32.sub
                    i32.and
                    local.tee 2
                    local.get 3
                    i32.add
                    local.tee 3
                    local.get 2
                    i32.ge_u
                    local.get 3
                    call $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hf2f3dab352eb4f26E
                    local.get 1
                    local.get 0
                    i32.const 16
                    i32.add
                    i32.load
                    i32.add
                    local.tee 3
                    local.get 1
                    i32.ge_u
                    local.get 3
                    call $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hf2f3dab352eb4f26E
                    i32.gt_u
                    br_if 0 (;@7;)
                    local.get 0
                    i32.const 0
                    i32.store offset=12
                    br 6 (;@1;)
                  end
                  local.get 4
                  i32.const 32
                  i32.store8 offset=47
                  local.get 4
                  i32.const 1701734764
                  i32.store offset=43 align=1
                  local.get 4
                  i64.const 2338042707334751329
                  i64.store offset=35 align=1
                  local.get 4
                  i64.const 2338600898263348341
                  i64.store offset=27 align=1
                  local.get 4
                  i64.const 7162263158133189730
                  i64.store offset=19 align=1
                  local.get 4
                  i64.const 7018969289221893749
                  i64.store offset=11 align=1
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 37
                  call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                  i32.const 192
                  call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
                  local.get 4
                  i32.const 8250
                  i32.store16 offset=11 align=1
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 2
                  call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                  local.get 4
                  i32.const 2681
                  i32.store16 offset=23 align=1
                  local.get 4
                  i32.const 1919905125
                  i32.store offset=19 align=1
                  local.get 4
                  i64.const 7863397576860792175
                  i64.store offset=11 align=1
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 14
                  call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                  local.get 4
                  i32.const 10
                  i32.store8 offset=11
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 1
                  call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                  unreachable
                  unreachable
                end
                local.get 4
                i32.const 32
                i32.store8 offset=47
                local.get 4
                i32.const 1701734764
                i32.store offset=43 align=1
                local.get 4
                i64.const 2338042707334751329
                i64.store offset=35 align=1
                local.get 4
                i64.const 2338600898263348341
                i64.store offset=27 align=1
                local.get 4
                i64.const 7162263158133189730
                i64.store offset=19 align=1
                local.get 4
                i64.const 7018969289221893749
                i64.store offset=11 align=1
                local.get 4
                i32.const 11
                i32.add
                i32.const 37
                call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                i32.const 2211
                call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
                local.get 4
                i32.const 8250
                i32.store16 offset=11 align=1
                local.get 4
                i32.const 11
                i32.add
                i32.const 2
                call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                local.get 4
                i32.const 10
                i32.store8 offset=27
                local.get 4
                i64.const 7234307576302018670
                i64.store offset=19 align=1
                local.get 4
                i64.const 8028075845441778529
                i64.store offset=11 align=1
                local.get 4
                i32.const 11
                i32.add
                i32.const 17
                call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                local.get 4
                i32.const 10
                i32.store8 offset=11
                local.get 4
                i32.const 11
                i32.add
                i32.const 1
                call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                unreachable
                unreachable
              end
              local.get 4
              i32.const 32
              i32.store8 offset=47
              local.get 4
              i32.const 1701734764
              i32.store offset=43 align=1
              local.get 4
              i64.const 2338042707334751329
              i64.store offset=35 align=1
              local.get 4
              i64.const 2338600898263348341
              i64.store offset=27 align=1
              local.get 4
              i64.const 7162263158133189730
              i64.store offset=19 align=1
              local.get 4
              i64.const 7018969289221893749
              i64.store offset=11 align=1
              local.get 4
              i32.const 11
              i32.add
              i32.const 37
              call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
              i32.const 79
              call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
              local.get 4
              i32.const 10
              i32.store8 offset=11
              local.get 4
              i32.const 11
              i32.add
              i32.const 1
              call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
              unreachable
              unreachable
            end
            local.get 4
            i32.const 32
            i32.store8 offset=47
            local.get 4
            i32.const 1701734764
            i32.store offset=43 align=1
            local.get 4
            i64.const 2338042707334751329
            i64.store offset=35 align=1
            local.get 4
            i64.const 2338600898263348341
            i64.store offset=27 align=1
            local.get 4
            i64.const 7162263158133189730
            i64.store offset=19 align=1
            local.get 4
            i64.const 7018969289221893749
            i64.store offset=11 align=1
            local.get 4
            i32.const 11
            i32.add
            i32.const 37
            call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
            i32.const 2209
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
            local.get 4
            i32.const 10
            i32.store8 offset=11
            local.get 4
            i32.const 11
            i32.add
            i32.const 1
            call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
            unreachable
            unreachable
          end
          local.get 4
          i32.const 32
          i32.store8 offset=47
          local.get 4
          i32.const 1701734764
          i32.store offset=43 align=1
          local.get 4
          i64.const 2338042707334751329
          i64.store offset=35 align=1
          local.get 4
          i64.const 2338600898263348341
          i64.store offset=27 align=1
          local.get 4
          i64.const 7162263158133189730
          i64.store offset=19 align=1
          local.get 4
          i64.const 7018969289221893749
          i64.store offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 37
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          i32.const 2210
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
          local.get 4
          i32.const 8250
          i32.store16 offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          local.get 4
          i32.const 10
          i32.store8 offset=27
          local.get 4
          i64.const 7234307576302018670
          i64.store offset=19 align=1
          local.get 4
          i64.const 8028075845441778529
          i64.store offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 17
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          local.get 4
          i32.const 10
          i32.store8 offset=11
          local.get 4
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          unreachable
          unreachable
        end
        local.get 4
        i32.const 32
        i32.store8 offset=47
        local.get 4
        i32.const 1701734764
        i32.store offset=43 align=1
        local.get 4
        i64.const 2338042707334751329
        i64.store offset=35 align=1
        local.get 4
        i64.const 2338600898263348341
        i64.store offset=27 align=1
        local.get 4
        i64.const 7162263158133189730
        i64.store offset=19 align=1
        local.get 4
        i64.const 7018969289221893749
        i64.store offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 37
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        i32.const 185
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
        local.get 4
        i32.const 8250
        i32.store16 offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        local.get 4
        i32.const 10
        i32.store8 offset=47
        local.get 4
        i32.const 1684370293
        i32.store offset=43 align=1
        local.get 4
        i64.const 2340011850872286305
        i64.store offset=35 align=1
        local.get 4
        i64.const 2338053340533122404
        i64.store offset=27 align=1
        local.get 4
        i64.const 7599383958532420719
        i64.store offset=19 align=1
        local.get 4
        i64.const 7935468323262068066
        i64.store offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 37
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        local.get 4
        i32.const 10
        i32.store8 offset=11
        local.get 4
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        unreachable
        unreachable
      end
      local.get 0
      local.get 0
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 2
    )
    (func $_ZN22wasi_snapshot_preview15State3ptr17hfc8a4fb8633db0ffE (;12;) (type 7) (result i32)
      (local i32)
      block ;; label = @1
        call $get_state_ptr
        local.tee 0
        br_if 0 (;@1;)
        call $_ZN22wasi_snapshot_preview15State3new17h6f0ab9b3974295afE
        local.tee 0
        call $set_state_ptr
      end
      local.get 0
    )
    (func $_ZN22wasi_snapshot_preview19BumpArena5alloc17h1b2bb61f300673d6E (;13;) (type 8) (param i32 i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        local.get 1
        i32.add
        local.get 0
        i32.load offset=54904
        i32.add
        i32.const -1
        i32.add
        i32.const 0
        local.get 1
        i32.sub
        i32.and
        local.tee 1
        local.get 0
        i32.sub
        local.get 2
        i32.add
        local.tee 2
        i32.const 54904
        i32.gt_u
        br_if 0 (;@1;)
        local.get 0
        local.get 2
        i32.store offset=54904
        local.get 3
        i32.const 48
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      local.get 3
      i32.const 32
      i32.store8 offset=47
      local.get 3
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 3
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 3
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 3
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 3
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 3
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      i32.const 109
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
      local.get 3
      i32.const 8250
      i32.store16 offset=11 align=1
      local.get 3
      i32.const 11
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      local.get 3
      i32.const 2681
      i32.store16 offset=23 align=1
      local.get 3
      i32.const 1919905125
      i32.store offset=19 align=1
      local.get 3
      i64.const 7863397576860792175
      i64.store offset=11 align=1
      local.get 3
      i32.const 11
      i32.add
      i32.const 14
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      local.get 3
      i32.const 10
      i32.store8 offset=11
      local.get 3
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview111ImportAlloc10with_arena17h808649afbd15deccE (;14;) (type 4) (param i32 i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 0
          i32.load
          br_if 0 (;@2;)
          local.get 0
          i32.load offset=8
          local.set 4
          local.get 0
          local.get 1
          i32.store offset=8
          local.get 4
          i32.eqz
          br_if 1 (;@1;)
          local.get 3
          i32.const 32
          i32.store8 offset=47
          local.get 3
          i32.const 1701734764
          i32.store offset=43 align=1
          local.get 3
          i64.const 2338042707334751329
          i64.store offset=35 align=1
          local.get 3
          i64.const 2338600898263348341
          i64.store offset=27 align=1
          local.get 3
          i64.const 7162263158133189730
          i64.store offset=19 align=1
          local.get 3
          i64.const 7018969289221893749
          i64.store offset=11 align=1
          local.get 3
          i32.const 11
          i32.add
          i32.const 37
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          i32.const 171
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
          local.get 3
          i32.const 8250
          i32.store16 offset=11 align=1
          local.get 3
          i32.const 11
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          local.get 3
          i64.const 748000395109933170
          i64.store offset=27 align=1
          local.get 3
          i64.const 7307218417350680677
          i64.store offset=19 align=1
          local.get 3
          i64.const 8390050488160450159
          i64.store offset=11 align=1
          local.get 3
          i32.const 11
          i32.add
          i32.const 24
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          local.get 3
          i32.const 10
          i32.store8 offset=11
          local.get 3
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          unreachable
          unreachable
        end
        local.get 3
        i32.const 32
        i32.store8 offset=47
        local.get 3
        i32.const 1701734764
        i32.store offset=43 align=1
        local.get 3
        i64.const 2338042707334751329
        i64.store offset=35 align=1
        local.get 3
        i64.const 2338600898263348341
        i64.store offset=27 align=1
        local.get 3
        i64.const 7162263158133189730
        i64.store offset=19 align=1
        local.get 3
        i64.const 7018969289221893749
        i64.store offset=11 align=1
        local.get 3
        i32.const 11
        i32.add
        i32.const 37
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        i32.const 164
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
        local.get 3
        i32.const 8250
        i32.store16 offset=11 align=1
        local.get 3
        i32.const 11
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        local.get 3
        i32.const 174417007
        i32.store offset=19 align=1
        local.get 3
        i64.const 7863410729224140130
        i64.store offset=11 align=1
        local.get 3
        i32.const 11
        i32.add
        i32.const 12
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        local.get 3
        i32.const 10
        i32.store8 offset=11
        local.get 3
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        unreachable
        unreachable
      end
      local.get 2
      call $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new19get_preopens_import17h4205590bf7df760dE
      local.get 0
      i32.const 0
      i32.store offset=8
      local.get 3
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $cabi_export_realloc (;15;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              local.get 0
              br_if 0 (;@4;)
              local.get 1
              br_if 0 (;@4;)
              call $_ZN22wasi_snapshot_preview15State3ptr17hfc8a4fb8633db0ffE
              local.tee 0
              i32.load
              br_if 1 (;@3;)
              local.get 0
              i32.const -1
              i32.store
              local.get 0
              i32.load offset=8
              i32.const 560490357
              i32.ne
              br_if 2 (;@2;)
              local.get 0
              i32.const 65532
              i32.add
              i32.load
              i32.const 560490357
              i32.ne
              br_if 3 (;@1;)
              local.get 0
              i32.const 10296
              i32.add
              local.get 2
              local.get 3
              call $_ZN22wasi_snapshot_preview19BumpArena5alloc17h1b2bb61f300673d6E
              local.set 1
              local.get 0
              local.get 0
              i32.load
              i32.const 1
              i32.add
              i32.store
              local.get 4
              i32.const 48
              i32.add
              global.set $__stack_pointer
              local.get 1
              return
            end
            local.get 4
            i32.const 32
            i32.store8 offset=47
            local.get 4
            i32.const 1701734764
            i32.store offset=43 align=1
            local.get 4
            i64.const 2338042707334751329
            i64.store offset=35 align=1
            local.get 4
            i64.const 2338600898263348341
            i64.store offset=27 align=1
            local.get 4
            i64.const 7162263158133189730
            i64.store offset=19 align=1
            local.get 4
            i64.const 7018969289221893749
            i64.store offset=11 align=1
            local.get 4
            i32.const 11
            i32.add
            i32.const 37
            call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
            i32.const 215
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
            local.get 4
            i32.const 10
            i32.store8 offset=11
            local.get 4
            i32.const 11
            i32.add
            i32.const 1
            call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
            unreachable
            unreachable
          end
          local.get 4
          i32.const 32
          i32.store8 offset=47
          local.get 4
          i32.const 1701734764
          i32.store offset=43 align=1
          local.get 4
          i64.const 2338042707334751329
          i64.store offset=35 align=1
          local.get 4
          i64.const 2338600898263348341
          i64.store offset=27 align=1
          local.get 4
          i64.const 7162263158133189730
          i64.store offset=19 align=1
          local.get 4
          i64.const 7018969289221893749
          i64.store offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 37
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          i32.const 2221
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
          local.get 4
          i32.const 10
          i32.store8 offset=11
          local.get 4
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          unreachable
          unreachable
        end
        local.get 4
        i32.const 32
        i32.store8 offset=47
        local.get 4
        i32.const 1701734764
        i32.store offset=43 align=1
        local.get 4
        i64.const 2338042707334751329
        i64.store offset=35 align=1
        local.get 4
        i64.const 2338600898263348341
        i64.store offset=27 align=1
        local.get 4
        i64.const 7162263158133189730
        i64.store offset=19 align=1
        local.get 4
        i64.const 7018969289221893749
        i64.store offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 37
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        i32.const 2222
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
        local.get 4
        i32.const 8250
        i32.store16 offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        local.get 4
        i32.const 10
        i32.store8 offset=27
        local.get 4
        i64.const 7234307576302018670
        i64.store offset=19 align=1
        local.get 4
        i64.const 8028075845441778529
        i64.store offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 17
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        local.get 4
        i32.const 10
        i32.store8 offset=11
        local.get 4
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        unreachable
        unreachable
      end
      local.get 4
      i32.const 32
      i32.store8 offset=47
      local.get 4
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 4
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 4
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 4
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 4
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 4
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      i32.const 2223
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
      local.get 4
      i32.const 8250
      i32.store16 offset=11 align=1
      local.get 4
      i32.const 11
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      local.get 4
      i32.const 10
      i32.store8 offset=27
      local.get 4
      i64.const 7234307576302018670
      i64.store offset=19 align=1
      local.get 4
      i64.const 8028075845441778529
      i64.store offset=11 align=1
      local.get 4
      i32.const 11
      i32.add
      i32.const 17
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      local.get 4
      i32.const 10
      i32.store8 offset=11
      local.get 4
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview15State11descriptors17h181692bb1521773eE (;16;) (type 1) (param i32 i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 6176
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 1
          i32.load offset=16
          br_if 0 (;@2;)
          local.get 1
          i32.const -1
          i32.store offset=16
          local.get 1
          i32.const 24
          i32.add
          local.set 3
          block ;; label = @3
            local.get 1
            i32.const 6172
            i32.add
            i32.load
            i32.const 2
            i32.ne
            br_if 0 (;@3;)
            local.get 2
            i32.const 8
            i32.add
            local.get 1
            i32.const 4
            i32.add
            local.get 1
            i32.const 10288
            i32.add
            call $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new17h722a2aa67fd99a1dE
            local.get 3
            local.get 2
            i32.const 8
            i32.add
            i32.const 6168
            call $memcpy
            drop
            local.get 1
            i32.load offset=6172
            i32.const 2
            i32.eq
            br_if 2 (;@1;)
          end
          local.get 0
          local.get 1
          i32.const 16
          i32.add
          i32.store offset=4
          local.get 0
          local.get 3
          i32.store
          local.get 2
          i32.const 6176
          i32.add
          global.set $__stack_pointer
          return
        end
        local.get 2
        i32.const 32
        i32.store8 offset=44
        local.get 2
        i32.const 1701734764
        i32.store offset=40 align=1
        local.get 2
        i64.const 2338042707334751329
        i64.store offset=32 align=1
        local.get 2
        i64.const 2338600898263348341
        i64.store offset=24 align=1
        local.get 2
        i64.const 7162263158133189730
        i64.store offset=16 align=1
        local.get 2
        i64.const 7018969289221893749
        i64.store offset=8 align=1
        local.get 2
        i32.const 8
        i32.add
        i32.const 37
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        i32.const 2305
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
        local.get 2
        i32.const 10
        i32.store8 offset=8
        local.get 2
        i32.const 8
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        unreachable
        unreachable
      end
      local.get 2
      i32.const 32
      i32.store8 offset=44
      local.get 2
      i32.const 1701734764
      i32.store offset=40 align=1
      local.get 2
      i64.const 2338042707334751329
      i64.store offset=32 align=1
      local.get 2
      i64.const 2338600898263348341
      i64.store offset=24 align=1
      local.get 2
      i64.const 7162263158133189730
      i64.store offset=16 align=1
      local.get 2
      i64.const 7018969289221893749
      i64.store offset=8 align=1
      local.get 2
      i32.const 8
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      i32.const 2309
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
      local.get 2
      i32.const 10
      i32.store8 offset=8
      local.get 2
      i32.const 8
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      unreachable
      unreachable
    )
    (func $fd_write (;17;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i64 i64)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 96
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  block ;; label = @7
                    call $get_allocation_state
                    i32.const -2
                    i32.add
                    i32.const -3
                    i32.and
                    br_if 0 (;@7;)
                    block ;; label = @8
                      block ;; label = @9
                        local.get 2
                        i32.eqz
                        br_if 0 (;@9;)
                        loop ;; label = @10
                          local.get 1
                          i32.const 4
                          i32.add
                          i32.load
                          local.tee 5
                          br_if 2 (;@8;)
                          local.get 1
                          i32.const 8
                          i32.add
                          local.set 1
                          local.get 2
                          i32.const -1
                          i32.add
                          local.tee 2
                          br_if 0 (;@10;)
                        end
                      end
                      i32.const 0
                      local.set 1
                      local.get 3
                      i32.const 0
                      i32.store
                      br 7 (;@1;)
                    end
                    local.get 1
                    i32.load
                    local.set 6
                    call $_ZN22wasi_snapshot_preview15State3ptr17hfc8a4fb8633db0ffE
                    local.tee 2
                    i32.load
                    local.tee 1
                    i32.const 2147483647
                    i32.ge_u
                    br_if 1 (;@6;)
                    local.get 2
                    local.get 1
                    i32.const 1
                    i32.add
                    i32.store
                    local.get 2
                    i32.load offset=8
                    i32.const 560490357
                    i32.ne
                    br_if 2 (;@5;)
                    block ;; label = @8
                      block ;; label = @9
                        local.get 2
                        i32.const 65532
                        i32.add
                        i32.load
                        i32.const 560490357
                        i32.ne
                        br_if 0 (;@9;)
                        local.get 4
                        i32.const 48
                        i32.add
                        local.get 2
                        i32.const 8
                        i32.add
                        call $_ZN22wasi_snapshot_preview15State11descriptors17h181692bb1521773eE
                        local.get 4
                        i32.load offset=48
                        local.tee 7
                        i32.load16_u offset=6144
                        local.set 8
                        local.get 4
                        i32.load offset=52
                        local.set 9
                        i32.const 8
                        local.set 1
                        i32.const 0
                        local.get 0
                        call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h0a05dc18ec73b78fE
                        local.tee 0
                        local.get 8
                        i32.ge_u
                        br_if 7 (;@2;)
                        local.get 7
                        local.get 0
                        i32.const 48
                        i32.mul
                        i32.add
                        local.tee 0
                        i32.load
                        i32.eqz
                        br_if 7 (;@2;)
                        local.get 4
                        i32.const 56
                        i32.add
                        local.get 0
                        i32.const 8
                        i32.add
                        call $_ZN22wasi_snapshot_preview111descriptors7Streams16get_write_stream17hb58144fb6ed121b9E
                        local.get 4
                        i32.load16_u offset=56
                        br_if 1 (;@8;)
                        local.get 4
                        i32.load offset=60
                        local.set 1
                        block ;; label = @10
                          block ;; label = @11
                            local.get 0
                            i32.const 40
                            i32.add
                            i32.load8_u
                            i32.const -2
                            i32.add
                            i32.const 255
                            i32.and
                            local.tee 8
                            i32.const 2
                            i32.gt_u
                            br_if 0 (;@11;)
                            local.get 8
                            i32.const 1
                            i32.ne
                            br_if 1 (;@10;)
                          end
                          local.get 0
                          i32.const 41
                          i32.add
                          i32.load8_u
                          br_if 6 (;@4;)
                          local.get 4
                          local.get 1
                          local.get 6
                          local.get 5
                          call $_ZN22wasi_snapshot_preview18bindings7streams5write17hd9048dd89653ab06E
                          local.get 4
                          i64.load offset=8
                          local.set 10
                          local.get 4
                          i64.load
                          local.set 11
                          br 7 (;@3;)
                        end
                        local.get 4
                        i32.const 32
                        i32.add
                        local.get 1
                        local.get 6
                        local.get 5
                        call $_ZN22wasi_snapshot_preview18bindings7streams5write17hd9048dd89653ab06E
                        local.get 4
                        i64.load offset=40
                        local.set 10
                        local.get 4
                        i64.load offset=32
                        local.set 11
                        br 6 (;@3;)
                      end
                      local.get 4
                      i32.const 32
                      i32.store8 offset=92
                      local.get 4
                      i32.const 1701734764
                      i32.store offset=88 align=1
                      local.get 4
                      i64.const 2338042707334751329
                      i64.store offset=80 align=1
                      local.get 4
                      i64.const 2338600898263348341
                      i64.store offset=72 align=1
                      local.get 4
                      i64.const 7162263158133189730
                      i64.store offset=64 align=1
                      local.get 4
                      i64.const 7018969289221893749
                      i64.store offset=56 align=1
                      local.get 4
                      i32.const 56
                      i32.add
                      i32.const 37
                      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                      i32.const 2211
                      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
                      local.get 4
                      i32.const 8250
                      i32.store16 offset=56 align=1
                      local.get 4
                      i32.const 56
                      i32.add
                      i32.const 2
                      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                      local.get 4
                      i32.const 10
                      i32.store8 offset=72
                      local.get 4
                      i64.const 7234307576302018670
                      i64.store offset=64 align=1
                      local.get 4
                      i64.const 8028075845441778529
                      i64.store offset=56 align=1
                      local.get 4
                      i32.const 56
                      i32.add
                      i32.const 17
                      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                      local.get 4
                      i32.const 10
                      i32.store8 offset=56
                      local.get 4
                      i32.const 56
                      i32.add
                      i32.const 1
                      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                      unreachable
                      unreachable
                    end
                    local.get 4
                    i32.load16_u offset=58
                    local.set 1
                    br 5 (;@2;)
                  end
                  local.get 3
                  i32.const 0
                  i32.store
                  i32.const 29
                  local.set 1
                  br 5 (;@1;)
                end
                local.get 4
                i32.const 32
                i32.store8 offset=92
                local.get 4
                i32.const 1701734764
                i32.store offset=88 align=1
                local.get 4
                i64.const 2338042707334751329
                i64.store offset=80 align=1
                local.get 4
                i64.const 2338600898263348341
                i64.store offset=72 align=1
                local.get 4
                i64.const 7162263158133189730
                i64.store offset=64 align=1
                local.get 4
                i64.const 7018969289221893749
                i64.store offset=56 align=1
                local.get 4
                i32.const 56
                i32.add
                i32.const 37
                call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                i32.const 2209
                call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
                local.get 4
                i32.const 10
                i32.store8 offset=56
                local.get 4
                i32.const 56
                i32.add
                i32.const 1
                call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
                unreachable
                unreachable
              end
              local.get 4
              i32.const 32
              i32.store8 offset=92
              local.get 4
              i32.const 1701734764
              i32.store offset=88 align=1
              local.get 4
              i64.const 2338042707334751329
              i64.store offset=80 align=1
              local.get 4
              i64.const 2338600898263348341
              i64.store offset=72 align=1
              local.get 4
              i64.const 7162263158133189730
              i64.store offset=64 align=1
              local.get 4
              i64.const 7018969289221893749
              i64.store offset=56 align=1
              local.get 4
              i32.const 56
              i32.add
              i32.const 37
              call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
              i32.const 2210
              call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
              local.get 4
              i32.const 8250
              i32.store16 offset=56 align=1
              local.get 4
              i32.const 56
              i32.add
              i32.const 2
              call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
              local.get 4
              i32.const 10
              i32.store8 offset=72
              local.get 4
              i64.const 7234307576302018670
              i64.store offset=64 align=1
              local.get 4
              i64.const 8028075845441778529
              i64.store offset=56 align=1
              local.get 4
              i32.const 56
              i32.add
              i32.const 17
              call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
              local.get 4
              i32.const 10
              i32.store8 offset=56
              local.get 4
              i32.const 56
              i32.add
              i32.const 1
              call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
              unreachable
              unreachable
            end
            local.get 4
            i32.const 16
            i32.add
            local.get 1
            local.get 6
            local.get 5
            call $_ZN22wasi_snapshot_preview18bindings7streams14blocking_write17h893ea787f563b2f9E
            local.get 4
            i64.load offset=24
            local.set 10
            local.get 4
            i64.load offset=16
            local.set 11
          end
          i32.const 29
          local.set 1
          local.get 11
          i32.wrap_i64
          br_if 0 (;@2;)
          block ;; label = @3
            local.get 0
            i32.load8_u offset=40
            local.tee 1
            br_if 0 (;@3;)
            local.get 1
            i32.const -2
            i32.add
            i32.const 255
            i32.and
            local.tee 1
            i32.const 2
            i32.gt_u
            local.get 1
            i32.const 1
            i32.eq
            i32.or
            i32.eqz
            br_if 0 (;@3;)
            local.get 0
            i32.const 32
            i32.add
            local.tee 1
            local.get 1
            i64.load
            local.get 10
            i64.add
            i64.store
          end
          local.get 3
          local.get 10
          i64.store32
          i32.const 0
          local.set 1
        end
        local.get 9
        local.get 9
        i32.load
        i32.const 1
        i32.add
        i32.store
        local.get 2
        local.get 2
        i32.load
        i32.const -1
        i32.add
        i32.store
      end
      local.get 4
      i32.const 96
      i32.add
      global.set $__stack_pointer
      local.get 1
      i32.const 65535
      i32.and
    )
    (func $_ZN22wasi_snapshot_preview15State3new17h6f0ab9b3974295afE (;18;) (type 7) (result i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 0
      global.set $__stack_pointer
      block ;; label = @1
        call $get_allocation_state
        i32.const 2
        i32.ne
        br_if 0 (;@1;)
        i32.const 3
        call $set_allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17h6763862ee909b463E
        local.set 1
        i32.const 4
        call $set_allocation_state
        local.get 1
        i64.const 0
        i64.store offset=12 align=4
        local.get 1
        i32.const 560490357
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store
        local.get 1
        i32.const 20
        i32.add
        i64.const 0
        i64.store align=4
        local.get 1
        i64.const 0
        i64.store offset=65488 align=4
        local.get 1
        i32.const 0
        i32.store offset=65480
        local.get 1
        i32.const 0
        i32.store offset=65212
        local.get 1
        i64.const 0
        i64.store offset=65200 align=4
        local.get 1
        i32.const 2
        i32.store offset=6180
        local.get 1
        i32.const 65496
        i32.add
        i64.const 0
        i64.store align=4
        local.get 1
        i32.const 65504
        i32.add
        i64.const 0
        i64.store align=4
        local.get 1
        i32.const 65509
        i32.add
        i64.const 0
        i64.store align=1
        local.get 1
        i32.const 560490357
        i32.store offset=65532
        local.get 1
        i32.const 11822
        i32.store16 offset=65528
        local.get 1
        i32.const 0
        i32.store offset=65520
        local.get 0
        i32.const 48
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      local.get 0
      i32.const 32
      i32.store8 offset=47
      local.get 0
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 0
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 0
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 0
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 0
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 0
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      i32.const 2254
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
      local.get 0
      i32.const 8250
      i32.store16 offset=11 align=1
      local.get 0
      i32.const 11
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      local.get 0
      i32.const 10
      i32.store8 offset=27
      local.get 0
      i64.const 7234307576302018670
      i64.store offset=19 align=1
      local.get 0
      i64.const 8028075845441778529
      i64.store offset=11 align=1
      local.get 0
      i32.const 11
      i32.add
      i32.const 17
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      local.get 0
      i32.const 10
      i32.store8 offset=11
      local.get 0
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E (;19;) (type 1) (param i32 i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      call $get_stderr_stream
      local.get 0
      local.get 1
      local.get 2
      call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h736cb40cc9906a18E
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E (;20;) (type 0) (param i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          local.get 0
          br_if 0 (;@2;)
          local.get 1
          i32.const 48
          i32.store8 offset=15
          call $get_stderr_stream
          local.get 1
          i32.const 15
          i32.add
          i32.const 1
          local.get 1
          i32.const 16
          i32.add
          call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h736cb40cc9906a18E
          br 1 (;@1;)
        end
        local.get 0
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h59572fc633ebfe33E.llvm.6158331226962989666
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h59572fc633ebfe33E.llvm.6158331226962989666 (;21;) (type 0) (param i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 32
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.eqz
        br_if 0 (;@1;)
        local.get 0
        i32.const 10
        i32.div_u
        local.tee 2
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17h59572fc633ebfe33E.llvm.6158331226962989666
        local.get 1
        local.get 0
        local.get 2
        i32.const 10
        i32.mul
        i32.sub
        i32.const 48
        i32.or
        i32.store8 offset=15
        call $get_stderr_stream
        local.get 1
        i32.const 15
        i32.add
        i32.const 1
        local.get 1
        i32.const 16
        i32.add
        call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h736cb40cc9906a18E
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN4core3ptr68drop_in_place$LT$wasi_snapshot_preview1..descriptors..Descriptor$GT$17h0e38daa4c19596caE.llvm.3748960597290857693 (;22;) (type 0) (param i32)
      (local i32 i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.load
        i32.eqz
        br_if 0 (;@1;)
        block ;; label = @2
          local.get 0
          i32.load offset=8
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.const 12
          i32.add
          i32.load
          call $_ZN22wasi_snapshot_preview18bindings7streams17drop_input_stream10wit_import17h11fabb9ee311ffdcE
        end
        block ;; label = @2
          local.get 0
          i32.const 16
          i32.add
          i32.load
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          i32.const 20
          i32.add
          i32.load
          call $_ZN22wasi_snapshot_preview18bindings7streams18drop_output_stream10wit_import17hf0ccada48d35a6d6E
        end
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.const 40
            i32.add
            i32.load8_u
            i32.const -2
            i32.add
            local.tee 2
            i32.const 1
            local.get 2
            i32.const 255
            i32.and
            i32.const 3
            i32.lt_u
            select
            i32.const 255
            i32.and
            br_table 2 (;@1;) 1 (;@2;) 0 (;@3;) 2 (;@1;)
          end
          local.get 1
          i32.const 32
          i32.store8 offset=47
          local.get 1
          i32.const 1701734764
          i32.store offset=43 align=1
          local.get 1
          i64.const 2338042707334751329
          i64.store offset=35 align=1
          local.get 1
          i64.const 2338600898263348341
          i64.store offset=27 align=1
          local.get 1
          i64.const 7162263158133189730
          i64.store offset=19 align=1
          local.get 1
          i64.const 7018969289221893749
          i64.store offset=11 align=1
          local.get 1
          i32.const 11
          i32.add
          i32.const 37
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          i32.const 32
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
          local.get 1
          i32.const 10
          i32.store8 offset=11
          local.get 1
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
          unreachable
          unreachable
        end
        local.get 0
        i32.const 24
        i32.add
        i32.load
        call $_ZN22wasi_snapshot_preview18bindings10filesystem15drop_descriptor10wit_import17ha65ceeff45dc784bE
      end
      local.get 1
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview111descriptors7Streams16get_write_stream17hb58144fb6ed121b9E (;23;) (type 1) (param i32 i32)
      (local i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 1
                i32.load offset=8
                br_if 0 (;@5;)
                block ;; label = @6
                  local.get 1
                  i32.const 32
                  i32.add
                  i32.load8_u
                  local.tee 2
                  i32.const -2
                  i32.add
                  i32.const 255
                  i32.and
                  local.tee 3
                  i32.const 2
                  i32.gt_u
                  br_if 0 (;@6;)
                  i32.const 1
                  local.set 4
                  local.get 3
                  i32.const 1
                  i32.ne
                  br_if 2 (;@4;)
                end
                local.get 1
                i32.const 20
                i32.add
                i32.load8_u
                i32.const 3
                i32.ne
                br_if 2 (;@3;)
                local.get 0
                i32.const 8
                i32.store16 offset=2
                i32.const 1
                local.set 4
                br 4 (;@1;)
              end
              local.get 0
              local.get 1
              i32.const 12
              i32.add
              i32.load
              i32.store offset=4
              br 2 (;@2;)
            end
            local.get 0
            i32.const 8
            i32.store16 offset=2
            br 2 (;@1;)
          end
          local.get 1
          i32.load offset=16
          local.set 4
          block ;; label = @3
            block ;; label = @4
              local.get 2
              i32.const 255
              i32.and
              br_if 0 (;@4;)
              local.get 4
              local.get 1
              i32.const 24
              i32.add
              i64.load
              call $_ZN22wasi_snapshot_preview18bindings10filesystem16write_via_stream10wit_import17hcb22d44430a4a03fE
              local.set 4
              br 1 (;@3;)
            end
            local.get 4
            call $_ZN22wasi_snapshot_preview18bindings10filesystem17append_via_stream10wit_import17h86207e845b06f098E
            local.set 4
          end
          local.get 1
          i32.const 1
          i32.store offset=8
          local.get 0
          local.get 4
          i32.store offset=4
          local.get 1
          i32.const 12
          i32.add
          local.get 4
          i32.store
        end
        i32.const 0
        local.set 4
      end
      local.get 0
      local.get 4
      i32.store16
    )
    (func $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new17h722a2aa67fd99a1dE (;24;) (type 4) (param i32 i32 i32)
      (local i32 i32 i32 i32 i32 i32 i32)
      global.get $__stack_pointer
      i32.const 64
      i32.sub
      local.tee 3
      global.set $__stack_pointer
      local.get 0
      i32.const 0
      i32.store offset=6156
      local.get 0
      i32.const 0
      i32.store offset=6148
      local.get 3
      i32.const 16
      i32.add
      call $_ZN22wasi_snapshot_preview18bindings8preopens9get_stdio10wit_import17h581cf6df510702daE
      local.get 3
      i32.load offset=20
      local.set 4
      local.get 3
      i32.load offset=16
      local.set 5
      local.get 3
      i32.const 24
      i32.add
      local.tee 6
      i32.load
      local.tee 7
      call $set_stderr_stream
      local.get 0
      i32.const 2
      i32.store8 offset=40
      local.get 0
      i32.const 0
      i32.store offset=16
      local.get 0
      local.get 5
      i32.store offset=12
      local.get 0
      i32.const 1
      i32.store offset=8
      local.get 0
      i32.const 1
      i32.store
      local.get 3
      i32.const 0
      i32.store offset=20
      local.get 3
      i32.const 0
      i32.store16 offset=16
      local.get 3
      i32.const 16
      i32.add
      call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h25b9f6910c506beeE
      drop
      local.get 0
      i32.const 68
      i32.add
      local.get 4
      i32.store
      local.get 0
      i32.const 64
      i32.add
      i32.const 1
      i32.store
      local.get 0
      i32.const 56
      i32.add
      i32.const 0
      i32.store
      local.get 0
      i32.const 1
      i32.store offset=48
      local.get 0
      i32.const 72
      i32.add
      local.get 3
      i64.load offset=16
      i64.store
      local.get 0
      i32.const 80
      i32.add
      local.get 6
      i64.load
      i64.store
      local.get 0
      i32.const 88
      i32.add
      i32.const 2
      i32.store8
      local.get 0
      local.get 3
      i32.load align=1
      i32.store offset=89 align=1
      i32.const 3
      local.set 4
      local.get 0
      i32.const 92
      i32.add
      local.get 3
      i32.const 3
      i32.add
      local.tee 5
      i32.load align=1
      i32.store align=1
      local.get 3
      i32.const 1
      i32.store offset=12
      local.get 3
      i32.const 0
      i32.store16 offset=8
      local.get 3
      i32.const 8
      i32.add
      call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h25b9f6910c506beeE
      drop
      local.get 0
      i32.const 116
      i32.add
      local.get 7
      i32.store
      local.get 0
      i32.const 112
      i32.add
      i32.const 1
      i32.store
      local.get 0
      i32.const 104
      i32.add
      i32.const 0
      i32.store
      local.get 0
      i32.const 1
      i32.store offset=96
      local.get 0
      i32.const 120
      i32.add
      local.get 3
      i64.load offset=16
      i64.store
      local.get 0
      i32.const 128
      i32.add
      local.get 6
      i64.load
      i64.store
      local.get 0
      i32.const 136
      i32.add
      i32.const 2
      i32.store8
      local.get 0
      i32.const 3
      i32.store16 offset=6144
      local.get 0
      local.get 3
      i32.load align=1
      i32.store offset=137 align=1
      local.get 0
      i32.const 140
      i32.add
      local.get 5
      i32.load align=1
      i32.store align=1
      local.get 3
      i32.const 2
      i32.store offset=12
      local.get 3
      i32.const 0
      i32.store16 offset=8
      local.get 3
      i32.const 8
      i32.add
      call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h25b9f6910c506beeE
      drop
      local.get 3
      i64.const 0
      i64.store
      local.get 1
      local.get 2
      local.get 3
      call $_ZN22wasi_snapshot_preview111ImportAlloc10with_arena17h808649afbd15deccE
      local.get 3
      i32.load
      local.set 8
      block ;; label = @1
        local.get 3
        i32.load offset=4
        local.tee 9
        i32.eqz
        br_if 0 (;@1;)
        local.get 9
        i32.const 12
        i32.mul
        local.set 2
        local.get 3
        i32.const 16
        i32.add
        i32.const 1
        i32.or
        local.set 7
        local.get 8
        local.set 6
        loop ;; label = @2
          local.get 6
          i32.load
          local.tee 1
          local.get 3
          i32.const 16
          i32.add
          call $_ZN22wasi_snapshot_preview18bindings10filesystem8get_type10wit_import17h7d090d2e7a2ae18cE
          local.get 3
          i32.load8_u offset=16
          i32.const 0
          i32.ne
          local.get 7
          i32.load8_u
          call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hab6b1af55ae9c9a4E
          local.set 5
          local.get 3
          i32.const 0
          i32.store16 offset=56
          local.get 3
          i64.const 0
          i64.store offset=48
          local.get 3
          local.get 1
          i32.store offset=40
          local.get 3
          i32.const 0
          i32.store offset=32
          local.get 3
          i32.const 0
          i32.store offset=24
          local.get 3
          i32.const 1
          i32.store offset=16
          local.get 3
          local.get 5
          i32.const 255
          i32.and
          i32.store8 offset=44
          block ;; label = @3
            block ;; label = @4
              local.get 4
              i32.const 65535
              i32.and
              local.tee 1
              i32.const 128
              i32.lt_u
              br_if 0 (;@4;)
              local.get 3
              i32.const 48
              i32.store16 offset=10
              local.get 3
              i32.const 16
              i32.add
              call $_ZN4core3ptr68drop_in_place$LT$wasi_snapshot_preview1..descriptors..Descriptor$GT$17h0e38daa4c19596caE.llvm.3748960597290857693
              i32.const 1
              local.set 1
              br 1 (;@3;)
            end
            local.get 0
            local.get 1
            i32.const 48
            i32.mul
            i32.add
            local.get 3
            i32.const 16
            i32.add
            i32.const 48
            call $memcpy
            drop
            local.get 0
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.store16 offset=6144
            local.get 3
            local.get 1
            i32.store offset=12
            i32.const 0
            local.set 1
          end
          local.get 6
          i32.const 12
          i32.add
          local.set 6
          local.get 3
          local.get 1
          i32.store16 offset=8
          local.get 3
          i32.const 8
          i32.add
          call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h25b9f6910c506beeE
          drop
          local.get 2
          i32.const -12
          i32.add
          local.tee 2
          br_if 0 (;@2;)
        end
      end
      local.get 0
      local.get 8
      i32.store offset=6156
      local.get 0
      i32.const 6160
      i32.add
      local.get 9
      i32.store
      local.get 3
      i32.const 64
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview18bindings7streams5write17hd9048dd89653ab06E (;25;) (type 2) (param i32 i32 i32 i32)
      (local i32 i64 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h736cb40cc9906a18E
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load8_u
          i32.eqz
          br_if 0 (;@2;)
          i64.const 1
          local.set 5
          br 1 (;@1;)
        end
        local.get 4
        i32.const 8
        i32.add
        i64.load
        local.set 6
        i64.const 0
        local.set 5
      end
      local.get 0
      local.get 6
      i64.store offset=8
      local.get 0
      local.get 5
      i64.store
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview18bindings7streams14blocking_write17h893ea787f563b2f9E (;26;) (type 2) (param i32 i32 i32 i32)
      (local i32 i64 i64)
      global.get $__stack_pointer
      i32.const 16
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      call $_ZN22wasi_snapshot_preview18bindings7streams14blocking_write10wit_import17h903b9f1ee503dfe3E
      block ;; label = @1
        block ;; label = @2
          local.get 4
          i32.load8_u
          i32.eqz
          br_if 0 (;@2;)
          i64.const 1
          local.set 5
          br 1 (;@1;)
        end
        local.get 4
        i32.const 8
        i32.add
        i64.load
        local.set 6
        i64.const 0
        local.set 5
      end
      local.get 0
      local.get 6
      i64.store offset=8
      local.get 0
      local.get 5
      i64.store
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h0a05dc18ec73b78fE (;27;) (type 9) (param i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        br_if 0 (;@1;)
        local.get 2
        i32.const 48
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      local.get 2
      i32.const 32
      i32.store8 offset=47
      local.get 2
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 2
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 2
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 2
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 2
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 2
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      i32.const 66
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
      local.get 2
      i32.const 10
      i32.store8 offset=11
      local.get 2
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      unreachable
      unreachable
    )
    (func $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h25b9f6910c506beeE (;28;) (type 3) (param i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 1
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        i32.load16_u
        br_if 0 (;@1;)
        local.get 0
        i32.load offset=4
        local.set 0
        local.get 1
        i32.const 48
        i32.add
        global.set $__stack_pointer
        local.get 0
        return
      end
      local.get 1
      i32.const 32
      i32.store8 offset=47
      local.get 1
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 1
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 1
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 1
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 1
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 1
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      i32.const 66
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
      local.get 1
      i32.const 10
      i32.store8 offset=11
      local.get 1
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      unreachable
      unreachable
    )
    (func $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hab6b1af55ae9c9a4E (;29;) (type 9) (param i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        br_if 0 (;@1;)
        local.get 2
        i32.const 48
        i32.add
        global.set $__stack_pointer
        local.get 1
        return
      end
      local.get 2
      i32.const 32
      i32.store8 offset=47
      local.get 2
      i32.const 1701734764
      i32.store offset=43 align=1
      local.get 2
      i64.const 2338042707334751329
      i64.store offset=35 align=1
      local.get 2
      i64.const 2338600898263348341
      i64.store offset=27 align=1
      local.get 2
      i64.const 7162263158133189730
      i64.store offset=19 align=1
      local.get 2
      i64.const 7018969289221893749
      i64.store offset=11 align=1
      local.get 2
      i32.const 11
      i32.add
      i32.const 37
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      i32.const 66
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
      local.get 2
      i32.const 10
      i32.store8 offset=11
      local.get 2
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
      unreachable
      unreachable
    )
    (func $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hf2f3dab352eb4f26E (;30;) (type 9) (param i32 i32) (result i32)
      (local i32)
      global.get $__stack_pointer
      i32.const 48
      i32.sub
      local.tee 2
      global.set $__stack_pointer
      block ;; label = @1
        local.get 0
        br_if 0 (;@1;)
        local.get 2
        i32.const 32
        i32.store8 offset=47
        local.get 2
        i32.const 1701734764
        i32.store offset=43 align=1
        local.get 2
        i64.const 2338042707334751329
        i64.store offset=35 align=1
        local.get 2
        i64.const 2338600898263348341
        i64.store offset=27 align=1
        local.get 2
        i64.const 7162263158133189730
        i64.store offset=19 align=1
        local.get 2
        i64.const 7018969289221893749
        i64.store offset=11 align=1
        local.get 2
        i32.const 11
        i32.add
        i32.const 37
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        i32.const 57
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217h551fbf2aff275f76E
        local.get 2
        i32.const 10
        i32.store8 offset=11
        local.get 2
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h4695a8827c6a7295E
        unreachable
        unreachable
      end
      local.get 2
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $get_state_ptr (;31;) (type 7) (result i32)
      global.get $internal_state_ptr
    )
    (func $set_state_ptr (;32;) (type 0) (param i32)
      local.get 0
      global.set $internal_state_ptr
    )
    (func $get_allocation_state (;33;) (type 7) (result i32)
      global.get $allocation_state
    )
    (func $set_allocation_state (;34;) (type 0) (param i32)
      local.get 0
      global.set $allocation_state
    )
    (func $get_stderr_stream (;35;) (type 7) (result i32)
      global.get $stderr_stream
    )
    (func $set_stderr_stream (;36;) (type 0) (param i32)
      local.get 0
      global.set $stderr_stream
    )
    (func $_ZN17compiler_builtins3mem6memcpy17h4070dce568878abcE (;37;) (type 8) (param i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i32)
      block ;; label = @1
        block ;; label = @2
          local.get 2
          i32.const 15
          i32.gt_u
          br_if 0 (;@2;)
          local.get 0
          local.set 3
          br 1 (;@1;)
        end
        local.get 0
        i32.const 0
        local.get 0
        i32.sub
        i32.const 3
        i32.and
        local.tee 4
        i32.add
        local.set 5
        block ;; label = @2
          local.get 4
          i32.eqz
          br_if 0 (;@2;)
          local.get 0
          local.set 3
          local.get 1
          local.set 6
          loop ;; label = @3
            local.get 3
            local.get 6
            i32.load8_u
            i32.store8
            local.get 6
            i32.const 1
            i32.add
            local.set 6
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            local.get 5
            i32.lt_u
            br_if 0 (;@3;)
          end
        end
        local.get 5
        local.get 2
        local.get 4
        i32.sub
        local.tee 7
        i32.const -4
        i32.and
        local.tee 8
        i32.add
        local.set 3
        block ;; label = @2
          block ;; label = @3
            local.get 1
            local.get 4
            i32.add
            local.tee 9
            i32.const 3
            i32.and
            local.tee 6
            i32.eqz
            br_if 0 (;@3;)
            local.get 8
            i32.const 1
            i32.lt_s
            br_if 1 (;@2;)
            local.get 9
            i32.const -4
            i32.and
            local.tee 10
            i32.const 4
            i32.add
            local.set 1
            i32.const 0
            local.get 6
            i32.const 3
            i32.shl
            local.tee 2
            i32.sub
            i32.const 24
            i32.and
            local.set 4
            local.get 10
            i32.load
            local.set 6
            loop ;; label = @4
              local.get 5
              local.get 6
              local.get 2
              i32.shr_u
              local.get 1
              i32.load
              local.tee 6
              local.get 4
              i32.shl
              i32.or
              i32.store
              local.get 1
              i32.const 4
              i32.add
              local.set 1
              local.get 5
              i32.const 4
              i32.add
              local.tee 5
              local.get 3
              i32.lt_u
              br_if 0 (;@4;)
              br 2 (;@2;)
            end
          end
          local.get 8
          i32.const 1
          i32.lt_s
          br_if 0 (;@2;)
          local.get 9
          local.set 1
          loop ;; label = @3
            local.get 5
            local.get 1
            i32.load
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 5
            i32.const 4
            i32.add
            local.tee 5
            local.get 3
            i32.lt_u
            br_if 0 (;@3;)
          end
        end
        local.get 7
        i32.const 3
        i32.and
        local.set 2
        local.get 9
        local.get 8
        i32.add
        local.set 1
      end
      block ;; label = @1
        local.get 2
        i32.eqz
        br_if 0 (;@1;)
        local.get 3
        local.get 2
        i32.add
        local.set 5
        loop ;; label = @2
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 5
          i32.lt_u
          br_if 0 (;@2;)
        end
      end
      local.get 0
    )
    (func $memcpy (;38;) (type 8) (param i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      call $_ZN17compiler_builtins3mem6memcpy17h4070dce568878abcE
    )
    (func $allocate_stack (;39;) (type 10)
      global.get $allocation_state
      i32.const 0
      i32.eq
      if ;; label = @1
        i32.const 1
        global.set $allocation_state
        i32.const 0
        i32.const 0
        i32.const 8
        i32.const 65536
        call $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17h6763862ee909b463E
        i32.const 65536
        i32.add
        global.set $__stack_pointer
        i32.const 2
        global.set $allocation_state
      end
    )
    (global $__stack_pointer (;0;) (mut i32) i32.const 0)
    (global $internal_state_ptr (;1;) (mut i32) i32.const 0)
    (global $allocation_state (;2;) (mut i32) i32.const 0)
    (global $stderr_stream (;3;) (mut i32) i32.const 123)
    (export "cabi_import_realloc" (func $cabi_import_realloc))
    (export "cabi_export_realloc" (func $cabi_export_realloc))
    (export "fd_write" (func $fd_write))
  )
  (core module (;2;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32)))
    (type (;2;) (func (param i32 i32 i32 i32)))
    (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
    (func $indirect-preopens-get-stdio (;0;) (type 0) (param i32)
      local.get 0
      i32.const 0
      call_indirect (type 0)
    )
    (func $indirect-preopens-get-directories (;1;) (type 0) (param i32)
      local.get 0
      i32.const 1
      call_indirect (type 0)
    )
    (func $indirect-filesystem-get-type (;2;) (type 1) (param i32 i32)
      local.get 0
      local.get 1
      i32.const 2
      call_indirect (type 1)
    )
    (func $indirect-streams-write (;3;) (type 2) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 3
      call_indirect (type 2)
    )
    (func $indirect-streams-blocking-write (;4;) (type 2) (param i32 i32 i32 i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 4
      call_indirect (type 2)
    )
    (func $adapt-wasi_snapshot_preview1-fd_write (;5;) (type 3) (param i32 i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 5
      call_indirect (type 3)
    )
    (table (;0;) 6 6 funcref)
    (export "0" (func $indirect-preopens-get-stdio))
    (export "1" (func $indirect-preopens-get-directories))
    (export "2" (func $indirect-filesystem-get-type))
    (export "3" (func $indirect-streams-write))
    (export "4" (func $indirect-streams-blocking-write))
    (export "5" (func $adapt-wasi_snapshot_preview1-fd_write))
    (export "$imports" (table 0))
  )
  (core module (;3;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32)))
    (type (;2;) (func (param i32 i32 i32 i32)))
    (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
    (import "" "0" (func (;0;) (type 0)))
    (import "" "1" (func (;1;) (type 0)))
    (import "" "2" (func (;2;) (type 1)))
    (import "" "3" (func (;3;) (type 2)))
    (import "" "4" (func (;4;) (type 2)))
    (import "" "5" (func (;5;) (type 3)))
    (import "" "$imports" (table (;0;) 6 6 funcref))
    (elem (;0;) (i32.const 0) func 0 1 2 3 4 5)
  )
  (core instance (;0;) (instantiate 2))
  (alias core export 0 "5" (core func (;0;)))
  (core instance (;1;)
    (export "fd_write" (func 0))
  )
  (core instance (;2;) (instantiate 0
      (with "wasi_snapshot_preview1" (instance 1))
    )
  )
  (alias core export 2 "memory" (core memory (;0;)))
  (alias core export 2 "cabi_realloc" (core func (;1;)))
  (alias core export 2 "cabi_realloc" (core func (;2;)))
  (core instance (;3;)
    (export "cabi_realloc" (func 2))
  )
  (core instance (;4;)
    (export "memory" (memory 0))
  )
  (alias core export 0 "0" (core func (;3;)))
  (alias core export 0 "1" (core func (;4;)))
  (core instance (;5;)
    (export "get-stdio" (func 3))
    (export "get-directories" (func 4))
  )
  (alias core export 0 "2" (core func (;5;)))
  (alias export 1 "write-via-stream" (func (;0;)))
  (core func (;6;) (canon lower (func 0)))
  (alias export 1 "append-via-stream" (func (;1;)))
  (core func (;7;) (canon lower (func 1)))
  (alias export 1 "drop-descriptor" (func (;2;)))
  (core func (;8;) (canon lower (func 2)))
  (core instance (;6;)
    (export "get-type" (func 5))
    (export "write-via-stream" (func 6))
    (export "append-via-stream" (func 7))
    (export "drop-descriptor" (func 8))
  )
  (alias core export 0 "3" (core func (;9;)))
  (alias core export 0 "4" (core func (;10;)))
  (alias export 0 "drop-input-stream" (func (;3;)))
  (core func (;11;) (canon lower (func 3)))
  (alias export 0 "drop-output-stream" (func (;4;)))
  (core func (;12;) (canon lower (func 4)))
  (core instance (;7;)
    (export "write" (func 9))
    (export "blocking-write" (func 10))
    (export "drop-input-stream" (func 11))
    (export "drop-output-stream" (func 12))
  )
  (core instance (;8;) (instantiate 1
      (with "__main_module__" (instance 3))
      (with "env" (instance 4))
      (with "preopens" (instance 5))
      (with "filesystem" (instance 6))
      (with "streams" (instance 7))
    )
  )
  (alias core export 8 "cabi_export_realloc" (core func (;13;)))
  (alias core export 8 "cabi_import_realloc" (core func (;14;)))
  (alias core export 0 "$imports" (core table (;0;)))
  (alias export 2 "get-stdio" (func (;5;)))
  (core func (;15;) (canon lower (func 5) (memory 0)))
  (alias export 2 "get-directories" (func (;6;)))
  (core func (;16;) (canon lower (func 6) (memory 0) (realloc 14) string-encoding=utf8))
  (alias export 1 "get-type" (func (;7;)))
  (core func (;17;) (canon lower (func 7) (memory 0)))
  (alias export 0 "write" (func (;8;)))
  (core func (;18;) (canon lower (func 8) (memory 0)))
  (alias export 0 "blocking-write" (func (;9;)))
  (core func (;19;) (canon lower (func 9) (memory 0)))
  (alias core export 8 "fd_write" (core func (;20;)))
  (core instance (;9;)
    (export "$imports" (table 0))
    (export "0" (func 15))
    (export "1" (func 16))
    (export "2" (func 17))
    (export "3" (func 18))
    (export "4" (func 19))
    (export "5" (func 20))
  )
  (core instance (;10;) (instantiate 3
      (with "" (instance 9))
    )
  )
  (type (;7;) (list u8))
  (type (;8;) (record (field "bytes" u64) (field "a" u32) (field "b" u32) (field "c" u32) (field "d" u32) (field "buffer" 7)))
  (type (;9;) (enum "error"))
  (type (;10;) (result 8 (error 9)))
  (type (;11;) (func (result 10)))
  (alias core export 2 "md5#init" (core func (;21;)))
  (alias core export 2 "cabi_post_md5#init" (core func (;22;)))
  (func (;10;) (type 11) (canon lift (core func 21) (memory 0) (post-return 22)))
  (type (;12;) (result (error 9)))
  (type (;13;) (func (param "ctx" 8) (param "msg" 7) (result 12)))
  (alias core export 2 "md5#update" (core func (;23;)))
  (func (;11;) (type 13) (canon lift (core func 23) (memory 0) (realloc 1)))
  (type (;14;) (result 7 (error 9)))
  (type (;15;) (func (param "ctx" 8) (result 14)))
  (alias core export 2 "md5#hash" (core func (;24;)))
  (alias core export 2 "cabi_post_md5#hash" (core func (;25;)))
  (func (;12;) (type 15) (canon lift (core func 24) (memory 0) (realloc 1) (post-return 25)))
  (component (;0;)
    (type (;0;) (list u8))
    (type (;1;) (record (field "bytes" u64) (field "a" u32) (field "b" u32) (field "c" u32) (field "d" u32) (field "buffer" 0)))
    (import "import-type-context" (type (;2;) (eq 1)))
    (type (;3;) (enum "error"))
    (import "import-type-errno" (type (;4;) (eq 3)))
    (type (;5;) (result 2 (error 4)))
    (type (;6;) (func (result 5)))
    (import "import-func-init" (func (;0;) (type 6)))
    (type (;7;) (result (error 4)))
    (type (;8;) (func (param "ctx" 2) (param "msg" 0) (result 7)))
    (import "import-func-update" (func (;1;) (type 8)))
    (type (;9;) (result 0 (error 4)))
    (type (;10;) (func (param "ctx" 2) (result 9)))
    (import "import-func-hash" (func (;2;) (type 10)))
    (type (;11;) (list u8))
    (type (;12;) (record (field "bytes" u64) (field "a" u32) (field "b" u32) (field "c" u32) (field "d" u32) (field "buffer" 11)))
    (export (;13;) "context" (type 12))
    (type (;14;) (enum "error"))
    (export (;15;) "errno" (type 14))
    (type (;16;) (result 13 (error 15)))
    (type (;17;) (func (result 16)))
    (export (;3;) "init" (func 0) (func (type 17)))
    (type (;18;) (result (error 15)))
    (type (;19;) (func (param "ctx" 13) (param "msg" 11) (result 18)))
    (export (;4;) "update" (func 1) (func (type 19)))
    (type (;20;) (result 11 (error 15)))
    (type (;21;) (func (param "ctx" 13) (result 20)))
    (export (;5;) "hash" (func 2) (func (type 21)))
  )
  (instance (;3;) (instantiate 0
      (with "import-func-init" (func 10))
      (with "import-func-update" (func 11))
      (with "import-func-hash" (func 12))
      (with "import-type-context" (type 8))
      (with "import-type-errno" (type 9))
    )
  )
  (export (;4;) "md5" (instance 3))
)