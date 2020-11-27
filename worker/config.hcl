disable_mlock = true
listener "tcp" {
    purpose = "proxy"
    tls_disable = true
}

worker {
  # Name attr must be unique across workers
  name = "host-worker-1"
  description = "A default worker created demonstration"
  address = "worker"

  # Workers must be able to reach controllers on :9202
  controllers = [
    "controller",
  ]

  public_addr = "worker"
}

# must be same key as used on controller config
kms "aead" {
    purpose = "worker-auth"
    aead_type = "aes-gcm"
    key = "8fZBjCUfN0TzjEGLQldGY4+iE9AkOvCfjh7+p0GtRBQ="
    key_id = "global_worker-auth"
}