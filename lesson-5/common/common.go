package common

import (
	"encoding/binary"
	"errors"
	"fmt"
)

const (
	CtxLength = 88

	bytesOffset  = 0
	aOffset      = 8
	bOffset      = 12
	cOffset      = 16
	dOffset      = 20
	bufferOffset = 24
	len32        = 4
	len64        = 8
	lenBuf       = 64
	initBytes    = 0
	initA        = 0x67452301
	initB        = 0xefcdab89
	initC        = 0x98badcfe
	initD        = 0x10325476
)

type Md5Context struct {
	Bytes  uint64
	A      uint32
	B      uint32
	C      uint32
	D      uint32
	Buffer []byte
}

func New() *Md5Context {
	return &Md5Context{
		Bytes:  initBytes,
		A:      initA,
		B:      initB,
		C:      initC,
		D:      initD,
		Buffer: make([]byte, lenBuf),
	}
}

func (ctx *Md5Context) From(b []byte) error {
	if len(b) < CtxLength {
		return errors.New("md5 context must be at least 88 bytes")
	}
	ctx.Bytes = binary.LittleEndian.Uint64(b[bytesOffset : bytesOffset+len64])
	ctx.A = binary.LittleEndian.Uint32(b[aOffset : aOffset+len32])
	ctx.B = binary.LittleEndian.Uint32(b[bOffset : bOffset+len32])
	ctx.C = binary.LittleEndian.Uint32(b[cOffset : cOffset+len32])
	ctx.D = binary.LittleEndian.Uint32(b[dOffset : dOffset+len32])

	ctx.Buffer = make([]byte, lenBuf)
	copy(ctx.Buffer, b[bufferOffset:bufferOffset+lenBuf])

	return nil
}

func (ctx *Md5Context) Into(b []byte) error {
	if len(b) < CtxLength {
		return errors.New("md5 context must be at least 88 bytes")
	}

	binary.LittleEndian.PutUint64(b[bytesOffset:bytesOffset+len64], ctx.Bytes)
	binary.LittleEndian.PutUint32(b[aOffset:aOffset+len32], ctx.A)
	binary.LittleEndian.PutUint32(b[bOffset:bOffset+len32], ctx.B)
	binary.LittleEndian.PutUint32(b[cOffset:cOffset+len32], ctx.C)
	binary.LittleEndian.PutUint32(b[dOffset:dOffset+len32], ctx.D)

	copy(b[bufferOffset:], ctx.Buffer)

	return nil
}

func (ctx *Md5Context) Dump() {
	fmt.Printf("context bytes = %x\n", ctx.Bytes)
	fmt.Printf("context a     = %x\n", ctx.A)
	fmt.Printf("context b     = %x\n", ctx.B)
	fmt.Printf("context c     = %x\n", ctx.C)
	fmt.Printf("context d     = %x\n", ctx.D)
	fmt.Printf("context buf   = %v\n", ctx.Buffer)
}
