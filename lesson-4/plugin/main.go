package main

import (
	gomd5 "crypto/md5"
	"encoding/binary"
	"fmt"
	"io"
	"math/bits"

	"example.com/extismdemo/common"
)

func md5_update_(md5Ctx *common.Md5Context, data []byte) int32 {
	size := uint64(len(data))
	used := md5Ctx.Bytes & 0x3f
	md5Ctx.Bytes += size

	if used > 0 {
		free := 64 - used

		if size < free {
			copy(md5Ctx.Buffer[used:], data)
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

	return 0
}

func md5_final_(md5Ctx *common.Md5Context) []byte {
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

	return result
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

		// load input block
		x0 := binary.LittleEndian.Uint32(data[4*0x0:])
		x1 := binary.LittleEndian.Uint32(data[4*0x1:])
		x2 := binary.LittleEndian.Uint32(data[4*0x2:])
		x3 := binary.LittleEndian.Uint32(data[4*0x3:])
		x4 := binary.LittleEndian.Uint32(data[4*0x4:])
		x5 := binary.LittleEndian.Uint32(data[4*0x5:])
		x6 := binary.LittleEndian.Uint32(data[4*0x6:])
		x7 := binary.LittleEndian.Uint32(data[4*0x7:])
		x8 := binary.LittleEndian.Uint32(data[4*0x8:])
		x9 := binary.LittleEndian.Uint32(data[4*0x9:])
		xa := binary.LittleEndian.Uint32(data[4*0xa:])
		xb := binary.LittleEndian.Uint32(data[4*0xb:])
		xc := binary.LittleEndian.Uint32(data[4*0xc:])
		xd := binary.LittleEndian.Uint32(data[4*0xd:])
		xe := binary.LittleEndian.Uint32(data[4*0xe:])
		xf := binary.LittleEndian.Uint32(data[4*0xf:])

		// round 1
		a = b + bits.RotateLeft32((((c^d)&b)^d)+a+x0+0xd76aa478, 7)
		d = a + bits.RotateLeft32((((b^c)&a)^c)+d+x1+0xe8c7b756, 12)
		c = d + bits.RotateLeft32((((a^b)&d)^b)+c+x2+0x242070db, 17)
		b = c + bits.RotateLeft32((((d^a)&c)^a)+b+x3+0xc1bdceee, 22)
		a = b + bits.RotateLeft32((((c^d)&b)^d)+a+x4+0xf57c0faf, 7)
		d = a + bits.RotateLeft32((((b^c)&a)^c)+d+x5+0x4787c62a, 12)
		c = d + bits.RotateLeft32((((a^b)&d)^b)+c+x6+0xa8304613, 17)
		b = c + bits.RotateLeft32((((d^a)&c)^a)+b+x7+0xfd469501, 22)
		a = b + bits.RotateLeft32((((c^d)&b)^d)+a+x8+0x698098d8, 7)
		d = a + bits.RotateLeft32((((b^c)&a)^c)+d+x9+0x8b44f7af, 12)
		c = d + bits.RotateLeft32((((a^b)&d)^b)+c+xa+0xffff5bb1, 17)
		b = c + bits.RotateLeft32((((d^a)&c)^a)+b+xb+0x895cd7be, 22)
		a = b + bits.RotateLeft32((((c^d)&b)^d)+a+xc+0x6b901122, 7)
		d = a + bits.RotateLeft32((((b^c)&a)^c)+d+xd+0xfd987193, 12)
		c = d + bits.RotateLeft32((((a^b)&d)^b)+c+xe+0xa679438e, 17)
		b = c + bits.RotateLeft32((((d^a)&c)^a)+b+xf+0x49b40821, 22)

		// round 2
		a = b + bits.RotateLeft32((((b^c)&d)^c)+a+x1+0xf61e2562, 5)
		d = a + bits.RotateLeft32((((a^b)&c)^b)+d+x6+0xc040b340, 9)
		c = d + bits.RotateLeft32((((d^a)&b)^a)+c+xb+0x265e5a51, 14)
		b = c + bits.RotateLeft32((((c^d)&a)^d)+b+x0+0xe9b6c7aa, 20)
		a = b + bits.RotateLeft32((((b^c)&d)^c)+a+x5+0xd62f105d, 5)
		d = a + bits.RotateLeft32((((a^b)&c)^b)+d+xa+0x02441453, 9)
		c = d + bits.RotateLeft32((((d^a)&b)^a)+c+xf+0xd8a1e681, 14)
		b = c + bits.RotateLeft32((((c^d)&a)^d)+b+x4+0xe7d3fbc8, 20)
		a = b + bits.RotateLeft32((((b^c)&d)^c)+a+x9+0x21e1cde6, 5)
		d = a + bits.RotateLeft32((((a^b)&c)^b)+d+xe+0xc33707d6, 9)
		c = d + bits.RotateLeft32((((d^a)&b)^a)+c+x3+0xf4d50d87, 14)
		b = c + bits.RotateLeft32((((c^d)&a)^d)+b+x8+0x455a14ed, 20)
		a = b + bits.RotateLeft32((((b^c)&d)^c)+a+xd+0xa9e3e905, 5)
		d = a + bits.RotateLeft32((((a^b)&c)^b)+d+x2+0xfcefa3f8, 9)
		c = d + bits.RotateLeft32((((d^a)&b)^a)+c+x7+0x676f02d9, 14)
		b = c + bits.RotateLeft32((((c^d)&a)^d)+b+xc+0x8d2a4c8a, 20)

		// round 3
		a = b + bits.RotateLeft32((b^c^d)+a+x5+0xfffa3942, 4)
		d = a + bits.RotateLeft32((a^b^c)+d+x8+0x8771f681, 11)
		c = d + bits.RotateLeft32((d^a^b)+c+xb+0x6d9d6122, 16)
		b = c + bits.RotateLeft32((c^d^a)+b+xe+0xfde5380c, 23)
		a = b + bits.RotateLeft32((b^c^d)+a+x1+0xa4beea44, 4)
		d = a + bits.RotateLeft32((a^b^c)+d+x4+0x4bdecfa9, 11)
		c = d + bits.RotateLeft32((d^a^b)+c+x7+0xf6bb4b60, 16)
		b = c + bits.RotateLeft32((c^d^a)+b+xa+0xbebfbc70, 23)
		a = b + bits.RotateLeft32((b^c^d)+a+xd+0x289b7ec6, 4)
		d = a + bits.RotateLeft32((a^b^c)+d+x0+0xeaa127fa, 11)
		c = d + bits.RotateLeft32((d^a^b)+c+x3+0xd4ef3085, 16)
		b = c + bits.RotateLeft32((c^d^a)+b+x6+0x04881d05, 23)
		a = b + bits.RotateLeft32((b^c^d)+a+x9+0xd9d4d039, 4)
		d = a + bits.RotateLeft32((a^b^c)+d+xc+0xe6db99e5, 11)
		c = d + bits.RotateLeft32((d^a^b)+c+xf+0x1fa27cf8, 16)
		b = c + bits.RotateLeft32((c^d^a)+b+x2+0xc4ac5665, 23)

		// round 4
		a = b + bits.RotateLeft32((c^(b|^d))+a+x0+0xf4292244, 6)
		d = a + bits.RotateLeft32((b^(a|^c))+d+x7+0x432aff97, 10)
		c = d + bits.RotateLeft32((a^(d|^b))+c+xe+0xab9423a7, 15)
		b = c + bits.RotateLeft32((d^(c|^a))+b+x5+0xfc93a039, 21)
		a = b + bits.RotateLeft32((c^(b|^d))+a+xc+0x655b59c3, 6)
		d = a + bits.RotateLeft32((b^(a|^c))+d+x3+0x8f0ccc92, 10)
		c = d + bits.RotateLeft32((a^(d|^b))+c+xa+0xffeff47d, 15)
		b = c + bits.RotateLeft32((d^(c|^a))+b+x1+0x85845dd1, 21)
		a = b + bits.RotateLeft32((c^(b|^d))+a+x8+0x6fa87e4f, 6)
		d = a + bits.RotateLeft32((b^(a|^c))+d+xf+0xfe2ce6e0, 10)
		c = d + bits.RotateLeft32((a^(d|^b))+c+x6+0xa3014314, 15)
		b = c + bits.RotateLeft32((d^(c|^a))+b+xd+0x4e0811a1, 21)
		a = b + bits.RotateLeft32((c^(b|^d))+a+x4+0xf7537e82, 6)
		d = a + bits.RotateLeft32((b^(a|^c))+d+xb+0xbd3af235, 10)
		c = d + bits.RotateLeft32((a^(d|^b))+c+x2+0x2ad7d2bb, 15)
		b = c + bits.RotateLeft32((d^(c|^a))+b+x9+0xeb86d391, 21)

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

func main() {
	input_1 := "Jaded zombies acted quaintly but kept driving their oxen forward."

	input_2 := "Tiny hummingbirds sip nectar, hover with precision, and gracefully fly, displaying their agility and beauty."

	md5 := common.New()
	//fmt.Printf("BEFORE\n%v\n", md5)
	//md5.Dump()

	_ = md5_update_(md5, []byte(input_1))

	//fmt.Printf("AFTER\n%v\n", md5)
	//md5.Dump()

	result := md5_final_(md5)

	fmt.Println("Input 1")
	fmt.Printf("	Input bytes: %v\n", []byte(input_1))
	input_1_len := len([]byte(input_1))
	fmt.Printf("	Length:      %d\n", input_1_len)
	h := gomd5.New()
	io.WriteString(h, input_1)
	fmt.Printf("GO      %x\n", h.Sum(nil))
	fmt.Printf("My MD5  %x\n", result)

	fmt.Println("\n\n+ Input 2")
	fmt.Printf("	Input bytes: %v%v%v\n", []byte(input_1), []byte(" "), []byte(input_2))
	input_2_len := len([]byte(input_1)) + len([]byte(" ")) + len([]byte(input_2))
	fmt.Printf("	Length:      %d\n", input_2_len)
	h = gomd5.New()
	io.WriteString(h, input_1)
	io.WriteString(h, " ")
	io.WriteString(h, input_2)
	fmt.Printf("GO      %x\n", h.Sum(nil))

	md5 = common.New()
	_ = md5_update_(md5, []byte(input_1))
	_ = md5_update_(md5, []byte(" "))
	_ = md5_update_(md5, []byte(input_2))
	result = md5_final_(md5)
	fmt.Printf("My MD5  %x\n", result)

	return
}
