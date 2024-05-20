variable "remote_state_account_b" {
  type = object({
    bucket = string
    key    = string
    region = string
  })
}
