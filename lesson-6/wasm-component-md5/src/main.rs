use wasmtime::{
    component::{bindgen, Component, Linker},
    Config, Engine, Store,
};
use wasi_common::{
    wasi::{
        command::add_to_linker,
    }, Table, WasiCtx, WasiView,
};
use wasi_cap_std_sync::WasiCtxBuilder;

bindgen!({
    path: "./plugin/wit",
    async: true,
});

struct HostCtx {
    table: Table,
    wasi: WasiCtx,
}

impl WasiView for HostCtx {
    fn table(&self) -> &Table {
        &self.table
    }
    fn table_mut(&mut self) -> &mut Table {
        &mut self.table
    }
    fn ctx(&self) -> &WasiCtx {
        &self.wasi
    }
    fn ctx_mut(&mut self) -> &mut WasiCtx {
        &mut self.wasi
    }
}

#[tokio::main(flavor = "current_thread")]
async fn main() {
    let mut config = Config::new();
    config.wasm_component_model(true);
    config.async_support(true);
    config.wasm_backtrace_details(wasmtime::WasmBacktraceDetails::Enable);
    let engine = Engine::new(&config).unwrap();
    let component = Component::from_file(&engine, "./plugin/md5.component.wasm").unwrap();

    let mut linker = Linker::new(&engine);    
    let _ = add_to_linker(&mut linker);

    let mut table = Table::new();
    let wasi = WasiCtxBuilder::new().build(&mut table).unwrap();
    let mut store = Store::new(&engine, HostCtx { table, wasi });

    let (bindings, _) = Md5::instantiate_async(&mut store, &component, &linker)
        .await
        .unwrap();

    let mut ctx = bindings.md5.call_init(&mut store)
        .await
        .unwrap()
        .unwrap();
    println!("ctx = {:?}", ctx);

    let s = "Jaded zombies acted quaintly but kept driving their oxen forward.";
    println!("len in bytes = {:?}", s.as_bytes().len());

    //for _i in 0..10 {
    ctx = bindings.md5.call_update(&mut store, &mut ctx, s.as_bytes())
        .await
        .unwrap()
        .unwrap();
    println!("ctx = {:?}", ctx);
    //}

    let sum = bindings.md5.call_hash(&mut store, &mut ctx)
        .await
        .unwrap()
        .unwrap();
    println!("sum = {:?}", sum);

    let exp: [u8; 16] = [
        0xb9, 0x5c, 0x30, 0x6f, 0x43, 0x5c, 0x4e, 0xb0,
        0x12, 0xad, 0xc4, 0x11, 0xde, 0x19, 0x1f, 0x91,
    ];
    println!("expected = {:?}", exp);

    for (i, _) in sum.iter().enumerate() {
        assert!(sum[i] == exp[i]);
    }
}
