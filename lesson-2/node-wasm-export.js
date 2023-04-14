const fs = require('fs');

const buf = fs.readFileSync('./memory-export.wasm');
WebAssembly.instantiate(buf).then(wasmModule => {
  const putByte = wasmModule.instance.exports.putByte;
  const getByte = wasmModule.instance.exports.getByte;

  const memory = wasmModule.instance.exports.memory;
  var dataView = new DataView(memory.buffer);

  for (let i = 0; i < 16; i++) {
    const offset = i*4;
    const putval = i*2;
    putByte(offset, putval);
    const gotval = getByte(offset);

    const exportval = dataView.getUint32(offset, true);

    console.log("put byte " + putval + " at offset " + offset);
    console.log("got byte " + gotval + " at offset " + offset);
    console.log("read mem " + exportval + " at offset " + offset);

    dataView.setUint32(offset, exportval*2, true)

    const setval = getByte(offset)
    console.log("set mem  " + setval + " at offset " + offset + "\n");
  }
});
