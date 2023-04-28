wit_bindgen::generate!("pubsub");

struct PubsubGuest;

impl Pubsub for PubsubGuest {
    fn init(id: String, config: String) -> Result<(), types::Errno> {
        if id.len() == 0 {
            return Err(types::Errno::SubscriberNorecord);
        }

        if config.len() == 0 {
            return Err(types::Errno::SubscriberNoconfig);
        }

        pubsub::subscribe(id.as_str(), config.as_str())?;

        Ok(())
    }

    fn process(_id: String, msg: Message) -> Result<types::Response, types::Errno> {
        if msg.data > 20 || msg.data < 1 {
            return Ok(types::Response {
                status: types::Responsecode::Error,
                data: "".to_string(),
            });
        }

        let s = if msg.data > 12 {
            "It's a hit!!!"
        } else {
            "Missed, you fool!"
        }
        .to_string();

        Ok(types::Response {
            status: types::Responsecode::Processed,
            data: s,
        })
    }
}

export_pubsub!(PubsubGuest);
