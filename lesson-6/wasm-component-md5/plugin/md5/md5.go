package md5

// #include "md5.h"
import "C"

import "unsafe"

// md5
type Md5ErrnoKind int

const (
Md5ErrnoKindError Md5ErrnoKind = iota
)

type Md5Errno struct {
  kind Md5ErrnoKind
}

func (n Md5Errno) Kind() Md5ErrnoKind {
  return n.kind
}

func Md5ErrnoError() Md5Errno{
  return Md5Errno{kind: Md5ErrnoKindError}
}

type Md5Context struct {
  Bytes uint64
  A uint32
  B uint32
  C uint32
  D uint32
  Buffer []uint8
}

var md5 Md5 = nil
func SetMd5(i Md5) {
  md5 = i
}
type Md5 interface {
  Init() Result[Md5Context, Md5Errno] 
  Update(ctx Md5Context, msg []uint8) Result[Md5Context, Md5Errno] 
  Hash(ctx Md5Context) Result[[]uint8, Md5Errno] 
}
//export md5_init
func Md5Init(ret *C.md5_result_context_errno_t) {
  result := md5.Init()
  var lower_result C.md5_result_context_errno_t
  lower_result.is_err = result.IsErr()
  if result.IsOk() {
    lower_result_ptr := (*C.md5hash_context_t)(unsafe.Pointer(&lower_result.val))
    var lower_result_val C.md5hash_context_t
    lower_result_val_bytes := C.uint64_t(result.Unwrap().Bytes)
    lower_result_val.bytes = lower_result_val_bytes
    lower_result_val_a := C.uint32_t(result.Unwrap().A)
    lower_result_val.a = lower_result_val_a
    lower_result_val_b := C.uint32_t(result.Unwrap().B)
    lower_result_val.b = lower_result_val_b
    lower_result_val_c := C.uint32_t(result.Unwrap().C)
    lower_result_val.c = lower_result_val_c
    lower_result_val_d := C.uint32_t(result.Unwrap().D)
    lower_result_val.d = lower_result_val_d
    var lower_result_val_buffer C.md5_list_u8_t
    if len(result.Unwrap().Buffer) == 0 {
      lower_result_val_buffer.ptr = nil
      lower_result_val_buffer.len = 0
    } else {
      var empty_lower_result_val_buffer C.uint8_t
      lower_result_val_buffer.ptr = (*C.uint8_t)(C.malloc(C.size_t(len(result.Unwrap().Buffer)) * C.size_t(unsafe.Sizeof(empty_lower_result_val_buffer))))
      lower_result_val_buffer.len = C.size_t(len(result.Unwrap().Buffer))
      for lower_result_val_buffer_i := range result.Unwrap().Buffer {
        lower_result_val_buffer_ptr := (*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(lower_result_val_buffer.ptr)) +
        uintptr(lower_result_val_buffer_i)*unsafe.Sizeof(empty_lower_result_val_buffer)))
        lower_result_val_buffer_ptr_value := C.uint8_t(result.Unwrap().Buffer[lower_result_val_buffer_i])
        *lower_result_val_buffer_ptr = lower_result_val_buffer_ptr_value
      }
    }
    lower_result_val.buffer = lower_result_val_buffer
    *lower_result_ptr = lower_result_val
  } else {
    lower_result_ptr := (*C.md5hash_errno_t)(unsafe.Pointer(&lower_result.val))
    var lower_result_val C.md5hash_errno_t
    if result.UnwrapErr().Kind() == Md5ErrnoKindError {
      lower_result_val = 0
    }
    *lower_result_ptr = lower_result_val
  }
  *ret = lower_result
  
}
//export md5_update
func Md5Update(ctx *C.md5hash_context_t, msg *C.md5_list_u8_t, ret *C.md5_result_context_errno_t) {
  defer C.md5hash_context_free(ctx)
  defer C.md5_list_u8_free(msg)
  var lift_ctx Md5Context
  var lift_ctx_Bytes uint64
  lift_ctx_Bytes = uint64(ctx.bytes)
  lift_ctx.Bytes = lift_ctx_Bytes
  var lift_ctx_A uint32
  lift_ctx_A = uint32(ctx.a)
  lift_ctx.A = lift_ctx_A
  var lift_ctx_B uint32
  lift_ctx_B = uint32(ctx.b)
  lift_ctx.B = lift_ctx_B
  var lift_ctx_C uint32
  lift_ctx_C = uint32(ctx.c)
  lift_ctx.C = lift_ctx_C
  var lift_ctx_D uint32
  lift_ctx_D = uint32(ctx.d)
  lift_ctx.D = lift_ctx_D
  var lift_ctx_Buffer []uint8
  lift_ctx_Buffer = make([]uint8, ctx.buffer.len)
  if ctx.buffer.len > 0 {
    for lift_ctx_Buffer_i := 0; lift_ctx_Buffer_i < int(ctx.buffer.len); lift_ctx_Buffer_i++ {
      var empty_lift_ctx_Buffer C.uint8_t
      lift_ctx_Buffer_ptr := *(*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(ctx.buffer.ptr)) +
      uintptr(lift_ctx_Buffer_i)*unsafe.Sizeof(empty_lift_ctx_Buffer)))
      var list_lift_ctx_Buffer uint8
      list_lift_ctx_Buffer = uint8(lift_ctx_Buffer_ptr)
      lift_ctx_Buffer[lift_ctx_Buffer_i] = list_lift_ctx_Buffer
    }
  }
  lift_ctx.Buffer = lift_ctx_Buffer
  var lift_msg []uint8
  lift_msg = make([]uint8, msg.len)
  if msg.len > 0 {
    for lift_msg_i := 0; lift_msg_i < int(msg.len); lift_msg_i++ {
      var empty_lift_msg C.uint8_t
      lift_msg_ptr := *(*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(msg.ptr)) +
      uintptr(lift_msg_i)*unsafe.Sizeof(empty_lift_msg)))
      var list_lift_msg uint8
      list_lift_msg = uint8(lift_msg_ptr)
      lift_msg[lift_msg_i] = list_lift_msg
    }
  }
  result := md5.Update(lift_ctx, lift_msg)
  var lower_result C.md5_result_context_errno_t
  lower_result.is_err = result.IsErr()
  if result.IsOk() {
    lower_result_ptr := (*C.md5hash_context_t)(unsafe.Pointer(&lower_result.val))
    var lower_result_val C.md5hash_context_t
    lower_result_val_bytes := C.uint64_t(result.Unwrap().Bytes)
    lower_result_val.bytes = lower_result_val_bytes
    lower_result_val_a := C.uint32_t(result.Unwrap().A)
    lower_result_val.a = lower_result_val_a
    lower_result_val_b := C.uint32_t(result.Unwrap().B)
    lower_result_val.b = lower_result_val_b
    lower_result_val_c := C.uint32_t(result.Unwrap().C)
    lower_result_val.c = lower_result_val_c
    lower_result_val_d := C.uint32_t(result.Unwrap().D)
    lower_result_val.d = lower_result_val_d
    var lower_result_val_buffer C.md5_list_u8_t
    if len(result.Unwrap().Buffer) == 0 {
      lower_result_val_buffer.ptr = nil
      lower_result_val_buffer.len = 0
    } else {
      var empty_lower_result_val_buffer C.uint8_t
      lower_result_val_buffer.ptr = (*C.uint8_t)(C.malloc(C.size_t(len(result.Unwrap().Buffer)) * C.size_t(unsafe.Sizeof(empty_lower_result_val_buffer))))
      lower_result_val_buffer.len = C.size_t(len(result.Unwrap().Buffer))
      for lower_result_val_buffer_i := range result.Unwrap().Buffer {
        lower_result_val_buffer_ptr := (*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(lower_result_val_buffer.ptr)) +
        uintptr(lower_result_val_buffer_i)*unsafe.Sizeof(empty_lower_result_val_buffer)))
        lower_result_val_buffer_ptr_value := C.uint8_t(result.Unwrap().Buffer[lower_result_val_buffer_i])
        *lower_result_val_buffer_ptr = lower_result_val_buffer_ptr_value
      }
    }
    lower_result_val.buffer = lower_result_val_buffer
    *lower_result_ptr = lower_result_val
  } else {
    lower_result_ptr := (*C.md5hash_errno_t)(unsafe.Pointer(&lower_result.val))
    var lower_result_val C.md5hash_errno_t
    if result.UnwrapErr().Kind() == Md5ErrnoKindError {
      lower_result_val = 0
    }
    *lower_result_ptr = lower_result_val
  }
  *ret = lower_result
  
}
//export md5_hash
func Md5Hash(ctx *C.md5hash_context_t, ret *C.md5_result_list_u8_errno_t) {
  defer C.md5hash_context_free(ctx)
  var lift_ctx Md5Context
  var lift_ctx_Bytes uint64
  lift_ctx_Bytes = uint64(ctx.bytes)
  lift_ctx.Bytes = lift_ctx_Bytes
  var lift_ctx_A uint32
  lift_ctx_A = uint32(ctx.a)
  lift_ctx.A = lift_ctx_A
  var lift_ctx_B uint32
  lift_ctx_B = uint32(ctx.b)
  lift_ctx.B = lift_ctx_B
  var lift_ctx_C uint32
  lift_ctx_C = uint32(ctx.c)
  lift_ctx.C = lift_ctx_C
  var lift_ctx_D uint32
  lift_ctx_D = uint32(ctx.d)
  lift_ctx.D = lift_ctx_D
  var lift_ctx_Buffer []uint8
  lift_ctx_Buffer = make([]uint8, ctx.buffer.len)
  if ctx.buffer.len > 0 {
    for lift_ctx_Buffer_i := 0; lift_ctx_Buffer_i < int(ctx.buffer.len); lift_ctx_Buffer_i++ {
      var empty_lift_ctx_Buffer C.uint8_t
      lift_ctx_Buffer_ptr := *(*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(ctx.buffer.ptr)) +
      uintptr(lift_ctx_Buffer_i)*unsafe.Sizeof(empty_lift_ctx_Buffer)))
      var list_lift_ctx_Buffer uint8
      list_lift_ctx_Buffer = uint8(lift_ctx_Buffer_ptr)
      lift_ctx_Buffer[lift_ctx_Buffer_i] = list_lift_ctx_Buffer
    }
  }
  lift_ctx.Buffer = lift_ctx_Buffer
  result := md5.Hash(lift_ctx)
  var lower_result C.md5_result_list_u8_errno_t
  lower_result.is_err = result.IsErr()
  if result.IsOk() {
    lower_result_ptr := (*C.md5_list_u8_t)(unsafe.Pointer(&lower_result.val))
    var lower_result_val C.md5_list_u8_t
    if len(result.Unwrap()) == 0 {
      lower_result_val.ptr = nil
      lower_result_val.len = 0
    } else {
      var empty_lower_result_val C.uint8_t
      lower_result_val.ptr = (*C.uint8_t)(C.malloc(C.size_t(len(result.Unwrap())) * C.size_t(unsafe.Sizeof(empty_lower_result_val))))
      lower_result_val.len = C.size_t(len(result.Unwrap()))
      for lower_result_val_i := range result.Unwrap() {
        lower_result_val_ptr := (*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(lower_result_val.ptr)) +
        uintptr(lower_result_val_i)*unsafe.Sizeof(empty_lower_result_val)))
        lower_result_val_ptr_value := C.uint8_t(result.Unwrap()[lower_result_val_i])
        *lower_result_val_ptr = lower_result_val_ptr_value
      }
    }
    *lower_result_ptr = lower_result_val
  } else {
    lower_result_ptr := (*C.md5hash_errno_t)(unsafe.Pointer(&lower_result.val))
    var lower_result_val C.md5hash_errno_t
    if result.UnwrapErr().Kind() == Md5ErrnoKindError {
      lower_result_val = 0
    }
    *lower_result_ptr = lower_result_val
  }
  *ret = lower_result
  
}
