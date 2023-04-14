const fs = require('fs');

const buf = fs.readFileSync('./math.wasm');
WebAssembly.instantiate(buf).then(wasmModule => {
  const { add, subtract, pow2, powN } = wasmModule.instance.exports;

  const sum = add(5, 6);
  console.log("expecting 11\t--\t" + sum);

  const difference = subtract(11, 5);
  console.log("expecting 6\t--\t" + difference);

  const square = pow2(10);
  console.log("expecting 100\t--\t" + square);

  var exp = powN(2, 0);
  console.log("expecting 1\t--\t" + exp);

  for (i = 1; i <= 16; i <<= 1) {
    exp = powN(2, i);
    console.log("expecting " + 2**i + "\t--\t" + exp);
  }
});
