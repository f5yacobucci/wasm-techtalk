package main

/*
#include "runtime/extism-pdk.h"
*/
import "C"
import (
	"encoding/binary"
	"errors"

	"example.com/extismdemo/common"

	pdk "github.com/extism/go-pdk"
)

//export md5_init_
func md5_init_() int32 {
	buf := make([]byte, common.CtxLength)

	md5 := common.New()
	md5.Into(buf)

	pdk.Output(buf)

	return 0
}

func fromInput(b []byte) (*common.Md5Context, []byte, error) {
	rawLen := len(b)

	if rawLen < common.CtxLength {
		return nil, nil, errors.New("input data does not have context")
	} else if b[common.CtxLength] == 0 {
		return nil, nil, errors.New("input data does not have data")
	} else if rawLen != common.CtxLength+1+int(b[common.CtxLength]) {
		return nil, nil, errors.New("input data has invalid length descriptor")
	}

	md5Ctx := common.Md5Context{}
	md5Ctx.From(b)
	dataBegin := common.CtxLength + 1
	dataEnd := common.CtxLength + 1 + b[common.CtxLength]

	return &md5Ctx, b[dataBegin:dataEnd], nil
}

//export md5_update_
func md5_update_() int32 {
	rawInput := pdk.Input()

	md5Ctx, data, err := fromInput(rawInput)
	if err != nil {
		mem := pdk.AllocateString(err.Error())
		defer mem.Free()
		C.extism_error_set(mem.Offset())
		return 1
	}

	size := uint64(len(data))
	used := md5Ctx.Bytes & 0x3f
	md5Ctx.Bytes += size

	if used > 0 {
		free := 64 - used

		if size < free {
			copy(md5Ctx.Buffer[used:], data)
			buf := make([]byte, common.CtxLength)
			md5Ctx.Into(buf)
			pdk.Output(buf)
			return 0
		}

		copy(md5Ctx.Buffer[used:], data)
		data = data[free:]
		size -= free
		md5Body(md5Ctx, md5Ctx.Buffer, 64)
	}

	if size >= 64 {
		s := size & ^(uint64(0x3f))
		data = md5Body(md5Ctx, data, s)
		size &= 0x3f
	}

	copy(md5Ctx.Buffer, data)

	buf := make([]byte, common.CtxLength)
	md5Ctx.Into(buf)
	pdk.Output(buf)

	return 0
}

//export md5_final_
func md5_final_() int32 {
	rawInput := pdk.Input()

	md5Ctx := &common.Md5Context{}
	md5Ctx.From(rawInput)

	used := md5Ctx.Bytes & 0x3f
	tmp := [1 + 63 + 8]byte{0x80}
	pad := (55 - md5Ctx.Bytes) % 64
	binary.LittleEndian.PutUint64(tmp[1+pad:], md5Ctx.Bytes)
	copy(md5Ctx.Buffer[used:], tmp[:1+pad+8])

	md5Ctx.Bytes <<= 3
	md5Ctx.Buffer[56] = byte(md5Ctx.Bytes)
	md5Ctx.Buffer[57] = byte(md5Ctx.Bytes >> 8)
	md5Ctx.Buffer[58] = byte(md5Ctx.Bytes >> 16)
	md5Ctx.Buffer[59] = byte(md5Ctx.Bytes >> 24)
	md5Ctx.Buffer[60] = byte(md5Ctx.Bytes >> 32)
	md5Ctx.Buffer[61] = byte(md5Ctx.Bytes >> 40)
	md5Ctx.Buffer[62] = byte(md5Ctx.Bytes >> 48)
	md5Ctx.Buffer[63] = byte(md5Ctx.Bytes >> 56)

	md5Body(md5Ctx, md5Ctx.Buffer, 64)

	result := make([]byte, 16)
	result[0] = byte(md5Ctx.A)
	result[1] = byte(md5Ctx.A >> 8)
	result[2] = byte(md5Ctx.A >> 16)
	result[3] = byte(md5Ctx.A >> 24)
	result[4] = byte(md5Ctx.B)
	result[5] = byte(md5Ctx.B >> 8)
	result[6] = byte(md5Ctx.B >> 16)
	result[7] = byte(md5Ctx.B >> 24)
	result[8] = byte(md5Ctx.C)
	result[9] = byte(md5Ctx.C >> 8)
	result[10] = byte(md5Ctx.C >> 16)
	result[11] = byte(md5Ctx.C >> 24)
	result[12] = byte(md5Ctx.D)
	result[13] = byte(md5Ctx.D >> 8)
	result[14] = byte(md5Ctx.D >> 16)
	result[15] = byte(md5Ctx.D >> 24)

	pdk.Output(result)

	return 0
}

type md5Func func(uint32, uint32, uint32) uint32

func _F(x uint32, y uint32, z uint32) uint32 {
	return ((z) ^ ((x) & ((y) ^ (z))))
}
func _G(x uint32, y uint32, z uint32) uint32 {
	return ((y) ^ ((z) & ((x) ^ (y))))
}
func _H(x uint32, y uint32, z uint32) uint32 {
	return ((x) ^ (y) ^ (z))
}
func _I(x uint32, y uint32, z uint32) uint32 {
	return ((y) ^ ((x) | ^(z)))
}

func _STEP(f md5Func, a *uint32, b uint32, c uint32, d uint32, x uint32, t uint32, s uint32) {
	*a += f(b, c, d) + x + t
	*a = (((*a) << s) | (((*a) & 0xffffffff) >> (32 - s)))
	*a += b
}

func _SET(p []byte, n int) uint32 {
	return binary.LittleEndian.Uint32(p[n*4:])
}
func _GET(p []byte, n int) uint32 {
	return binary.LittleEndian.Uint32(p[n*4:])
}

func md5Body(ctx *common.Md5Context, data []byte, size uint64) []byte {
	var saved_a, saved_b, saved_c, saved_d uint32

	a := ctx.A
	b := ctx.B
	c := ctx.C
	d := ctx.D

	for ; size != 0; size -= 64 {
		saved_a = a
		saved_b = b
		saved_c = c
		saved_d = d

		/* Round 1 */

		_STEP(_F, &a, b, c, d, _SET(data, 0), 0xd76aa478, 7)
		_STEP(_F, &d, a, b, c, _SET(data, 1), 0xe8c7b756, 12)
		_STEP(_F, &c, d, a, b, _SET(data, 2), 0x242070db, 17)
		_STEP(_F, &b, c, d, a, _SET(data, 3), 0xc1bdceee, 22)
		_STEP(_F, &a, b, c, d, _SET(data, 4), 0xf57c0faf, 7)
		_STEP(_F, &d, a, b, c, _SET(data, 5), 0x4787c62a, 12)
		_STEP(_F, &c, d, a, b, _SET(data, 6), 0xa8304613, 17)
		_STEP(_F, &b, c, d, a, _SET(data, 7), 0xfd469501, 22)
		_STEP(_F, &a, b, c, d, _SET(data, 8), 0x698098d8, 7)
		_STEP(_F, &d, a, b, c, _SET(data, 9), 0x8b44f7af, 12)
		_STEP(_F, &c, d, a, b, _SET(data, 10), 0xffff5bb1, 17)
		_STEP(_F, &b, c, d, a, _SET(data, 11), 0x895cd7be, 22)
		_STEP(_F, &a, b, c, d, _SET(data, 12), 0x6b901122, 7)
		_STEP(_F, &d, a, b, c, _SET(data, 13), 0xfd987193, 12)
		_STEP(_F, &c, d, a, b, _SET(data, 14), 0xa679438e, 17)
		_STEP(_F, &b, c, d, a, _SET(data, 15), 0x49b40821, 22)

		/* Round 2 */

		_STEP(_G, &a, b, c, d, _GET(data, 1), 0xf61e2562, 5)
		_STEP(_G, &d, a, b, c, _GET(data, 6), 0xc040b340, 9)
		_STEP(_G, &c, d, a, b, _GET(data, 11), 0x265e5a51, 14)
		_STEP(_G, &b, c, d, a, _GET(data, 0), 0xe9b6c7aa, 20)
		_STEP(_G, &a, b, c, d, _GET(data, 5), 0xd62f105d, 5)
		_STEP(_G, &d, a, b, c, _GET(data, 10), 0x02441453, 9)
		_STEP(_G, &c, d, a, b, _GET(data, 15), 0xd8a1e681, 14)
		_STEP(_G, &b, c, d, a, _GET(data, 4), 0xe7d3fbc8, 20)
		_STEP(_G, &a, b, c, d, _GET(data, 9), 0x21e1cde6, 5)
		_STEP(_G, &d, a, b, c, _GET(data, 14), 0xc33707d6, 9)
		_STEP(_G, &c, d, a, b, _GET(data, 3), 0xf4d50d87, 14)
		_STEP(_G, &b, c, d, a, _GET(data, 8), 0x455a14ed, 20)
		_STEP(_G, &a, b, c, d, _GET(data, 13), 0xa9e3e905, 5)
		_STEP(_G, &d, a, b, c, _GET(data, 2), 0xfcefa3f8, 9)
		_STEP(_G, &c, d, a, b, _GET(data, 7), 0x676f02d9, 14)
		_STEP(_G, &b, c, d, a, _GET(data, 12), 0x8d2a4c8a, 20)

		/* Round 3 */

		_STEP(_H, &a, b, c, d, _GET(data, 5), 0xfffa3942, 4)
		_STEP(_H, &d, a, b, c, _GET(data, 8), 0x8771f681, 11)
		_STEP(_H, &c, d, a, b, _GET(data, 11), 0x6d9d6122, 16)
		_STEP(_H, &b, c, d, a, _GET(data, 14), 0xfde5380c, 23)
		_STEP(_H, &a, b, c, d, _GET(data, 1), 0xa4beea44, 4)
		_STEP(_H, &d, a, b, c, _GET(data, 4), 0x4bdecfa9, 11)
		_STEP(_H, &c, d, a, b, _GET(data, 7), 0xf6bb4b60, 16)
		_STEP(_H, &b, c, d, a, _GET(data, 10), 0xbebfbc70, 23)
		_STEP(_H, &a, b, c, d, _GET(data, 13), 0x289b7ec6, 4)
		_STEP(_H, &d, a, b, c, _GET(data, 0), 0xeaa127fa, 11)
		_STEP(_H, &c, d, a, b, _GET(data, 3), 0xd4ef3085, 16)
		_STEP(_H, &b, c, d, a, _GET(data, 6), 0x04881d05, 23)
		_STEP(_H, &a, b, c, d, _GET(data, 9), 0xd9d4d039, 4)
		_STEP(_H, &d, a, b, c, _GET(data, 12), 0xe6db99e5, 11)
		_STEP(_H, &c, d, a, b, _GET(data, 15), 0x1fa27cf8, 16)
		_STEP(_H, &b, c, d, a, _GET(data, 2), 0xc4ac5665, 23)

		/* Round 4 */

		_STEP(_I, &a, b, c, d, _GET(data, 0), 0xf4292244, 6)
		_STEP(_I, &d, a, b, c, _GET(data, 7), 0x432aff97, 10)
		_STEP(_I, &c, d, a, b, _GET(data, 14), 0xab9423a7, 15)
		_STEP(_I, &b, c, d, a, _GET(data, 5), 0xfc93a039, 21)
		_STEP(_I, &a, b, c, d, _GET(data, 12), 0x655b59c3, 6)
		_STEP(_I, &d, a, b, c, _GET(data, 3), 0x8f0ccc92, 10)
		_STEP(_I, &c, d, a, b, _GET(data, 10), 0xffeff47d, 15)
		_STEP(_I, &b, c, d, a, _GET(data, 1), 0x85845dd1, 21)
		_STEP(_I, &a, b, c, d, _GET(data, 8), 0x6fa87e4f, 6)
		_STEP(_I, &d, a, b, c, _GET(data, 15), 0xfe2ce6e0, 10)
		_STEP(_I, &c, d, a, b, _GET(data, 6), 0xa3014314, 15)
		_STEP(_I, &b, c, d, a, _GET(data, 13), 0x4e0811a1, 21)
		_STEP(_I, &a, b, c, d, _GET(data, 4), 0xf7537e82, 6)
		_STEP(_I, &d, a, b, c, _GET(data, 11), 0xbd3af235, 10)
		_STEP(_I, &c, d, a, b, _GET(data, 2), 0x2ad7d2bb, 15)
		_STEP(_I, &b, c, d, a, _GET(data, 9), 0xeb86d391, 21)

		a += saved_a
		b += saved_b
		c += saved_c
		d += saved_d

		data = data[64:]
	}

	ctx.A = a
	ctx.B = b
	ctx.C = c
	ctx.D = d

	return data
}

func main() {}
