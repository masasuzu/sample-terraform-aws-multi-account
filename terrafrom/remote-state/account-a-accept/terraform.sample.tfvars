# ${prefix}を差し替える
remote_state_account_b = {
  bucket = "${prefix}-account-b-tfstate"
  key    = "remote-state/account-b/terraform.tfstate"
  region = "ap-northeast-1"
}
