package main

/* reference
https://www.geeksforgeeks.org/program-for-nth-fibonacci-number/
*/

import (
	"math"
)

// fibonacci nth element iterative approach
//export iterative_
func fibIterative(index int) int {
	cur := 1
	last := 0
	i := 2

	if 0 > index {
		return 0
	}

	if 0 == index || 1 == index {
		return index
	}

	for ; i <= index; i++ {
		cur, last = cur+last, cur
	}

	return cur
}

// fibonacci nth element basic recursive approach
//export recursive_
func fibRecursive(index int) int {
	if 0 > index {
		return 0
	}

	if 0 == index || 1 == index {
		return index
	}

	r1 := fibRecursive(index - 2)
	r2 := fibRecursive(index - 1)
	return r1 + r2
}

// fibonacci nth element (dynamic programming) cached recursive approach
func _fibCachedRecursive(index int, cache []int) int {
	if 0 == index || 1 == index {
		return index
	}
	if 0 != cache[index] {
		return cache[index]
	}
	cache[index] = _fibCachedRecursive(index-1, cache) + _fibCachedRecursive(index-2, cache)
	return cache[index]
}

//export cached_recursive_
func fibCachedRecursive(index int) int {
	if 0 > index {
		return 0
	}
	cache := make([]int, index+1)
	return _fibCachedRecursive(index, cache)
}

// fibonacci nth element tail recursion approach
func _fibTailRecursive(index int, acc int, last int) int {
	if 0 == index {
		return acc
	}
	return _fibTailRecursive(index-1, acc+last, acc)
}

//export tail_recursive_
func fibTailRecursive(index int) int {
	if 0 > index {
		return 0
	}

	return _fibTailRecursive(index, 0, 1)
}

// fibonacci nth element fast doubling approach
// Returns the (F(n), F(n + 1))
func _fibFastdoubling(index int) (int, int) {
	if 0 == index {
		return 0, 1
	}
	a, b := _fibFastdoubling(index / 2)
	c := a * (b*2 - a)
	d := a*a + b*b
	if index%2 == 0 {
		return c, d
	}
	return d, c + d
}

//export fast_doubling_
func fibFastdoubling(index int) int {
	if 0 > index {
		return 0
	}

	r, _ := _fibFastdoubling(index)
	return r
}

// fibonacci nth element closed form equation approach
//export closed_form_
func fibClosedForm(index int) int {
	if 0 > index {
		return 0
	}

	f := float64(index)
	sq := math.Sqrt(5)

	rootPos := math.Pow(((1 + sq) / 2), f)
	rootNeg := math.Pow(((1 - sq) / 2), f)

	return int((1 / sq) * (rootPos - rootNeg))
	/*
		f := float64(index)
		sq := math.Sqrt(5)

		phi := (1 + sq) / 2
		return int(math.Pow(phi, f) / sq), nil
	*/
}

// fibonacci nth element matrix exponentiation
//export matrix_
func fibMatrix(index int) int {
	if 0 > index {
		return 0
	}

	f := [][]int{[]int{1, 1}, []int{1, 0}}
	if index == 0 {
		return 0
	}
	_fibMatrixPower(f, index-1)
	return f[0][0]
}

func _fibMatrixPower(f [][]int, n int) {
	if n == 0 || n == 1 {
		return
	}
	m := [][]int{[]int{1, 1}, []int{1, 0}}

	_fibMatrixPower(f, n/2)
	_fibMatrixMultiply(f, f)

	if n%2 != 0 {
		_fibMatrixMultiply(f, m)
	}
}

func _fibMatrixMultiply(f [][]int, m [][]int) {
	x := f[0][0]*m[0][0] + f[0][1]*m[1][0]
	y := f[0][0]*m[0][1] + f[0][1]*m[1][1]
	z := f[1][0]*m[0][0] + f[1][1]*m[1][0]
	w := f[1][0]*m[0][1] + f[1][1]*m[1][1]

	f[0][0] = x
	f[0][1] = y
	f[1][0] = z
	f[1][1] = w
}

/*
type fibonacci func(int) int

func runner(f fibonacci, m string) {
	indexes := []int{-10, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 45}
	results := make([]int, len(indexes)-1)

	start := time.Now()
	for i, v := range indexes {
		r, err := f(v)
		if nil != err {
			continue
		}
		results[i-1] = r
	}
	elapsed := time.Since(start)

	fmt.Printf("%s took: %s\n", m, elapsed)

	for i, v := range results {
		fmt.Printf("Index %v - %v\n", indexes[i+1], v)
	}
}

func main() {
	runner(fibIterative, "O[n] iterative")

	runner(fibRecursive, "O[2^n] recursive")

	runner(fibCachedRecursive, "O[n] cached recursive")

	runner(fibTailRecursive, "Recursive tail-call")

	runner(fibFastdoubling, "O[log n] fast doubling")

	runner(fibClosedForm, "O[closed form] fibonacci closed form")

	runner(fibMatrix, "O[n] matrix exponentiation")
}
*/
func main() {}
