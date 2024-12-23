use scylla::{CachingSession, SessionBuilder};

const NODES: [&str; 1] = ["127.0.0.1:9042"];
const KEYSPACE: &str = "charybdis";
const CACHE_SIZE: usize = 1000;

pub async fn db_session() -> CachingSession {
    let db_session = SessionBuilder::new()
        .known_nodes(NODES)
        .use_keyspace(KEYSPACE, false)
        .build()
        .await
        .expect("Unable to connect to scylla hosts");
    CachingSession::from(db_session, CACHE_SIZE)
}