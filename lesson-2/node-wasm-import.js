const fs = require('fs');

printWasm = (offset, length) => {
  const bytes = new Uint8Array(memory.buffer, offset, length);
  const str = new TextDecoder("utf-8").decode(bytes);
  console.log(str);
}

const memory = new WebAssembly.Memory(
  {
    initial: 1
  }
);

const importObject = {
  console: {
    log: printWasm
  },
  js: {
    mem: memory
  },
};

const buf = fs.readFileSync('./memory-import.wasm');
WebAssembly.instantiate(buf, importObject).then(wasmModule => {
  const { writeMsgFromWasm } = wasmModule.instance.exports;

  writeMsgFromWasm();
});
