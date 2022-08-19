storage "raft" {
    path= "./vault/data"
    node_id= "node1"
}

listener {
    address = "127.0.0.1:8200"
    tls_disable= "false"
}

api_addr = "http://localhost:8200"
cluster_addr="https://localhost:8201"
ui = true