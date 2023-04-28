use rand::Rng;
use signal_hook::{
    consts::{SIGINT, SIGTERM},
    iterator::Signals,
};
use std::{
    collections::{HashMap, HashSet},
    process,
    sync::{Arc, Mutex},
    thread,
    time::Duration,
};
use wasmtime::{
    component::{bindgen, Component, Linker},
    Config, Engine, Store,
};

bindgen!({
    path: "./plugin/wit",
});

struct MessageBus {
    channels: Arc<Mutex<HashMap<String, HashSet<String>>>>,
}

impl MessageBus {
    fn subscribers(&mut self, topic: &str) -> Vec<String> {
        let mut v = vec![];
        let channels = self.channels.lock().unwrap();
        if let Some(subs) = channels.get(topic) {
            for sub in subs {
                v.push(sub.clone());
            }
        }
        v
    }
}

impl pubsub::Host for MessageBus {
    fn topics(&mut self) -> wasmtime::Result<Result<Vec<String>, Errno>> {
        let mut v = Vec::new();

        let subs = self.channels.lock().unwrap();
        for (key, _) in subs.iter() {
            v.push(key.clone());
        }
        Ok(Ok(v))
    }

    fn subscribe(&mut self, name: String, topic: String) -> wasmtime::Result<Result<(), Errno>> {
        println!(
            "recv'd subscription request from subscriber {} for topic {}",
            name, topic
        );
        if name.is_empty() {
            println!("no subscriber name provided");
            return Ok(Err(types::Errno::SubscribeNoId));
        }

        if topic.is_empty() {
            println!("no subscription topic provided");
            return Ok(Err(types::Errno::SubscribeNotopic));
        }

        let mut channels = self.channels.lock().unwrap();
        if let Some(set) = channels.get(topic.as_str()) {
            println!("subscription request found topic {}", topic);
            if let Some(_sub) = set.get(name.as_str()) {
                return Ok(Ok(()));
            }
            //XXX need to add more than one subscriber
            //set.insert(name.clone());
        }

        let mut set = HashSet::new();
        set.insert(name.clone());
        channels.insert(topic.clone(), set);

        println!(
            "subscription registered - topic created {} -- subscriber {}",
            topic, name
        );
        Ok(Ok(()))
    }
}

fn main() -> wasmtime::Result<()> {
    let mut rng = rand::thread_rng();
    let test_topics = vec![
        "games.osr.old-school-essentials".to_string(),
        "games.osr.shadowdark".to_string(),
        "games.osr.black-sword-hack".to_string(),
        "games.dnd.5e".to_string(),
        "games.cyberpunk.2020".to_string(),
        "games.cyberpunk.red".to_string(),
        "games.forged.blades-in-the-dark".to_string(),
        "games.forged.scum-and-villainy".to_string(),
    ];

    let mut config = Config::new();
    config.wasm_component_model(true);
    config.wasm_backtrace_details(wasmtime::WasmBacktraceDetails::Enable);
    let engine = Engine::new(&config)?;
    let component = Component::from_file(&engine, "./plugin/pubsub.component.wasm")?;

    let mut linker = Linker::new(&engine);
    pubsub::add_to_linker(&mut linker, |s| s)?;

    let mut store = Store::new(
        &engine,
        MessageBus {
            channels: Arc::new(Mutex::new(HashMap::new())),
        },
    );

    let (bindings, _) = Pubsub::instantiate(&mut store, &component, &linker)?;

    // initialize random topics
    let mut rand_topic: usize = rng.gen();
    rand_topic = rand_topic % test_topics.len();

    let _res = bindings.call_init(
        &mut store,
        "wasm.component.plugin.one",
        test_topics[rand_topic].as_str(),
    )?;

    println!("successfully initialized instance");

    let mut signals = Signals::new(&[SIGINT, SIGTERM])?;
    thread::spawn(move || {
        for sig in signals.forever() {
            println!("recv'd signal {:?}, exiting...", sig);
            process::exit(1);
        }
    });

    loop {
        // mimick clients publishing over loop

        let mut roll: u8 = rng.gen();
        roll = roll % 20;

        {
            use types::{Message, Metadata};

            for topic in test_topics.iter() {
                let subs = store.data_mut().subscribers(&topic);
                if subs.len() != 0 {
                    println!("topic {} has subscriptions", topic);
                }

                for sub in subs {
                    println!("processing on subscriber {}", sub);

                    let maybe_response = bindings.call_process(
                        &mut store,
                        &sub,
                        Message {
                            meta: Metadata { topic: &topic },
                            data: roll,
                        },
                    )?;
                    match maybe_response {
                        Err(_) => println!(
                            "Recv'd error processing message - topic {} -- subscriber {}",
                            topic, sub
                        ),
                        Ok(r) => {
                            println!("Response - status {:?} -- message: {}", r.status, r.data)
                        }
                    }
                }
            }
        }

        let mut wait: u8 = rng.gen();
        wait = wait % 5;
        println!("waiting {:?} seconds...", wait);
        thread::sleep(Duration::from_secs(wait as u64));
    }
}
