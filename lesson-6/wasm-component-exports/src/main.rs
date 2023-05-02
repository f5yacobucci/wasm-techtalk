use wasmtime::{
    component::{bindgen, Component, Linker},
    Config, Engine, Store,
};

bindgen!({
    path: "./plugin/wit",
});

struct State;

fn main() -> wasmtime::Result<()> {
    let mut config = Config::new();
    config.wasm_component_model(true);
    let engine = Engine::new(&config)?;
    let component = Component::from_file(&engine, "./plugin/math.component.wasm")?;

    let linker = Linker::new(&engine);
    let mut store = Store::new(&engine, State {});

    let (bindings, _) = Math::instantiate(&mut store, &component, &linker)?;

    let lhs = 10;
    let rhs = 5;
    let mut answer = bindings.call_add(&mut store, lhs, rhs)?;
    println!(
        "add {:?} and {:?}, expect {:?} - got {:?}",
        lhs,
        rhs,
        lhs + rhs,
        answer
    );
    answer = bindings.call_sub(&mut store, lhs, rhs)?;
    println!(
        "sub {:?} and {:?}, expect {:?} - got {:?}",
        lhs,
        rhs,
        lhs + rhs,
        answer
    );
    answer = bindings.call_square(&mut store, lhs)?;
    println!(
        "square {:?} and {:?}, expect {:?} - got {:?}",
        lhs,
        rhs,
        lhs + rhs,
        answer
    );
    Ok(())
}
