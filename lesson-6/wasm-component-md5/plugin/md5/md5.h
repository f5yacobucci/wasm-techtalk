// Generated by `wit-bindgen` 0.6.0. DO NOT EDIT!
#ifndef __BINDINGS_MD5_H
#define __BINDINGS_MD5_H
#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

typedef uint8_t md5hash_errno_t;

#define MD5HASH_ERRNO_ERROR 0

typedef struct {
  uint8_t *ptr;
  size_t len;
} md5_list_u8_t;

typedef struct {
  uint64_t bytes;
  uint32_t a;
  uint32_t b;
  uint32_t c;
  uint32_t d;
  md5_list_u8_t buffer;
} md5hash_context_t;

typedef struct {
  bool is_err;
  union {
    md5hash_context_t ok;
    md5hash_errno_t err;
  } val;
} md5_result_context_errno_t;

typedef struct {
  bool is_err;
  union {
    md5_list_u8_t ok;
    md5hash_errno_t err;
  } val;
} md5_result_list_u8_errno_t;

// Exported Functions from `md5`
void md5_init(md5_result_context_errno_t *ret);
void md5_update(md5hash_context_t *ctx, md5_list_u8_t *msg, md5_result_context_errno_t *ret);
void md5_hash(md5hash_context_t *ctx, md5_result_list_u8_errno_t *ret);

// Helper Functions

void md5_list_u8_free(md5_list_u8_t *ptr);
void md5hash_context_free(md5hash_context_t *ptr);
void md5_result_context_errno_free(md5_result_context_errno_t *ptr);
void md5_result_list_u8_errno_free(md5_result_list_u8_errno_t *ptr);

#ifdef __cplusplus
}
#endif
#endif
