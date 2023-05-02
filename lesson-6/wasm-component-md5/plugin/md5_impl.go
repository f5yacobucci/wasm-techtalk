package main

import (
	"encoding/binary"

	"example.com/md5component/md5"
)

const (
	//CtxLength = 88

	//bytesOffset  = 0
	//aOffset      = 8
	//bOffset      = 12
	//cOffset      = 16
	//dOffset      = 20
	//bufferOffset = 24
	//len32        = 4
	//len64        = 8
	lenBuf    = 64
	initBytes = 0
	initA     = 0x67452301
	initB     = 0xefcdab89
	initC     = 0x98badcfe
	initD     = 0x10325476
)

type md5Impl struct {
}

func init() {
	impl := md5Impl{}
	md5.SetMd5(impl)
}

func (m md5Impl) Init() md5.Result[md5.Md5Context, md5.Md5Errno] {
	ctx := md5.Md5Context{
		Bytes:  initBytes,
		A:      initA,
		B:      initB,
		C:      initC,
		D:      initD,
		Buffer: make([]uint8, lenBuf),
	}

	return md5.Result[md5.Md5Context, md5.Md5Errno]{
		Kind: md5.Ok,
		Val: ctx,
	}
}

func (m md5Impl) Update(ctx md5.Md5Context, msg []byte) md5.Result[md5.Md5Context, md5.Md5Errno] {
	size := uint64(len(msg))
	used := ctx.Bytes & 0x3f
	ctx.Bytes += size

	if used > 0 {
		free := lenBuf - used

		if size < free {
			copy(ctx.Buffer[used:], msg)
			return md5.Result[md5.Md5Context, md5.Md5Errno]{
				Kind: md5.Ok,
				Val: ctx,
			}
		}

		copy(ctx.Buffer[used:], msg)
		msg = msg[free:]
		size -= free
		md5Body(&ctx, ctx.Buffer, lenBuf)
	}

	if size >= lenBuf {
		s := size & ^(uint64(0x3f))
		msg = md5Body(&ctx, msg, s)
		size &= 0x3f
	}

	copy(ctx.Buffer, msg)

	return md5.Result[md5.Md5Context, md5.Md5Errno]{
		Kind: md5.Ok,
		Val: ctx,
	}
}

func (m md5Impl) Hash(ctx md5.Md5Context) md5.Result[[]uint8, md5.Md5Errno] {
	used := ctx.Bytes & 0x3f
	tmp := [1 + 63 + 8]byte{0x80}
	pad := (55 - ctx.Bytes) % lenBuf
	binary.LittleEndian.PutUint64(tmp[1+pad:], ctx.Bytes)
	copy(ctx.Buffer[used:], tmp[:1+pad+8])

	ctx.Bytes <<= 3
	ctx.Buffer[56] = byte(ctx.Bytes)
	ctx.Buffer[57] = byte(ctx.Bytes >> 8)
	ctx.Buffer[58] = byte(ctx.Bytes >> 16)
	ctx.Buffer[59] = byte(ctx.Bytes >> 24)
	ctx.Buffer[60] = byte(ctx.Bytes >> 32)
	ctx.Buffer[61] = byte(ctx.Bytes >> 40)
	ctx.Buffer[62] = byte(ctx.Bytes >> 48)
	ctx.Buffer[63] = byte(ctx.Bytes >> 56)

	md5Body(&ctx, ctx.Buffer, lenBuf)

	result := make([]byte, 16)
	result[0] = byte(ctx.A)
	result[1] = byte(ctx.A >> 8)
	result[2] = byte(ctx.A >> 16)
	result[3] = byte(ctx.A >> 24)
	result[4] = byte(ctx.B)
	result[5] = byte(ctx.B >> 8)
	result[6] = byte(ctx.B >> 16)
	result[7] = byte(ctx.B >> 24)
	result[8] = byte(ctx.C)
	result[9] = byte(ctx.C >> 8)
	result[10] = byte(ctx.C >> 16)
	result[11] = byte(ctx.C >> 24)
	result[12] = byte(ctx.D)
	result[13] = byte(ctx.D >> 8)
	result[14] = byte(ctx.D >> 16)
	result[15] = byte(ctx.D >> 24)

	return md5.Result[[]uint8, md5.Md5Errno]{
		Kind: md5.Ok,
		Val: result,
	}
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

func md5Body(ctx *md5.Md5Context, data []byte, size uint64) []byte {
	var saved_a, saved_b, saved_c, saved_d uint32

	a := ctx.A
	b := ctx.B
	c := ctx.C
	d := ctx.D

	for ; size != 0; size -= lenBuf {
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

		data = data[lenBuf:]
	}

	ctx.A = a
	ctx.B = b
	ctx.C = c
	ctx.D = d

	return data
}

func main() {
}
