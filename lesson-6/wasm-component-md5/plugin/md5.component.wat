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
      (type (;10;) (func (param "this" 4)))
      (export (;2;) "drop-output-stream" (func (type 10)))
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
    (type (;4;) (func (param i32 i32) (result i32)))
    (type (;5;) (func (result i32)))
    (type (;6;) (func (param i32) (result i32)))
    (type (;7;) (func (param i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)))
    (type (;8;) (func (param i32 i32 i32 i32)))
    (type (;9;) (func (param i64 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
    (type (;10;) (func (param i64 i32 i32 i32 i32 i32 i32) (result i32)))
    (import "wasi_snapshot_preview1" "fd_write" (func $runtime.fd_write (;0;) (type 2)))
    (func $__wasm_call_ctors (;1;) (type $.data)
      nop
    )
    (func $tinygo_getCurrentStackPointer (;2;) (type 5) (result i32)
      global.get $__stack_pointer
    )
    (func $tinygo_unwind (;3;) (type $.rodata) (param i32)
      i32.const 65816
      i32.load8_u
      if ;; label = @1
        call $asyncify_stop_rewind
        i32.const 65816
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
      i32.const 65816
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
          i32.const 65820
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
                i32.const 65820
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
            call $runtime.runtimePanic.llvm.7850521206707118346
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
          i32.const 65658
          i32.const 23
          call $runtime.runtimePanic.llvm.7850521206707118346
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
    (func $runtime.runtimePanic.llvm.7850521206707118346 (;9;) (type 3) (param i32 i32)
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
          i32.const 65636
          i32.const 22
          call $runtime.printstring.llvm.7850521206707118346
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
          call $runtime.printstring.llvm.7850521206707118346
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
          call $runtime.printnl.llvm.7850521206707118346
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
    (func $#func10<_encoding/binary.littleEndian_.Uint32> (@name "(encoding/binary.littleEndian).Uint32") (;10;) (type 4) (param i32 i32) (result i32)
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
          call $runtime.lookupPanic.llvm.7850521206707118346
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
    (func $runtime.lookupPanic.llvm.7850521206707118346 (;11;) (type $.data)
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
          i32.const 65681
          i32.const 18
          call $runtime.runtimePanic.llvm.7850521206707118346
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
      (local i32 i32 i32 i32 i32 i32 i32)
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
        i32.load offset=12
        local.set 4
        local.get 2
        i32.load offset=16
        local.set 5
        local.get 2
        i32.load offset=20
        local.set 7
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
          local.set 6
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const -64
          i32.add
          local.tee 1
          global.set $__stack_pointer
          local.get 1
          i32.const 14
          i32.store offset=4
          local.get 1
          i32.const 8
          i32.add
          local.tee 3
          i32.const 0
          i32.const 56
          memory.fill
          local.get 1
          i32.const 66004
          i32.load
          local.tee 7
          i32.store
          i32.const 66004
          local.get 1
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
          call $runtime.alloc.llvm.7850521206707118346
          local.set 2
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 2
          local.set 3
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 3
          i32.store offset=40
          local.get 1
          local.get 3
          i32.store offset=60
          local.get 1
          local.get 3
          i32.store offset=36
          local.get 1
          local.get 3
          i32.store offset=24
          local.get 1
          local.get 3
          i32.store offset=20
          local.get 1
          local.get 3
          i32.store offset=16
          local.get 1
          local.get 3
          i32.store offset=12
          local.get 1
          local.get 3
          i32.store offset=8
        end
        local.get 6
        i32.const 1
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          i32.const 64
          call $malloc
          local.set 2
          i32.const 1
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 2
          local.set 4
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 1
          local.get 4
          i32.store offset=52
          local.get 1
          local.get 4
          i32.store offset=56
          local.get 1
          local.get 4
          i32.store offset=48
          local.get 1
          local.get 4
          i32.store offset=44
          local.get 1
          local.get 4
          i32.store offset=32
          local.get 1
          local.get 4
          i32.store offset=28
          loop ;; label = @3
            local.get 5
            i32.const 64
            i32.eq
            if ;; label = @4
              local.get 0
              if ;; label = @5
                local.get 0
                local.get 4
                i32.store offset=24
                local.get 0
                i64.const 1167088121787636990
                i64.store offset=16
                local.get 0
                i64.const -1167088121787636991
                i64.store offset=8
                local.get 0
                i64.const 0
                i64.store
                i32.const 66004
                local.get 7
                i32.store
                local.get 0
                i32.const 28
                i32.add
                i32.const 64
                i32.store
                local.get 1
                i32.const -64
                i32.sub
                global.set $__stack_pointer
                return
              end
            else
              local.get 4
              local.get 5
              i32.add
              local.get 3
              local.get 5
              i32.add
              i32.load8_u
              i32.store8
              local.get 5
              i32.const 1
              i32.add
              local.set 5
              br 1 (;@3;)
            end
          end
        end
        local.get 6
        i32.const 2
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.nilPanic
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
      local.get 2
      local.get 4
      i32.store offset=12
      local.get 2
      local.get 5
      i32.store offset=16
      local.get 2
      local.get 7
      i32.store offset=20
      global.get 2
      global.get 2
      i32.load
      i32.const 24
      i32.add
      i32.store
    )
    (func $runtime.alloc.llvm.7850521206707118346 (;13;) (type 6) (param i32) (result i32)
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
            i32.const 66000
            return
          end
          i32.const 65976
          i32.const 65976
          i64.load
          local.get 0
          i64.extend_i32_u
          i64.add
          i64.store
          i32.const 65984
          i32.const 65984
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
          i32.const 65964
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
                      i32.const 66004
                      i32.load
                      drop
                      i32.const 65820
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
                      i32.const 66336
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
                        i32.const 66001
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
                                i32.const 65968
                                i32.load
                                i32.lt_u
                                if ;; label = @14
                                  block ;; label = @15
                                    block ;; label = @16
                                      block ;; label = @17
                                        block ;; label = @18
                                          local.get 1
                                          call $#func25<_runtime.gcBlock_.state>
                                          i32.const 255
                                          i32.and
                                          br_table 3 (;@15;) 0 (;@18;) 1 (;@17;) 2 (;@16;) 6 (;@12;)
                                        end
                                        local.get 1
                                        call $#func26<_runtime.gcBlock_.markFree>
                                        i32.const 65992
                                        i32.const 65992
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
                                      call $#func26<_runtime.gcBlock_.markFree>
                                      br 3 (;@13;)
                                    end
                                    i32.const 0
                                    local.set 4
                                    i32.const 65960
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
                                i32.const 65960
                                i32.load
                                i32.const 66336
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
                        i32.const 66001
                        i32.const 0
                        i32.store8
                        i32.const 65968
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
                          call $#func25<_runtime.gcBlock_.state>
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
                            i32.const 65968
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
                  i32.const 65968
                  i32.load
                  local.get 5
                  i32.eq
                  if ;; label = @7
                    i32.const 0
                    local.set 5
                    br 3 (;@4;)
                  end
                  local.get 5
                  call $#func25<_runtime.gcBlock_.state>
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
                  i32.const 65964
                  local.get 2
                  i32.store
                  local.get 2
                  local.get 7
                  i32.sub
                  local.tee 2
                  i32.const 1
                  call $#func29<_runtime.gcBlock_.setState>
                  local.get 5
                  local.get 7
                  i32.sub
                  i32.const 2
                  i32.add
                  local.set 1
                  loop ;; label = @7
                    local.get 1
                    i32.const 65964
                    i32.load
                    i32.ne
                    if ;; label = @8
                      local.get 1
                      i32.const 2
                      call $#func29<_runtime.gcBlock_.setState>
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
                  i32.const 66336
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
                i32.const 65616
                i32.const 13
                call $runtime.runtimePanic.llvm.7850521206707118346
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
            i32.const 65964
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
    (func $malloc (;14;) (type 6) (param i32) (result i32)
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
          i32.const 66004
          i32.load
          local.set 4
          i32.const 66004
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
              call $runtime.alloc.llvm.7850521206707118346
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
              call $runtime.hashmapBinarySet.llvm.7850521206707118346
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
            i32.const 66004
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
          call $runtime.slicePanic.llvm.7850521206707118346
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
    (func $md5_update (;15;) (type 4) (param i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i32 i64 i32 i64 i32 i32 i32 i32 i64 i64 i32 i64)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 84
        i32.sub
        i32.store
        global.get 2
        i32.load
        local.tee 2
        i32.load
        local.set 0
        local.get 2
        i32.load offset=8
        local.set 3
        local.get 2
        i32.load offset=12
        local.set 4
        local.get 2
        i32.load offset=16
        local.set 5
        local.get 2
        i32.load offset=20
        local.set 6
        local.get 2
        i32.load offset=24
        local.set 8
        local.get 2
        i32.load offset=28
        local.set 7
        local.get 2
        i64.load offset=32 align=4
        local.set 9
        local.get 2
        i64.load offset=40 align=4
        local.set 11
        local.get 2
        i32.load offset=48
        local.set 12
        local.get 2
        i32.load offset=52
        local.set 13
        local.get 2
        i32.load offset=56
        local.set 14
        local.get 2
        i32.load offset=60
        local.set 15
        local.get 2
        i64.load offset=64 align=4
        local.set 16
        local.get 2
        i64.load offset=72 align=4
        local.set 17
        local.get 2
        i32.load offset=80
        local.set 18
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
          local.set 10
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 144
          i32.sub
          local.tee 4
          global.set $__stack_pointer
          local.get 4
          i32.const 16
          i32.store offset=76
          local.get 4
          i32.const 80
          i32.add
          i32.const 0
          i32.const 64
          memory.fill
          local.get 4
          local.get 0
          i32.store offset=48
          local.get 4
          i64.const 0
          i64.store offset=40
          local.get 4
          local.get 1
          i32.store offset=64
          local.get 4
          i32.const 1
          i32.store offset=56
          local.get 4
          i32.const 66004
          i32.load
          local.tee 18
          i32.store offset=72
          i32.const 66004
          local.get 4
          i32.const 72
          i32.add
          i32.store
          local.get 4
          local.get 4
          i32.const 40
          i32.add
          i32.store offset=60
          local.get 0
          i32.eqz
          local.set 3
        end
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 3
                  br_if 1 (;@5;)
                  local.get 0
                  i32.const 28
                  i32.add
                  i32.load
                  local.tee 8
                  i32.const 0
                  i32.lt_s
                  local.tee 3
                  br_if 2 (;@4;)
                  local.get 0
                  i32.load offset=20
                  local.set 13
                  local.get 0
                  i32.load offset=16
                  local.set 14
                  local.get 0
                  i32.load offset=8
                  local.set 12
                  local.get 0
                  i32.load offset=12
                  local.set 15
                  local.get 0
                  i64.load
                  local.set 9
                end
                local.get 10
                i32.const 0
                global.get 1
                select
                i32.eqz
                if ;; label = @6
                  local.get 8
                  call $runtime.alloc.llvm.7850521206707118346
                  local.set 2
                  i32.const 0
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                  local.get 2
                  local.set 6
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 6
                  i32.store offset=128
                  local.get 4
                  local.get 6
                  i32.store offset=140
                  local.get 4
                  local.get 6
                  i32.store offset=116
                  local.get 4
                  local.get 6
                  i32.store offset=112
                  local.get 4
                  local.get 6
                  i32.store offset=108
                  local.get 4
                  local.get 6
                  i32.store offset=104
                  local.get 4
                  local.get 6
                  i32.store offset=80
                  block ;; label = @7
                    local.get 0
                    i32.load offset=28
                    local.tee 5
                    i32.eqz
                    local.tee 3
                    br_if 0 (;@7;)
                    i32.const 0
                    local.set 3
                    local.get 5
                    i32.const 0
                    local.get 5
                    i32.const 0
                    i32.gt_s
                    select
                    local.set 7
                    loop ;; label = @8
                      local.get 3
                      local.get 7
                      i32.eq
                      local.tee 5
                      br_if 1 (;@7;)
                      local.get 4
                      local.get 0
                      i32.load offset=24
                      local.tee 5
                      i32.store offset=88
                      local.get 4
                      local.get 5
                      i32.store offset=84
                      local.get 3
                      local.get 8
                      i32.eq
                      br_if 5 (;@3;)
                      local.get 3
                      local.get 6
                      i32.add
                      local.get 3
                      local.get 5
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
                  local.get 1
                  i32.eqz
                  local.tee 0
                  br_if 1 (;@5;)
                  local.get 1
                  i32.load offset=4
                  local.tee 0
                  i32.const 0
                  i32.lt_s
                  local.tee 3
                  br_if 2 (;@4;)
                end
                local.get 10
                i32.const 1
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  call $runtime.alloc.llvm.7850521206707118346
                  local.set 2
                  i32.const 1
                  global.get 1
                  i32.const 1
                  i32.eq
                  br_if 5 (;@1;)
                  drop
                  local.get 2
                  local.set 7
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 7
                  i32.store offset=92
                  block ;; label = @7
                    local.get 1
                    i32.load offset=4
                    local.tee 5
                    i32.eqz
                    local.tee 3
                    br_if 0 (;@7;)
                    i32.const 0
                    local.set 3
                    local.get 5
                    i32.const 0
                    local.get 5
                    i32.const 0
                    i32.gt_s
                    select
                    local.set 2
                    loop ;; label = @8
                      local.get 2
                      local.get 3
                      i32.eq
                      local.tee 5
                      br_if 1 (;@7;)
                      local.get 4
                      local.get 1
                      i32.load
                      local.tee 5
                      i32.store offset=100
                      local.get 4
                      local.get 5
                      i32.store offset=96
                      local.get 0
                      local.get 3
                      i32.eq
                      br_if 5 (;@3;)
                      local.get 3
                      local.get 7
                      i32.add
                      local.get 3
                      local.get 5
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
                  local.get 0
                  i64.extend_i32_u
                  local.tee 11
                  local.get 9
                  i64.add
                  local.set 16
                  local.get 9
                  i64.const 63
                  i64.and
                  local.tee 9
                  i64.eqz
                  local.set 1
                end
                block ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 1
                    br_if 1 (;@6;)
                    local.get 8
                    i64.extend_i32_u
                    local.set 19
                    local.get 11
                    i64.const 64
                    local.get 9
                    i64.sub
                    local.tee 17
                    i64.lt_u
                    if ;; label = @8
                      local.get 9
                      local.get 19
                      i64.gt_u
                      local.tee 1
                      br_if 4 (;@4;)
                      local.get 6
                      local.get 9
                      i32.wrap_i64
                      local.tee 3
                      i32.add
                      local.set 1
                      local.get 8
                      local.get 3
                      i32.sub
                      local.tee 3
                      local.get 0
                      i32.gt_u
                      local.set 5
                      local.get 1
                      local.get 7
                      local.get 0
                      local.get 3
                      local.get 5
                      select
                      local.tee 0
                      memory.copy
                      br 6 (;@2;)
                    end
                    local.get 9
                    local.get 19
                    i64.gt_u
                    local.tee 1
                    br_if 3 (;@4;)
                    local.get 6
                    local.get 9
                    i32.wrap_i64
                    local.tee 3
                    i32.add
                    local.set 1
                    local.get 8
                    local.get 3
                    i32.sub
                    local.tee 3
                    local.get 0
                    i32.gt_u
                    local.set 5
                    local.get 1
                    local.get 7
                    local.get 0
                    local.get 3
                    local.get 5
                    select
                    local.tee 3
                    memory.copy
                    local.get 4
                    i32.const 24
                    i32.add
                    local.set 1
                  end
                  local.get 10
                  i32.const 2
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 1
                    local.get 16
                    local.get 12
                    local.get 15
                    local.get 14
                    local.get 13
                    local.get 6
                    local.get 8
                    local.get 8
                    local.get 6
                    local.get 8
                    local.get 8
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
                    local.get 4
                    local.get 4
                    i32.load offset=24
                    local.tee 1
                    i32.store offset=120
                    local.get 11
                    local.get 17
                    i64.sub
                    local.set 11
                    local.get 7
                    local.get 17
                    i32.wrap_i64
                    local.tee 3
                    i32.add
                    local.set 7
                    local.get 0
                    local.get 3
                    i32.sub
                    local.set 0
                  end
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 7
                  i32.store offset=124
                  local.get 11
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
                    local.get 11
                    i64.const -64
                    i64.and
                    local.set 9
                    local.get 4
                    i32.const 8
                    i32.add
                    local.set 1
                  end
                  local.get 10
                  i32.const 3
                  i32.eq
                  i32.const 1
                  global.get 1
                  select
                  if ;; label = @7
                    local.get 1
                    local.get 16
                    local.get 12
                    local.get 15
                    local.get 14
                    local.get 13
                    local.get 6
                    local.get 8
                    local.get 8
                    local.get 7
                    local.get 0
                    local.get 0
                    local.get 9
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
                    local.get 4
                    local.get 4
                    i32.load offset=8
                    local.tee 7
                    i32.store offset=132
                    local.get 4
                    i32.load offset=12
                    local.set 0
                  end
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 4
                  local.get 7
                  i32.store offset=136
                  local.get 6
                  local.get 7
                  local.get 0
                  local.get 8
                  local.get 0
                  local.get 8
                  i32.lt_u
                  local.tee 1
                  select
                  local.tee 0
                  memory.copy
                  br 4 (;@2;)
                end
              end
              local.get 10
              i32.const 4
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                call $runtime.nilPanic
                i32.const 4
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
            local.get 10
            i32.const 5
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              call $runtime.slicePanic.llvm.7850521206707118346
              i32.const 5
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
          local.get 10
          i32.const 6
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.lookupPanic.llvm.7850521206707118346
            i32.const 6
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
        local.get 3
        local.get 4
        i32.const 56
        i32.add
        global.get 1
        select
        local.set 3
        loop ;; label = @2
          block ;; label = @3
            global.get 1
            i32.eqz
            if ;; label = @4
              local.get 3
              i32.eqz
              br_if 1 (;@3;)
              local.get 3
              i32.load offset=4
              local.set 5
              local.get 3
              i32.load
              i32.eqz
              local.set 1
              local.get 3
              i32.load offset=8
              local.set 0
            end
            block ;; label = @4
              global.get 1
              i32.const 1
              local.get 1
              select
              if ;; label = @5
                local.get 10
                i32.const 7
                i32.eq
                i32.const 1
                global.get 1
                select
                if ;; label = @6
                  local.get 0
                  call $md5_list_u8_free
                  i32.const 7
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
              local.get 0
              local.get 0
              i32.const 24
              i32.add
              global.get 1
              select
              local.set 0
              local.get 10
              i32.const 8
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 0
                call $md5_list_u8_free
                i32.const 8
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
              local.get 5
              local.set 3
              br 2 (;@2;)
            end
          end
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          i32.const 66004
          local.get 18
          i32.store
          local.get 4
          i32.const 144
          i32.add
          global.set $__stack_pointer
          i32.const 0
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
      local.get 2
      local.get 4
      i32.store offset=12
      local.get 2
      local.get 5
      i32.store offset=16
      local.get 2
      local.get 6
      i32.store offset=20
      local.get 2
      local.get 8
      i32.store offset=24
      local.get 2
      local.get 7
      i32.store offset=28
      local.get 2
      local.get 9
      i64.store offset=32 align=4
      local.get 2
      local.get 11
      i64.store offset=40 align=4
      local.get 2
      local.get 12
      i32.store offset=48
      local.get 2
      local.get 13
      i32.store offset=52
      local.get 2
      local.get 14
      i32.store offset=56
      local.get 2
      local.get 15
      i32.store offset=60
      local.get 2
      local.get 16
      i64.store offset=64 align=4
      local.get 2
      local.get 17
      i64.store offset=72 align=4
      local.get 2
      local.get 18
      i32.store offset=80
      global.get 2
      global.get 2
      i32.load
      i32.const 84
      i32.add
      i32.store
      i32.const 0
    )
    (func $main.md5Body (;16;) (type 7) (param i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
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
          call $runtime.slicePanic.llvm.7850521206707118346
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
    (func $runtime.slicePanic.llvm.7850521206707118346 (;17;) (type $.data)
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
          i32.const 65699
          i32.const 18
          call $runtime.runtimePanic.llvm.7850521206707118346
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
    (func $md5_final (;18;) (type 3) (param i32 i32)
      (local i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i64)
      global.get 1
      i32.const 2
      i32.eq
      if ;; label = @1
        global.get 2
        global.get 2
        i32.load
        i32.const 56
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
        i64.load offset=24 align=4
        local.set 7
        local.get 4
        i32.load offset=32
        local.set 8
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
        i32.load offset=52
        local.set 14
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
          local.set 9
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          global.get $__stack_pointer
          i32.const 208
          i32.sub
          local.tee 3
          global.set $__stack_pointer
          local.get 3
          i32.const 23
          i32.store offset=108
          local.get 3
          i32.const 112
          i32.add
          i32.const 0
          i32.const 92
          memory.fill
          local.get 3
          local.get 0
          i32.store offset=24
          local.get 3
          i64.const 0
          i64.store offset=16
          local.get 3
          i32.const 66004
          i32.load
          local.tee 14
          i32.store offset=104
          i32.const 66004
          local.get 3
          i32.const 104
          i32.add
          i32.store
          local.get 0
          i32.eqz
          local.set 2
        end
        block ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            local.get 2
            br_if 1 (;@2;)
            local.get 0
            i32.const 28
            i32.add
            i32.load
            local.tee 8
            i32.const 0
            i32.lt_s
            local.set 2
          end
          block ;; label = @3
            block ;; label = @4
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 2
                br_if 1 (;@4;)
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
                local.set 7
              end
              local.get 9
              i32.const 0
              global.get 1
              select
              i32.eqz
              if ;; label = @5
                local.get 8
                call $runtime.alloc.llvm.7850521206707118346
                local.set 4
                i32.const 0
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 4
                local.set 5
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 3
                local.get 5
                i32.store offset=164
                local.get 3
                local.get 5
                i32.store offset=168
                local.get 3
                local.get 5
                i32.store offset=160
                local.get 3
                local.get 5
                i32.store offset=156
                local.get 3
                local.get 5
                i32.store offset=152
                local.get 3
                local.get 5
                i32.store offset=148
                local.get 3
                local.get 5
                i32.store offset=144
                local.get 3
                local.get 5
                i32.store offset=140
                local.get 3
                local.get 5
                i32.store offset=136
                local.get 3
                local.get 5
                i32.store offset=132
                local.get 3
                local.get 5
                i32.store offset=128
                local.get 3
                local.get 5
                i32.store offset=124
                local.get 3
                local.get 5
                i32.store offset=112
                block ;; label = @6
                  local.get 0
                  i32.load offset=28
                  local.tee 2
                  i32.eqz
                  br_if 0 (;@6;)
                  i32.const 0
                  local.set 6
                  local.get 2
                  i32.const 0
                  local.get 2
                  i32.const 0
                  i32.gt_s
                  select
                  local.set 4
                  loop ;; label = @7
                    local.get 4
                    local.get 6
                    i32.eq
                    br_if 1 (;@6;)
                    local.get 3
                    local.get 0
                    i32.load offset=24
                    local.tee 2
                    i32.store offset=120
                    local.get 3
                    local.get 2
                    i32.store offset=116
                    local.get 6
                    local.get 8
                    i32.eq
                    br_if 4 (;@3;)
                    local.get 5
                    local.get 6
                    i32.add
                    local.get 2
                    local.get 6
                    i32.add
                    i32.load8_u
                    i32.store8
                    local.get 6
                    i32.const 1
                    i32.add
                    local.set 6
                    br 0 (;@7;)
                  end
                  unreachable
                end
                local.get 3
                i32.const 32
                i32.add
                i32.const 0
                i32.const 72
                memory.fill
                i32.const 55
                local.get 7
                i32.wrap_i64
                i32.sub
                i32.const 63
                i32.and
                local.tee 2
                local.get 3
                i32.const 32
                i32.add
                i32.add
                local.tee 6
                i32.const 8
                i32.add
                local.get 7
                i64.const 56
                i64.shr_u
                i64.store8
                local.get 6
                i32.const 7
                i32.add
                local.get 7
                i64.const 48
                i64.shr_u
                i64.store8
                local.get 6
                i32.const 6
                i32.add
                local.get 7
                i64.const 40
                i64.shr_u
                i64.store8
                local.get 6
                i32.const 5
                i32.add
                local.get 7
                i64.const 32
                i64.shr_u
                i64.store8
                local.get 6
                i32.const 4
                i32.add
                local.get 7
                i64.const 24
                i64.shr_u
                i64.store8
                local.get 6
                i32.const 3
                i32.add
                local.get 7
                i64.const 16
                i64.shr_u
                i64.store8
                local.get 6
                i32.const 2
                i32.add
                local.get 7
                i64.const 8
                i64.shr_u
                i64.store8
                local.get 6
                i32.const 1
                i32.add
                local.get 7
                i64.store8
                local.get 3
                i32.const 128
                i32.store8 offset=32
                local.get 7
                i64.const 63
                i64.and
                local.tee 15
                local.get 8
                i64.extend_i32_u
                i64.gt_u
                br_if 1 (;@4;)
                local.get 5
                local.get 15
                i32.wrap_i64
                local.tee 6
                i32.add
                local.set 0
                local.get 2
                i32.const 9
                i32.add
                local.tee 2
                local.get 8
                local.get 6
                i32.sub
                local.tee 6
                i32.lt_u
                local.set 4
                local.get 0
                local.get 3
                i32.const 32
                i32.add
                local.get 2
                local.get 6
                local.get 4
                select
                local.tee 2
                memory.copy
                local.get 8
                i32.const 57
                i32.lt_u
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 3
                i64.shl
                local.tee 7
                i64.store8 offset=56
                local.get 8
                i32.const 57
                i32.eq
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 8
                i64.shr_u
                i64.store8 offset=57
                local.get 8
                i32.const 59
                i32.lt_u
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 16
                i64.shr_u
                i64.store8 offset=58
                local.get 8
                i32.const 59
                i32.eq
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 24
                i64.shr_u
                i64.store8 offset=59
                local.get 8
                i32.const 61
                i32.lt_u
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 32
                i64.shr_u
                i64.store8 offset=60
                local.get 8
                i32.const 61
                i32.eq
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 40
                i64.shr_u
                i64.store8 offset=61
                local.get 8
                i32.const 63
                i32.lt_u
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 48
                i64.shr_u
                i64.store8 offset=62
                local.get 8
                i32.const 63
                i32.eq
                local.tee 0
                br_if 2 (;@3;)
                local.get 5
                local.get 7
                i64.const 56
                i64.shr_u
                i64.store8 offset=63
              end
              local.get 9
              i32.const 1
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                local.get 3
                local.get 7
                local.get 13
                local.get 12
                local.get 11
                local.get 10
                local.get 5
                local.get 8
                local.get 8
                local.get 5
                local.get 8
                local.get 8
                i64.const 64
                call $main.md5Body
                i32.const 1
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 3
                local.get 3
                i32.load
                local.tee 0
                i32.store offset=172
              end
              local.get 9
              i32.const 2
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                i32.const 16
                call $runtime.alloc.llvm.7850521206707118346
                local.set 4
                i32.const 2
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 4
                local.set 2
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 2
                local.get 10
                i32.const 24
                i32.shr_u
                i32.store8 offset=15
                local.get 2
                local.get 10
                i32.const 16
                i32.shr_u
                i32.store8 offset=14
                local.get 2
                local.get 10
                i32.const 8
                i32.shr_u
                i32.store8 offset=13
                local.get 2
                local.get 10
                i32.store8 offset=12
                local.get 2
                local.get 11
                i32.const 24
                i32.shr_u
                i32.store8 offset=11
                local.get 2
                local.get 11
                i32.const 16
                i32.shr_u
                i32.store8 offset=10
                local.get 2
                local.get 11
                i32.const 8
                i32.shr_u
                i32.store8 offset=9
                local.get 2
                local.get 11
                i32.store8 offset=8
                local.get 2
                local.get 12
                i32.const 24
                i32.shr_u
                i32.store8 offset=7
                local.get 2
                local.get 12
                i32.const 16
                i32.shr_u
                i32.store8 offset=6
                local.get 2
                local.get 12
                i32.const 8
                i32.shr_u
                i32.store8 offset=5
                local.get 2
                local.get 12
                i32.store8 offset=4
                local.get 2
                local.get 13
                i32.const 24
                i32.shr_u
                i32.store8 offset=3
                local.get 2
                local.get 13
                i32.const 16
                i32.shr_u
                i32.store8 offset=2
                local.get 2
                local.get 13
                i32.const 8
                i32.shr_u
                local.tee 0
                i32.store8 offset=1
                local.get 2
                local.get 13
                i32.store8
                local.get 3
                local.get 2
                i32.store offset=176
                local.get 3
                local.get 2
                i32.store offset=180
              end
              local.get 9
              i32.const 3
              i32.eq
              i32.const 1
              global.get 1
              select
              if ;; label = @5
                i32.const 16
                call $malloc
                local.set 4
                i32.const 3
                global.get 1
                i32.const 1
                i32.eq
                br_if 4 (;@1;)
                drop
                local.get 4
                local.set 5
              end
              global.get 1
              i32.eqz
              if ;; label = @5
                local.get 3
                local.get 5
                i32.store offset=196
                local.get 3
                local.get 5
                i32.store offset=200
                local.get 3
                local.get 5
                i32.store offset=192
                local.get 3
                local.get 5
                i32.store offset=188
                local.get 3
                local.get 5
                i32.store offset=184
                i32.const 0
                local.set 6
              end
              loop ;; label = @5
                local.get 0
                local.get 6
                i32.const 16
                i32.ne
                global.get 1
                select
                local.set 0
                block ;; label = @6
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    local.get 0
                    br_if 1 (;@6;)
                    local.get 1
                    i32.eqz
                    local.tee 0
                    br_if 5 (;@2;)
                    local.get 1
                    i32.const 16
                    i32.store offset=4
                    local.get 1
                    local.get 5
                    i32.store
                    local.get 3
                    i32.const 16
                    i32.add
                    local.set 6
                  end
                  loop ;; label = @7
                    block ;; label = @8
                      global.get 1
                      i32.eqz
                      if ;; label = @9
                        local.get 6
                        i32.eqz
                        br_if 1 (;@8;)
                        local.get 6
                        i32.load offset=8
                        local.set 2
                        local.get 6
                        i32.load offset=4
                        local.set 6
                        local.get 2
                        i32.const 24
                        i32.add
                        local.set 0
                      end
                      local.get 9
                      i32.const 4
                      i32.eq
                      i32.const 1
                      global.get 1
                      select
                      if ;; label = @9
                        local.get 0
                        call $md5_list_u8_free
                        i32.const 4
                        global.get 1
                        i32.const 1
                        i32.eq
                        br_if 8 (;@1;)
                        drop
                      end
                      global.get 1
                      i32.eqz
                      br_if 1 (;@7;)
                    end
                  end
                  global.get 1
                  i32.eqz
                  if ;; label = @7
                    i32.const 66004
                    local.get 14
                    i32.store
                    local.get 3
                    i32.const 208
                    i32.add
                    global.set $__stack_pointer
                    return
                  end
                end
                global.get 1
                i32.eqz
                if ;; label = @6
                  local.get 5
                  local.get 6
                  i32.add
                  local.tee 0
                  local.get 2
                  local.get 6
                  i32.add
                  i32.load8_u
                  i32.store8
                  local.get 6
                  i32.const 1
                  i32.add
                  local.set 6
                  br 1 (;@5;)
                end
              end
            end
            local.get 9
            i32.const 5
            i32.eq
            i32.const 1
            global.get 1
            select
            if ;; label = @4
              call $runtime.slicePanic.llvm.7850521206707118346
              i32.const 5
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
          local.get 9
          i32.const 6
          i32.eq
          i32.const 1
          global.get 1
          select
          if ;; label = @3
            call $runtime.lookupPanic.llvm.7850521206707118346
            i32.const 6
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
        local.get 9
        i32.const 7
        i32.eq
        i32.const 1
        global.get 1
        select
        if ;; label = @2
          call $runtime.nilPanic
          i32.const 7
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
      i64.store offset=24 align=4
      local.get 4
      local.get 8
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
      local.get 4
      local.get 14
      i32.store offset=52
      global.get 2
      global.get 2
      i32.load
      i32.const 56
      i32.add
      i32.store
    )
    (func $runtime.memequal (;19;) (type 2) (param i32 i32 i32 i32) (result i32)
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
    (func $runtime.hash32.llvm.7850521206707118346 (;20;) (type 2) (param i32 i32 i32 i32) (result i32)
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
    (func $runtime.printstring.llvm.7850521206707118346 (;21;) (type 3) (param i32 i32)
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
              call $runtime.putchar.llvm.7850521206707118346
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
    (func $runtime.printnl.llvm.7850521206707118346 (;22;) (type $.data)
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
          call $runtime.putchar.llvm.7850521206707118346
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
    (func $runtime.putchar.llvm.7850521206707118346 (;23;) (type $.rodata) (param i32)
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
          i32.const 65828
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
            i32.const 65828
            local.get 3
            i32.const 1
            i32.add
            local.tee 1
            i32.store
            local.get 3
            i32.const 65832
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
              i32.const 65772
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
              i32.const 65768
              i32.const 1
              i32.const 66008
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
              i32.const 65828
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
          call $runtime.lookupPanic.llvm.7850521206707118346
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
    (func $runtime.markRoots (;24;) (type 3) (param i32 i32)
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
              i32.const 66336
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
                i32.const 65960
                i32.load
                i32.ge_u
                local.tee 2
                br_if 1 (;@4;)
                local.get 3
                i32.const 66336
                i32.sub
                i32.const 4
                i32.shr_u
                local.tee 3
                call $#func25<_runtime.gcBlock_.state>
                i32.const 255
                i32.and
                i32.eqz
                local.tee 2
                br_if 1 (;@4;)
                local.get 3
                call $#func31<_runtime.gcBlock_.findHead>
                local.tee 3
                call $#func25<_runtime.gcBlock_.state>
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
    (func $#func25<_runtime.gcBlock_.state> (@name "(runtime.gcBlock).state") (;25;) (type 6) (param i32) (result i32)
      i32.const 65960
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
    (func $#func26<_runtime.gcBlock_.markFree> (@name "(runtime.gcBlock).markFree") (;26;) (type $.rodata) (param i32)
      (local i32 i32)
      i32.const 65960
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
    (func $runtime.growHeap (;27;) (type 5) (result i32)
      (local i32 i32 i32)
      memory.size
      memory.grow
      i32.const -1
      i32.ne
      local.tee 1
      if ;; label = @1
        memory.size
        local.set 0
        i32.const 65824
        i32.load
        local.set 2
        i32.const 65824
        local.get 0
        i32.const 16
        i32.shl
        i32.store
        i32.const 65960
        i32.load
        local.set 0
        call $runtime.calculateHeapAddresses
        i32.const 65960
        i32.load
        local.get 0
        local.get 2
        local.get 0
        i32.sub
        memory.copy
      end
      local.get 1
    )
    (func $runtime.startMark (;28;) (type $.rodata) (param i32)
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
          call $#func29<_runtime.gcBlock_.setState>
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
                    call $#func25<_runtime.gcBlock_.state>
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
                i32.const 66336
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
                i32.const 66336
                i32.add
                local.set 4
                i32.const 65960
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
                    call $#func25<_runtime.gcBlock_.state>
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
                    i32.const 66336
                    i32.lt_u
                    br_if 0 (;@7;)
                    local.get 1
                    i32.const 65960
                    i32.load
                    i32.ge_u
                    br_if 0 (;@7;)
                    local.get 1
                    i32.const 66336
                    i32.sub
                    i32.const 4
                    i32.shr_u
                    local.tee 1
                    call $#func25<_runtime.gcBlock_.state>
                    i32.const 255
                    i32.and
                    i32.eqz
                    br_if 0 (;@7;)
                    local.get 1
                    call $#func31<_runtime.gcBlock_.findHead>
                    local.tee 1
                    call $#func25<_runtime.gcBlock_.state>
                    i32.const 255
                    i32.and
                    i32.const 3
                    i32.eq
                    br_if 0 (;@7;)
                    local.get 1
                    i32.const 3
                    call $#func29<_runtime.gcBlock_.setState>
                    local.get 2
                    i32.const 16
                    i32.eq
                    if ;; label = @8
                      i32.const 66001
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
          call $runtime.lookupPanic.llvm.7850521206707118346
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
    (func $#func29<_runtime.gcBlock_.setState> (@name "(runtime.gcBlock).setState") (;29;) (type 3) (param i32 i32)
      (local i32 i32)
      i32.const 65960
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
    (func $runtime.calculateHeapAddresses (;30;) (type $.data)
      (local i32 i32)
      i32.const 65824
      i32.load
      local.tee 0
      i32.const 66272
      i32.sub
      i32.const 65
      i32.div_u
      local.set 1
      i32.const 65960
      local.get 0
      local.get 1
      i32.sub
      local.tee 0
      i32.store
      i32.const 65968
      local.get 0
      i32.const 66336
      i32.sub
      i32.const 4
      i32.shr_u
      i32.store
    )
    (func $#func31<_runtime.gcBlock_.findHead> (@name "(runtime.gcBlock).findHead") (;31;) (type 6) (param i32) (result i32)
      (local i32 i32)
      loop ;; label = @1
        local.get 0
        call $#func25<_runtime.gcBlock_.state>
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
    (func $runtime.hashmapBinarySet.llvm.7850521206707118346 (;32;) (type 3) (param i32 i32)
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
          i32.const 65788
          i32.load
          i32.const 65780
          i32.load
          local.get 0
          call $runtime.hash32.llvm.7850521206707118346
          local.set 2
        end
        local.get 3
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65776
          local.get 0
          local.get 1
          local.get 2
          call $runtime.hashmapSet.llvm.7850521206707118346
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
    (func $free (;33;) (type $.rodata) (param i32)
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
              call $runtime.hashmapBinaryGet.llvm.7850521206707118346
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
              call $runtime.hashmapBinaryDelete.llvm.7850521206707118346
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
          i32.const 65576
          call $runtime._panic.llvm.7850521206707118346
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
    (func $runtime.hashmapBinaryGet.llvm.7850521206707118346 (;34;) (type 4) (param i32 i32) (result i32)
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
          i32.const 65788
          i32.load
          i32.const 65780
          i32.load
          local.get 0
          call $runtime.hash32.llvm.7850521206707118346
          local.set 3
        end
        local.get 2
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          i32.const 65776
          local.get 0
          local.get 1
          local.get 3
          call $runtime.hashmapGet.llvm.7850521206707118346
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
    (func $runtime.hashmapBinaryDelete.llvm.7850521206707118346 (;35;) (type $.rodata) (param i32)
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
          i32.const 66004
          i32.load
          local.set 7
          i32.const 66004
          local.get 2
          i32.store
          local.get 2
          local.get 7
          i32.store
          local.get 0
          i32.const 65788
          i32.load
          local.tee 3
          i32.const 65780
          i32.load
          local.get 5
          call $runtime.hash32.llvm.7850521206707118346
          local.set 5
          local.get 2
          i32.const 65776
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
          i32.const 65792
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
          i32.const 65796
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
                      i32.const 65788
                      i32.load
                      local.set 6
                      local.get 2
                      i32.const 65800
                      i32.load
                      local.tee 11
                      i32.store offset=20
                      local.get 2
                      i32.const 65804
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
                      i32.const 65784
                      i32.const 65784
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
          i32.const 66004
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
    (func $runtime._panic.llvm.7850521206707118346 (;36;) (type $.rodata) (param i32)
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
          i32.const 65629
          i32.const 7
          call $runtime.printstring.llvm.7850521206707118346
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
          call $runtime.printitf.llvm.7850521206707118346
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
          call $runtime.printnl.llvm.7850521206707118346
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
    (func $calloc (;37;) (type 4) (param i32 i32) (result i32)
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
          i32.const 66004
          i32.load
          local.set 2
          i32.const 66004
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
          i32.const 66004
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
    (func $realloc (;38;) (type 4) (param i32 i32) (result i32)
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
          i32.const 66004
          i32.load
          local.set 7
          i32.const 66004
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
                call $runtime.alloc.llvm.7850521206707118346
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
                  call $runtime.hashmapBinaryGet.llvm.7850521206707118346
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
                  call $runtime.hashmapBinaryDelete.llvm.7850521206707118346
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
                call $runtime.hashmapBinarySet.llvm.7850521206707118346
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
              i32.const 66004
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
            call $runtime.slicePanic.llvm.7850521206707118346
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
          i32.const 65608
          call $runtime._panic.llvm.7850521206707118346
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
    (func $_start (;39;) (type $.data)
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
          i32.const 66004
          i32.load
          local.tee 6
          i32.store
          i32.const 66004
          local.get 2
          i32.store
          i32.const 65824
          memory.size
          i32.const 16
          i32.shl
          local.tee 1
          i32.store
          call $runtime.calculateHeapAddresses
          local.get 2
          i32.const 65960
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
          call $runtime.alloc.llvm.7850521206707118346
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
          call $runtime.alloc.llvm.7850521206707118346
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
          i32.const 65956
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
          i32.const 65956
          local.get 0
          i32.store
          local.get 2
          i32.const 65952
          i32.load
          local.tee 1
          i32.store offset=40
          local.get 1
          i32.eqz
          if ;; label = @3
            i32.const 65952
            local.get 0
            i32.store
          end
        end
        loop ;; label = @2
          global.get 1
          i32.eqz
          if ;; label = @3
            i32.const 66012
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
                  i32.const 65952
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
                  i32.const 65952
                  local.get 0
                  i32.load
                  local.tee 1
                  i32.store
                  local.get 2
                  local.get 1
                  i32.store offset=48
                  local.get 2
                  i32.const 65956
                  i32.load
                  local.tee 1
                  i32.store offset=52
                  local.get 0
                  local.get 1
                  i32.eq
                  if ;; label = @7
                    i32.const 65956
                    i32.const 0
                    i32.store
                  end
                  local.get 0
                  i32.const 0
                  i32.store
                  i32.const 65820
                  i32.load
                  local.set 1
                  i32.const 65820
                  local.get 0
                  i32.store
                  local.get 2
                  local.get 1
                  i32.store offset=60
                  local.get 0
                  i32.load offset=16
                  local.set 4
                  local.get 0
                  i32.const 66004
                  i32.load
                  i32.store offset=16
                  i32.const 66004
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
                i32.const 66004
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
            i32.const 65820
            local.get 1
            i32.store
            i32.const 66004
            i32.load
            local.set 1
            i32.const 66004
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
          call $runtime.runtimePanic.llvm.7850521206707118346
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
    (func $runtime.run$1$gowrapper (;40;) (type $.rodata) (param i32)
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
    (func $runtime.waitForEvents (;41;) (type $.data)
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
          i32.const 65736
          i32.const 27
          call $runtime.runtimePanic.llvm.7850521206707118346
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
    (func $runtime.run$1 (;42;) (type $.data)
      i32.const 65824
      memory.size
      i32.const 16
      i32.shl
      i32.store
      call $__wasm_call_ctors
      i32.const 66012
      i32.const 1
      i32.store8
    )
    (func $runtime.deadlock (;43;) (type $.data)
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
          i32.const 65728
          call $runtime._panic.llvm.7850521206707118346
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
    (func $runtime.printitf.llvm.7850521206707118346 (;44;) (type $.rodata) (param i32)
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
          call $runtime.printstring.llvm.7850521206707118346
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
    (func $runtime.hashmapGet.llvm.7850521206707118346 (;45;) (type 2) (param i32 i32 i32 i32) (result i32)
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
          i32.const 66004
          i32.load
          local.set 9
          i32.const 66004
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
          i32.const 66004
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
    (func $runtime.hashmapSet.llvm.7850521206707118346 (;46;) (type 8) (param i32 i32 i32 i32)
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
          i32.const 66004
          i32.load
          local.tee 17
          i32.store offset=48
          i32.const 66004
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
                i32.const 65764
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
                i32.const 65764
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
                call $runtime.alloc.llvm.7850521206707118346
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
                call $runtime.alloc.llvm.7850521206707118346
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
                call $runtime.alloc.llvm.7850521206707118346
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
                        call $runtime.hashmapGet.llvm.7850521206707118346
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
                    call $runtime.hashmapSet.llvm.7850521206707118346
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
                call $runtime.alloc.llvm.7850521206707118346
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
          i32.const 66004
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
    (func $main._SET (;47;) (type 2) (param i32 i32 i32 i32) (result i32)
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
          call $runtime.slicePanic.llvm.7850521206707118346
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
    (func $main._GET (;48;) (type 2) (param i32 i32 i32 i32) (result i32)
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
          call $runtime.slicePanic.llvm.7850521206707118346
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
    (func $__wasm_export_md5_init_post_return (;49;) (type $.rodata) (param i32)
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
            i32.const 28
            i32.add
            i32.load
            i32.const 1
            i32.lt_s
            br_if 1 (;@2;)
            local.get 0
            i32.const 24
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
    (func $__wasm_export_md5_final_post_return (;50;) (type $.rodata) (param i32)
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
            i32.const 4
            i32.add
            i32.load
            i32.const 1
            i32.lt_s
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
    (func $cabi_realloc (;51;) (type 2) (param i32 i32 i32 i32) (result i32)
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
    (func $md5_list_u8_free (;52;) (type $.rodata) (param i32)
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
    (func $__wasm_export_md5_init (;53;) (type 5) (result i32)
      (local i32 i32)
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
          global.get $__stack_pointer
          i32.const 32
          i32.sub
          local.tee 0
          global.set $__stack_pointer
        end
        local.get 1
        i32.const 0
        global.get 1
        select
        i32.eqz
        if ;; label = @2
          local.get 0
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
          i32.const 66296
          local.get 0
          i64.load
          i64.store
          i32.const 66304
          local.get 0
          i64.load offset=8
          i64.store
          i32.const 66312
          local.get 0
          i64.load offset=16
          i64.store
          i32.const 66320
          local.get 0
          i64.load offset=24
          i64.store
          local.get 0
          i32.const 32
          i32.add
          global.set $__stack_pointer
          i32.const 66296
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
    (func $__wasm_export_md5_update (;54;) (type 9) (param i64 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
      (local i32 i32)
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
        local.tee 9
        i32.load
        local.set 1
        local.get 9
        i32.load offset=4
        local.set 2
        local.get 9
        i32.load offset=8
        local.set 6
        local.get 9
        i32.load offset=12
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
          call $md5_update
          local.set 3
          i32.const 0
          global.get 1
          i32.const 1
          i32.eq
          br_if 1 (;@1;)
          drop
          local.get 3
          local.set 6
        end
        global.get 1
        i32.eqz
        if ;; label = @2
          local.get 9
          i32.const 48
          i32.add
          global.set $__stack_pointer
          local.get 6
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
      local.get 6
      i32.store offset=8
      local.get 3
      local.get 9
      i32.store offset=12
      global.get 2
      global.get 2
      i32.load
      i32.const 16
      i32.add
      i32.store
      i32.const 0
    )
    (func $__wasm_export_md5_final (;55;) (type 10) (param i64 i32 i32 i32 i32 i32 i32) (result i32)
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
        local.tee 7
        i32.load
        local.set 1
        local.get 7
        i32.load offset=4
        local.set 2
        local.get 7
        i32.load offset=8
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
          i32.const 8
          i32.add
          local.set 2
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
          local.get 2
          call $md5_final
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
          i32.const 66296
          local.get 7
          i64.load offset=8
          i64.store
          local.get 7
          i32.const 48
          i32.add
          global.set $__stack_pointer
          i32.const 66296
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
      local.get 7
      i32.store offset=8
      global.get 2
      global.get 2
      i32.load
      i32.const 12
      i32.add
      i32.store
      i32.const 0
    )
    (func $asyncify_start_unwind (;56;) (type $.rodata) (param i32)
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
    (func $asyncify_stop_unwind (;57;) (type $.data)
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
    (func $asyncify_start_rewind (;58;) (type $.rodata) (param i32)
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
    (func $asyncify_stop_rewind (;59;) (type $.data)
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
    (func $asyncify_get_state (;60;) (type 5) (result i32)
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
    (export "md5_final" (func $md5_final))
    (export "malloc" (func $malloc))
    (export "free" (func $free))
    (export "calloc" (func $calloc))
    (export "realloc" (func $realloc))
    (export "_start" (func $_start))
    (export "cabi_post_md5#init" (func $__wasm_export_md5_init_post_return))
    (export "cabi_post_md5#final" (func $__wasm_export_md5_final_post_return))
    (export "cabi_realloc" (func $cabi_realloc))
    (export "md5#init" (func $__wasm_export_md5_init))
    (export "md5#update" (func $__wasm_export_md5_update))
    (export "md5#final" (func $__wasm_export_md5_final))
    (export "asyncify_start_unwind" (func $asyncify_start_unwind))
    (export "asyncify_stop_unwind" (func $asyncify_stop_unwind))
    (export "asyncify_start_rewind" (func $asyncify_start_rewind))
    (export "asyncify_stop_rewind" (func $asyncify_stop_rewind))
    (export "asyncify_get_state" (func $asyncify_get_state))
    (elem (;0;) (i32.const 1) func $runtime.run$1$gowrapper $runtime.memequal $runtime.hash32.llvm.7850521206707118346)
    (data (;0;) (i32.const 65536) "stack overflowfree: invalid pointer\00\00\00\00\00\0e\00\01\00\15\00\00\00realloc: invalid pointer0\00\01\00\18\00\00\00out of memorypanic: panic: runtime error: nil pointer dereferenceindex out of rangeslice out of rangeunreachable\b5\00\01\00\0b\00\00\00deadlocked: no event source")
    (data (;1;) (i32.const 65764) "\c1\82\01\00(\01\01\00\00\00\00\00\e0\01\01\00\c1\82\01\00\00\00\00\00\04\00\00\00\0c\00\00\00\01\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\03")
  )
  (core module (;1;)
    (type (;0;) (func (param i32)))
    (type (;1;) (func (param i32 i32)))
    (type (;2;) (func (param i32 i32 i32)))
    (type (;3;) (func (param i32 i32 i32 i32)))
    (type (;4;) (func (param i32) (result i32)))
    (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
    (type (;6;) (func (param i32 i64) (result i32)))
    (type (;7;) (func))
    (type (;8;) (func (result i32)))
    (type (;9;) (func (param i32 i32 i32) (result i32)))
    (type (;10;) (func (param i32 i32) (result i32)))
    (type (;11;) (func))
    (import "env" "memory" (memory (;0;) 0))
    (import "preopens" "get-directories" (func $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new19get_preopens_import17h20b9a9d05dd33b80E (;0;) (type 0)))
    (import "filesystem" "get-type" (func $_ZN22wasi_snapshot_preview18bindings10filesystem8get_type10wit_import17h799a5ccef592f9f6E (;1;) (type 1)))
    (import "__main_module__" "cabi_realloc" (func $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17hf5a8637fe59c56e1E (;2;) (type 5)))
    (import "filesystem" "write-via-stream" (func $_ZN22wasi_snapshot_preview18bindings10filesystem16write_via_stream10wit_import17hb3767af629c022d1E (;3;) (type 6)))
    (import "filesystem" "append-via-stream" (func $_ZN22wasi_snapshot_preview18bindings10filesystem17append_via_stream10wit_import17hfaa9c889a4d1e3f4E (;4;) (type 4)))
    (import "filesystem" "drop-descriptor" (func $_ZN22wasi_snapshot_preview18bindings10filesystem15drop_descriptor10wit_import17h9fb74e1897c82068E (;5;) (type 0)))
    (import "preopens" "get-stdio" (func $_ZN22wasi_snapshot_preview18bindings8preopens9get_stdio10wit_import17h33b2b91b67c74f49E (;6;) (type 0)))
    (import "streams" "drop-input-stream" (func $_ZN22wasi_snapshot_preview18bindings7streams17drop_input_stream10wit_import17h98b3bc873c87eab4E (;7;) (type 0)))
    (import "streams" "drop-output-stream" (func $_ZN22wasi_snapshot_preview18bindings7streams18drop_output_stream10wit_import17hee7ff74fc1470a05E (;8;) (type 0)))
    (import "streams" "write" (func $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h5c669f3cfe572b1bE (;9;) (type 3)))
    (import "__main_module__" "_start" (func $_start (;10;) (type 7)))
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
                call $_ZN22wasi_snapshot_preview15State3ptr17hee9781a4e20d46caE
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
                    call $_ZN22wasi_snapshot_preview19BumpArena5alloc17hc06d3cb00a4bffffE
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
                    call $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h851c5f7d26264323E
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
                    call $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h851c5f7d26264323E
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
                  call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                  i32.const 192
                  call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
                  local.get 4
                  i32.const 8250
                  i32.store16 offset=11 align=1
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 2
                  call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
                  call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                  local.get 4
                  i32.const 10
                  i32.store8 offset=11
                  local.get 4
                  i32.const 11
                  i32.add
                  i32.const 1
                  call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
                call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                i32.const 2203
                call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
                local.get 4
                i32.const 8250
                i32.store16 offset=11 align=1
                local.get 4
                i32.const 11
                i32.add
                i32.const 2
                call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
                call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                local.get 4
                i32.const 10
                i32.store8 offset=11
                local.get 4
                i32.const 11
                i32.add
                i32.const 1
                call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
              call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
              i32.const 79
              call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
              local.get 4
              i32.const 10
              i32.store8 offset=11
              local.get 4
              i32.const 11
              i32.add
              i32.const 1
              call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
            i32.const 2201
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
            local.get 4
            i32.const 10
            i32.store8 offset=11
            local.get 4
            i32.const 11
            i32.add
            i32.const 1
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
          i32.const 2202
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
          local.get 4
          i32.const 8250
          i32.store16 offset=11 align=1
          local.get 4
          i32.const 11
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
          local.get 4
          i32.const 10
          i32.store8 offset=11
          local.get 4
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        i32.const 185
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
        local.get 4
        i32.const 8250
        i32.store16 offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        local.get 4
        i32.const 10
        i32.store8 offset=11
        local.get 4
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
    (func $_ZN22wasi_snapshot_preview15State3ptr17hee9781a4e20d46caE (;12;) (type 8) (result i32)
      (local i32)
      block ;; label = @1
        call $get_state_ptr
        local.tee 0
        br_if 0 (;@1;)
        call $_ZN22wasi_snapshot_preview15State3new17h94413966dea0a621E
        local.tee 0
        call $set_state_ptr
      end
      local.get 0
    )
    (func $_ZN22wasi_snapshot_preview19BumpArena5alloc17hc06d3cb00a4bffffE (;13;) (type 9) (param i32 i32 i32) (result i32)
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      i32.const 109
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
      local.get 3
      i32.const 8250
      i32.store16 offset=11 align=1
      local.get 3
      i32.const 11
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      local.get 3
      i32.const 10
      i32.store8 offset=11
      local.get 3
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview111ImportAlloc10with_arena17h5156fbfbb7d7244dE (;14;) (type 2) (param i32 i32 i32)
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
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
          i32.const 171
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
          local.get 3
          i32.const 8250
          i32.store16 offset=11 align=1
          local.get 3
          i32.const 11
          i32.add
          i32.const 2
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
          local.get 3
          i32.const 10
          i32.store8 offset=11
          local.get 3
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        i32.const 164
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
        local.get 3
        i32.const 8250
        i32.store16 offset=11 align=1
        local.get 3
        i32.const 11
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        local.get 3
        i32.const 10
        i32.store8 offset=11
        local.get 3
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        unreachable
        unreachable
      end
      local.get 2
      call $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new19get_preopens_import17h20b9a9d05dd33b80E
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
              call $_ZN22wasi_snapshot_preview15State3ptr17hee9781a4e20d46caE
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
              call $_ZN22wasi_snapshot_preview19BumpArena5alloc17hc06d3cb00a4bffffE
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
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
            i32.const 215
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
            local.get 4
            i32.const 10
            i32.store8 offset=11
            local.get 4
            i32.const 11
            i32.add
            i32.const 1
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
          i32.const 2213
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
          local.get 4
          i32.const 10
          i32.store8 offset=11
          local.get 4
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        i32.const 2214
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
        local.get 4
        i32.const 8250
        i32.store16 offset=11 align=1
        local.get 4
        i32.const 11
        i32.add
        i32.const 2
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        local.get 4
        i32.const 10
        i32.store8 offset=11
        local.get 4
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      i32.const 2215
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
      local.get 4
      i32.const 8250
      i32.store16 offset=11 align=1
      local.get 4
      i32.const 11
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      local.get 4
      i32.const 10
      i32.store8 offset=11
      local.get 4
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview15State11descriptors17hcb8fe357234dbac4E (;16;) (type 1) (param i32 i32)
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
            call $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new17h69d19841ce3ceb58E
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        i32.const 2297
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
        local.get 2
        i32.const 10
        i32.store8 offset=8
        local.get 2
        i32.const 8
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      i32.const 2301
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
      local.get 2
      i32.const 10
      i32.store8 offset=8
      local.get 2
      i32.const 8
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      unreachable
      unreachable
    )
    (func $fd_write (;17;) (type 5) (param i32 i32 i32 i32) (result i32)
      (local i32 i32 i32 i32 i32 i32 i64)
      call $allocate_stack
      global.get $__stack_pointer
      i32.const 64
      i32.sub
      local.tee 4
      global.set $__stack_pointer
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                block ;; label = @6
                  call $get_allocation_state
                  i32.const -2
                  i32.add
                  i32.const -3
                  i32.and
                  br_if 0 (;@6;)
                  block ;; label = @7
                    block ;; label = @8
                      local.get 2
                      i32.eqz
                      br_if 0 (;@8;)
                      loop ;; label = @9
                        local.get 1
                        i32.const 4
                        i32.add
                        i32.load
                        local.tee 5
                        br_if 2 (;@7;)
                        local.get 1
                        i32.const 8
                        i32.add
                        local.set 1
                        local.get 2
                        i32.const -1
                        i32.add
                        local.tee 2
                        br_if 0 (;@9;)
                      end
                    end
                    i32.const 0
                    local.set 1
                    local.get 3
                    i32.const 0
                    i32.store
                    br 6 (;@1;)
                  end
                  local.get 1
                  i32.load
                  local.set 6
                  call $_ZN22wasi_snapshot_preview15State3ptr17hee9781a4e20d46caE
                  local.tee 2
                  i32.load
                  local.tee 1
                  i32.const 2147483647
                  i32.ge_u
                  br_if 1 (;@5;)
                  local.get 2
                  local.get 1
                  i32.const 1
                  i32.add
                  i32.store
                  local.get 2
                  i32.load offset=8
                  i32.const 560490357
                  i32.ne
                  br_if 2 (;@4;)
                  block ;; label = @7
                    block ;; label = @8
                      local.get 2
                      i32.const 65532
                      i32.add
                      i32.load
                      i32.const 560490357
                      i32.ne
                      br_if 0 (;@8;)
                      local.get 4
                      i32.const 16
                      i32.add
                      local.get 2
                      i32.const 8
                      i32.add
                      call $_ZN22wasi_snapshot_preview15State11descriptors17hcb8fe357234dbac4E
                      local.get 4
                      i32.load offset=16
                      local.tee 7
                      i32.load16_u offset=6144
                      local.set 8
                      local.get 4
                      i32.load offset=20
                      local.set 9
                      i32.const 8
                      local.set 1
                      i32.const 0
                      local.get 0
                      call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hb3066e9927fcd9e3E
                      local.tee 0
                      local.get 8
                      i32.ge_u
                      br_if 6 (;@2;)
                      local.get 7
                      local.get 0
                      i32.const 48
                      i32.mul
                      i32.add
                      local.tee 0
                      i32.load
                      i32.eqz
                      br_if 6 (;@2;)
                      local.get 4
                      i32.const 24
                      i32.add
                      local.get 0
                      i32.const 8
                      i32.add
                      call $_ZN22wasi_snapshot_preview111descriptors7Streams16get_write_stream17hc4679c0673591379E
                      local.get 4
                      i32.load16_u offset=24
                      br_if 1 (;@7;)
                      local.get 4
                      local.get 4
                      i32.load offset=28
                      local.get 6
                      local.get 5
                      call $_ZN22wasi_snapshot_preview18bindings7streams5write17h859ee64c38ecee96E
                      i32.const 29
                      local.set 1
                      local.get 4
                      i32.load
                      br_if 6 (;@2;)
                      local.get 4
                      i64.load offset=8
                      local.set 10
                      local.get 0
                      i32.const 40
                      i32.add
                      i32.load8_u
                      br_if 5 (;@3;)
                      local.get 0
                      i32.const 32
                      i32.add
                      local.tee 1
                      local.get 1
                      i64.load
                      local.get 10
                      i64.add
                      i64.store
                      br 5 (;@3;)
                    end
                    local.get 4
                    i32.const 32
                    i32.store8 offset=60
                    local.get 4
                    i32.const 1701734764
                    i32.store offset=56 align=1
                    local.get 4
                    i64.const 2338042707334751329
                    i64.store offset=48 align=1
                    local.get 4
                    i64.const 2338600898263348341
                    i64.store offset=40 align=1
                    local.get 4
                    i64.const 7162263158133189730
                    i64.store offset=32 align=1
                    local.get 4
                    i64.const 7018969289221893749
                    i64.store offset=24 align=1
                    local.get 4
                    i32.const 24
                    i32.add
                    i32.const 37
                    call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                    i32.const 2203
                    call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
                    local.get 4
                    i32.const 8250
                    i32.store16 offset=24 align=1
                    local.get 4
                    i32.const 24
                    i32.add
                    i32.const 2
                    call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                    local.get 4
                    i32.const 10
                    i32.store8 offset=40
                    local.get 4
                    i64.const 7234307576302018670
                    i64.store offset=32 align=1
                    local.get 4
                    i64.const 8028075845441778529
                    i64.store offset=24 align=1
                    local.get 4
                    i32.const 24
                    i32.add
                    i32.const 17
                    call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                    local.get 4
                    i32.const 10
                    i32.store8 offset=24
                    local.get 4
                    i32.const 24
                    i32.add
                    i32.const 1
                    call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
                    unreachable
                    unreachable
                  end
                  local.get 4
                  i32.load16_u offset=26
                  local.set 1
                  br 4 (;@2;)
                end
                local.get 3
                i32.const 0
                i32.store
                i32.const 29
                local.set 1
                br 4 (;@1;)
              end
              local.get 4
              i32.const 32
              i32.store8 offset=60
              local.get 4
              i32.const 1701734764
              i32.store offset=56 align=1
              local.get 4
              i64.const 2338042707334751329
              i64.store offset=48 align=1
              local.get 4
              i64.const 2338600898263348341
              i64.store offset=40 align=1
              local.get 4
              i64.const 7162263158133189730
              i64.store offset=32 align=1
              local.get 4
              i64.const 7018969289221893749
              i64.store offset=24 align=1
              local.get 4
              i32.const 24
              i32.add
              i32.const 37
              call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
              i32.const 2201
              call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
              local.get 4
              i32.const 10
              i32.store8 offset=24
              local.get 4
              i32.const 24
              i32.add
              i32.const 1
              call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
              unreachable
              unreachable
            end
            local.get 4
            i32.const 32
            i32.store8 offset=60
            local.get 4
            i32.const 1701734764
            i32.store offset=56 align=1
            local.get 4
            i64.const 2338042707334751329
            i64.store offset=48 align=1
            local.get 4
            i64.const 2338600898263348341
            i64.store offset=40 align=1
            local.get 4
            i64.const 7162263158133189730
            i64.store offset=32 align=1
            local.get 4
            i64.const 7018969289221893749
            i64.store offset=24 align=1
            local.get 4
            i32.const 24
            i32.add
            i32.const 37
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
            i32.const 2202
            call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
            local.get 4
            i32.const 8250
            i32.store16 offset=24 align=1
            local.get 4
            i32.const 24
            i32.add
            i32.const 2
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
            local.get 4
            i32.const 10
            i32.store8 offset=40
            local.get 4
            i64.const 7234307576302018670
            i64.store offset=32 align=1
            local.get 4
            i64.const 8028075845441778529
            i64.store offset=24 align=1
            local.get 4
            i32.const 24
            i32.add
            i32.const 17
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
            local.get 4
            i32.const 10
            i32.store8 offset=24
            local.get 4
            i32.const 24
            i32.add
            i32.const 1
            call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
            unreachable
            unreachable
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
      i32.const 64
      i32.add
      global.set $__stack_pointer
      local.get 1
      i32.const 65535
      i32.and
    )
    (func $_ZN22wasi_snapshot_preview15State3new17h94413966dea0a621E (;18;) (type 8) (result i32)
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
        call $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17hf5a8637fe59c56e1E
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      i32.const 2246
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
      local.get 0
      i32.const 8250
      i32.store16 offset=11 align=1
      local.get 0
      i32.const 11
      i32.add
      i32.const 2
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      local.get 0
      i32.const 10
      i32.store8 offset=11
      local.get 0
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      unreachable
      unreachable
    )
    (func $_ZN4core3ptr68drop_in_place$LT$wasi_snapshot_preview1..descriptors..Descriptor$GT$17h54be0892e2478d80E.llvm.14507455501008181843 (;19;) (type 0) (param i32)
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
          i32.const 1
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          i32.const 12
          i32.add
          i32.load
          call $_ZN22wasi_snapshot_preview18bindings7streams17drop_input_stream10wit_import17h98b3bc873c87eab4E
        end
        block ;; label = @2
          local.get 0
          i32.const 16
          i32.add
          i32.load
          i32.const 1
          i32.ne
          br_if 0 (;@2;)
          local.get 0
          i32.const 20
          i32.add
          i32.load
          call $_ZN22wasi_snapshot_preview18bindings7streams18drop_output_stream10wit_import17hee7ff74fc1470a05E
        end
        block ;; label = @2
          block ;; label = @3
            local.get 0
            i32.const 40
            i32.add
            i32.load8_u
            local.tee 2
            i32.const -2
            i32.add
            i32.const 1
            local.get 2
            i32.const 1
            i32.gt_u
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
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
          i32.const 32
          call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
          local.get 1
          i32.const 10
          i32.store8 offset=11
          local.get 1
          i32.const 11
          i32.add
          i32.const 1
          call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
          unreachable
          unreachable
        end
        local.get 0
        i32.const 24
        i32.add
        i32.load
        call $_ZN22wasi_snapshot_preview18bindings10filesystem15drop_descriptor10wit_import17h9fb74e1897c82068E
      end
      local.get 1
      i32.const 48
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview111descriptors7Streams16get_write_stream17hc4679c0673591379E (;20;) (type 1) (param i32 i32)
      (local i32 i32)
      block ;; label = @1
        block ;; label = @2
          block ;; label = @3
            block ;; label = @4
              block ;; label = @5
                local.get 1
                i32.load offset=8
                i32.const 1
                i32.eq
                br_if 0 (;@5;)
                local.get 1
                i32.const 32
                i32.add
                i32.load8_u
                local.tee 2
                i32.const 29
                i32.shl
                i32.const 29
                i32.shr_s
                i32.const 0
                i32.lt_s
                br_if 1 (;@4;)
                local.get 2
                i32.const 2
                i32.eq
                br_if 1 (;@4;)
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
                local.set 1
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
            i32.const 1
            local.set 1
            br 2 (;@1;)
          end
          local.get 1
          i32.load offset=16
          local.set 3
          block ;; label = @3
            block ;; label = @4
              local.get 2
              br_if 0 (;@4;)
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i64.load
              call $_ZN22wasi_snapshot_preview18bindings10filesystem16write_via_stream10wit_import17hb3767af629c022d1E
              local.set 2
              br 1 (;@3;)
            end
            local.get 3
            call $_ZN22wasi_snapshot_preview18bindings10filesystem17append_via_stream10wit_import17hfaa9c889a4d1e3f4E
            local.set 2
          end
          local.get 1
          i32.const 1
          i32.store offset=8
          local.get 0
          local.get 2
          i32.store offset=4
          local.get 1
          i32.const 12
          i32.add
          local.get 2
          i32.store
        end
        i32.const 0
        local.set 1
      end
      local.get 0
      local.get 1
      i32.store16
    )
    (func $_ZN22wasi_snapshot_preview111descriptors11Descriptors3new17h69d19841ce3ceb58E (;21;) (type 2) (param i32 i32 i32)
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
      call $_ZN22wasi_snapshot_preview18bindings8preopens9get_stdio10wit_import17h33b2b91b67c74f49E
      local.get 3
      i32.load offset=20
      local.set 4
      local.get 3
      i32.load offset=16
      local.set 5
      local.get 3
      i32.const 24
      i32.add
      i32.load
      local.tee 6
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
      call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hd5e867387a771e4dE
      drop
      local.get 3
      i32.const 56
      i32.add
      local.tee 5
      i32.const 2
      i32.store8
      local.get 3
      i32.const 36
      i32.add
      local.tee 7
      local.get 4
      i32.store
      local.get 3
      i32.const 32
      i32.add
      local.tee 4
      i32.const 1
      i32.store
      local.get 3
      i32.const 0
      i32.store offset=24
      local.get 3
      i32.const 1
      i32.store offset=16
      local.get 0
      i32.const 48
      i32.add
      local.get 3
      i32.const 16
      i32.add
      i32.const 48
      call $memcpy
      drop
      local.get 3
      i32.const 0
      i32.store16 offset=8
      local.get 3
      i32.const 1
      i32.store offset=12
      local.get 3
      i32.const 8
      i32.add
      call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hd5e867387a771e4dE
      drop
      local.get 5
      i32.const 2
      i32.store8
      local.get 7
      local.get 6
      i32.store
      local.get 4
      i32.const 1
      i32.store
      local.get 3
      i32.const 0
      i32.store offset=24
      local.get 3
      i32.const 1
      i32.store offset=16
      local.get 0
      i32.const 96
      i32.add
      local.get 3
      i32.const 16
      i32.add
      i32.const 48
      call $memcpy
      drop
      i32.const 3
      local.set 4
      local.get 0
      i32.const 3
      i32.store16 offset=6144
      local.get 3
      i32.const 2
      i32.store offset=12
      local.get 3
      i32.const 0
      i32.store16 offset=8
      local.get 3
      i32.const 8
      i32.add
      call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hd5e867387a771e4dE
      drop
      local.get 3
      i64.const 0
      i64.store
      local.get 1
      local.get 2
      local.get 3
      call $_ZN22wasi_snapshot_preview111ImportAlloc10with_arena17h5156fbfbb7d7244dE
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
        local.set 1
        local.get 3
        i32.const 16
        i32.add
        i32.const 1
        i32.or
        local.set 7
        local.get 8
        local.set 2
        loop ;; label = @2
          local.get 2
          i32.load
          local.tee 5
          local.get 3
          i32.const 16
          i32.add
          call $_ZN22wasi_snapshot_preview18bindings10filesystem8get_type10wit_import17h799a5ccef592f9f6E
          local.get 3
          i32.load8_u offset=16
          i32.const 0
          i32.ne
          local.get 7
          i32.load8_u
          call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h8c608d031ff08c22E
          local.set 6
          local.get 3
          i32.const 0
          i32.store8 offset=56
          local.get 3
          i64.const 0
          i64.store offset=48
          local.get 3
          local.get 5
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
          local.get 6
          i32.const 255
          i32.and
          i32.store8 offset=44
          block ;; label = @3
            block ;; label = @4
              local.get 4
              i32.const 65535
              i32.and
              local.tee 5
              i32.const 128
              i32.lt_u
              br_if 0 (;@4;)
              local.get 3
              i32.const 3145729
              i32.store offset=8
              local.get 3
              i32.const 16
              i32.add
              call $_ZN4core3ptr68drop_in_place$LT$wasi_snapshot_preview1..descriptors..Descriptor$GT$17h54be0892e2478d80E.llvm.14507455501008181843
              br 1 (;@3;)
            end
            local.get 0
            local.get 5
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
            local.get 5
            i32.store offset=12
            local.get 3
            i32.const 0
            i32.store16 offset=8
          end
          local.get 2
          i32.const 12
          i32.add
          local.set 2
          local.get 3
          i32.const 8
          i32.add
          call $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hd5e867387a771e4dE
          drop
          local.get 1
          i32.const -12
          i32.add
          local.tee 1
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
    (func $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h8c608d031ff08c22E (;22;) (type 10) (param i32 i32) (result i32)
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      i32.const 66
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
      local.get 2
      i32.const 10
      i32.store8 offset=11
      local.get 2
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      unreachable
      unreachable
    )
    (func $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hb3066e9927fcd9e3E (;23;) (type 10) (param i32 i32) (result i32)
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      i32.const 66
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
      local.get 2
      i32.const 10
      i32.store8 offset=11
      local.get 2
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      unreachable
      unreachable
    )
    (func $_ZN101_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17hd5e867387a771e4dE (;24;) (type 4) (param i32) (result i32)
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
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      i32.const 66
      call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
      local.get 1
      i32.const 10
      i32.store8 offset=11
      local.get 1
      i32.const 11
      i32.add
      i32.const 1
      call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
      unreachable
      unreachable
    )
    (func $_ZN22wasi_snapshot_preview18bindings7streams5write17h859ee64c38ecee96E (;25;) (type 3) (param i32 i32 i32 i32)
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
      call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h5c669f3cfe572b1bE
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
    (func $_ZN97_$LT$core..option..Option$LT$T$GT$$u20$as$u20$wasi_snapshot_preview1..TrappingUnwrap$LT$T$GT$$GT$15trapping_unwrap17h851c5f7d26264323E (;26;) (type 10) (param i32 i32) (result i32)
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
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        i32.const 57
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E
        local.get 2
        i32.const 10
        i32.store8 offset=11
        local.get 2
        i32.const 11
        i32.add
        i32.const 1
        call $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE
        unreachable
        unreachable
      end
      local.get 2
      i32.const 48
      i32.add
      global.set $__stack_pointer
      local.get 1
    )
    (func $_ZN22wasi_snapshot_preview16macros5print17h9412364d412865cbE (;27;) (type 1) (param i32 i32)
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
      call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h5c669f3cfe572b1bE
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3217hb95e146ca77739f6E (;28;) (type 0) (param i32)
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
          call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h5c669f3cfe572b1bE
          br 1 (;@1;)
        end
        local.get 0
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17hac38cb24c54cc3f3E.llvm.10765153128669895872
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17hac38cb24c54cc3f3E.llvm.10765153128669895872 (;29;) (type 0) (param i32)
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
        call $_ZN22wasi_snapshot_preview16macros10eprint_u3215eprint_u32_impl17hac38cb24c54cc3f3E.llvm.10765153128669895872
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
        call $_ZN22wasi_snapshot_preview18bindings7streams5write10wit_import17h5c669f3cfe572b1bE
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
    )
    (func $get_state_ptr (;30;) (type 8) (result i32)
      global.get $internal_state_ptr
    )
    (func $set_state_ptr (;31;) (type 0) (param i32)
      local.get 0
      global.set $internal_state_ptr
    )
    (func $get_allocation_state (;32;) (type 8) (result i32)
      global.get $allocation_state
    )
    (func $set_allocation_state (;33;) (type 0) (param i32)
      local.get 0
      global.set $allocation_state
    )
    (func $get_stderr_stream (;34;) (type 8) (result i32)
      global.get $stderr_stream
    )
    (func $set_stderr_stream (;35;) (type 0) (param i32)
      local.get 0
      global.set $stderr_stream
    )
    (func $memcpy (;36;) (type 9) (param i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      call $_ZN17compiler_builtins3mem6memcpy17hc062a3a8dcc986ceE
    )
    (func $_ZN17compiler_builtins3mem6memcpy17hc062a3a8dcc986ceE (;37;) (type 9) (param i32 i32 i32) (result i32)
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
    (func $main (;38;) (type 8) (result i32)
      call $allocate_stack
      call $_start
      i32.const 0
      return
    )
    (func $allocate_stack (;39;) (type 11)
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
        call $_ZN22wasi_snapshot_preview15State3new12cabi_realloc17hf5a8637fe59c56e1E
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
    (export "main" (func $main))
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
    (func $adapt-wasi_snapshot_preview1-fd_write (;4;) (type 3) (param i32 i32 i32 i32) (result i32)
      local.get 0
      local.get 1
      local.get 2
      local.get 3
      i32.const 4
      call_indirect (type 3)
    )
    (table (;0;) 5 5 funcref)
    (export "0" (func $indirect-preopens-get-stdio))
    (export "1" (func $indirect-preopens-get-directories))
    (export "2" (func $indirect-filesystem-get-type))
    (export "3" (func $indirect-streams-write))
    (export "4" (func $adapt-wasi_snapshot_preview1-fd_write))
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
    (import "" "4" (func (;4;) (type 3)))
    (import "" "$imports" (table (;0;) 5 5 funcref))
    (elem (;0;) (i32.const 0) func 0 1 2 3 4)
  )
  (core instance (;0;) (instantiate 2))
  (alias core export 0 "4" (core func (;0;)))
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
  (alias core export 2 "_start" (core func (;3;)))
  (core instance (;3;)
    (export "cabi_realloc" (func 2))
    (export "_start" (func 3))
  )
  (core instance (;4;)
    (export "memory" (memory 0))
  )
  (alias core export 0 "0" (core func (;4;)))
  (alias core export 0 "1" (core func (;5;)))
  (core instance (;5;)
    (export "get-stdio" (func 4))
    (export "get-directories" (func 5))
  )
  (alias core export 0 "2" (core func (;6;)))
  (alias export 1 "write-via-stream" (func (;0;)))
  (core func (;7;) (canon lower (func 0)))
  (alias export 1 "append-via-stream" (func (;1;)))
  (core func (;8;) (canon lower (func 1)))
  (alias export 1 "drop-descriptor" (func (;2;)))
  (core func (;9;) (canon lower (func 2)))
  (core instance (;6;)
    (export "get-type" (func 6))
    (export "write-via-stream" (func 7))
    (export "append-via-stream" (func 8))
    (export "drop-descriptor" (func 9))
  )
  (alias core export 0 "3" (core func (;10;)))
  (alias export 0 "drop-input-stream" (func (;3;)))
  (core func (;11;) (canon lower (func 3)))
  (alias export 0 "drop-output-stream" (func (;4;)))
  (core func (;12;) (canon lower (func 4)))
  (core instance (;7;)
    (export "write" (func 10))
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
  (alias core export 8 "fd_write" (core func (;19;)))
  (core instance (;9;)
    (export "$imports" (table 0))
    (export "0" (func 15))
    (export "1" (func 16))
    (export "2" (func 17))
    (export "3" (func 18))
    (export "4" (func 19))
  )
  (core instance (;10;) (instantiate 3
      (with "" (instance 9))
    )
  )
  (type (;7;) (list u8))
  (type (;8;) (record (field "bytes" u64) (field "a" u32) (field "b" u32) (field "c" u32) (field "d" u32) (field "buffer" 7)))
  (type (;9;) (func (result 8)))
  (alias core export 2 "md5#init" (core func (;20;)))
  (alias core export 2 "cabi_post_md5#init" (core func (;21;)))
  (func (;9;) (type 9) (canon lift (core func 20) (memory 0) (post-return 21)))
  (type (;10;) (func (param "ctx" 8) (param "msg" 7) (result s32)))
  (alias core export 2 "md5#update" (core func (;22;)))
  (func (;10;) (type 10) (canon lift (core func 22) (memory 0) (realloc 1)))
  (type (;11;) (func (param "ctx" 8) (result 7)))
  (alias core export 2 "md5#final" (core func (;23;)))
  (alias core export 2 "cabi_post_md5#final" (core func (;24;)))
  (func (;11;) (type 11) (canon lift (core func 23) (memory 0) (realloc 1) (post-return 24)))
  (component (;0;)
    (alias outer 1 9 (type (;0;)))
    (import "import-init" (func (;0;) (type 0)))
    (alias outer 1 10 (type (;1;)))
    (import "import-update" (func (;1;) (type 1)))
    (alias outer 1 11 (type (;2;)))
    (import "import-final" (func (;2;) (type 2)))
    (type (;3;) (list u8))
    (type (;4;) (record (field "bytes" u64) (field "a" u32) (field "b" u32) (field "c" u32) (field "d" u32) (field "buffer" 3)))
    (export (;5;) "context" (type 4))
    (type (;6;) (func (result 5)))
    (export (;3;) "init" (func 0) (func (type 6)))
    (type (;7;) (func (param "ctx" 5) (param "msg" 3) (result s32)))
    (export (;4;) "update" (func 1) (func (type 7)))
    (type (;8;) (func (param "ctx" 5) (result 3)))
    (export (;5;) "final" (func 2) (func (type 8)))
  )
  (instance (;3;) (instantiate 0
      (with "import-init" (func 9))
      (with "import-update" (func 10))
      (with "import-final" (func 11))
    )
  )
  (export (;4;) "md5" (instance 3))
  (type (;12;) (result))
  (type (;13;) (func (result 12)))
  (alias core export 8 "main" (core func (;25;)))
  (func (;12;) (type 13) (canon lift (core func 25)))
  (export (;13;) "main" (func 12))
)