# ${prefix}を差し替える
remote_state_account_a = {
  bucket = "${prefix}-account-a-tfstate"
  key    = "remote-state/account-a/terraform.tfstate"
  region = "ap-northeast-1"
}
