package md5

// #include "md5.h"
import "C"

import "unsafe"

// md5
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
  Init() Md5Context 
  Update(ctx Md5Context, msg []uint8) int32 
  Final(ctx Md5Context) []uint8 
}
//export md5_init
func Md5Init(ret *C.md5hash_context_t) {
  result := md5.Init()
  var lower_result C.md5hash_context_t
  lower_result_bytes := C.uint64_t(result.Bytes)
  lower_result.bytes = lower_result_bytes
  lower_result_a := C.uint32_t(result.A)
  lower_result.a = lower_result_a
  lower_result_b := C.uint32_t(result.B)
  lower_result.b = lower_result_b
  lower_result_c := C.uint32_t(result.C)
  lower_result.c = lower_result_c
  lower_result_d := C.uint32_t(result.D)
  lower_result.d = lower_result_d
  var lower_result_buffer C.md5_list_u8_t
  if len(result.Buffer) == 0 {
    lower_result_buffer.ptr = nil
    lower_result_buffer.len = 0
  } else {
    var empty_lower_result_buffer C.uint8_t
    lower_result_buffer.ptr = (*C.uint8_t)(C.malloc(C.size_t(len(result.Buffer)) * C.size_t(unsafe.Sizeof(empty_lower_result_buffer))))
    lower_result_buffer.len = C.size_t(len(result.Buffer))
    for lower_result_buffer_i := range result.Buffer {
      lower_result_buffer_ptr := (*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(lower_result_buffer.ptr)) +
      uintptr(lower_result_buffer_i)*unsafe.Sizeof(empty_lower_result_buffer)))
      lower_result_buffer_ptr_value := C.uint8_t(result.Buffer[lower_result_buffer_i])
      *lower_result_buffer_ptr = lower_result_buffer_ptr_value
    }
  }
  lower_result.buffer = lower_result_buffer
  *ret = lower_result
  
}
//export md5_update
func Md5Update(ctx *C.md5hash_context_t, msg *C.md5_list_u8_t) C.int32_t {
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
  lower_result := C.int32_t(result)
  return lower_result
  
}
//export md5_final
func Md5Final(ctx *C.md5hash_context_t, ret *C.md5_list_u8_t) {
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
  result := md5.Final(lift_ctx)
  var lower_result C.md5_list_u8_t
  if len(result) == 0 {
    lower_result.ptr = nil
    lower_result.len = 0
  } else {
    var empty_lower_result C.uint8_t
    lower_result.ptr = (*C.uint8_t)(C.malloc(C.size_t(len(result)) * C.size_t(unsafe.Sizeof(empty_lower_result))))
    lower_result.len = C.size_t(len(result))
    for lower_result_i := range result {
      lower_result_ptr := (*C.uint8_t)(unsafe.Pointer(uintptr(unsafe.Pointer(lower_result.ptr)) +
      uintptr(lower_result_i)*unsafe.Sizeof(empty_lower_result)))
      lower_result_ptr_value := C.uint8_t(result[lower_result_i])
      *lower_result_ptr = lower_result_ptr_value
    }
  }
  *ret = lower_result
  
}
