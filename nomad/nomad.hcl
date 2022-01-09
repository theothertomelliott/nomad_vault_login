acl {
  enabled = true
}

client {
    cpu_total_compute = 8000
}

vault {
  enabled = true
  address = "http://vault:8200"
  token = "test"
}