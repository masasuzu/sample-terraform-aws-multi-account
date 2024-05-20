account_a = {
  id   = "xxxxxxxxxxxx"
  name = "account-a"
  vpc = {
    cidr            = "10.1.0.0/16"
    private_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  }
  azs = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

account_b = {
  id   = "xxxxxxxxxxx"
  name = "account-b"
  vpc = {
    cidr            = "10.2.0.0/16"
    private_subnets = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  }
  azs = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

common_prefix = "prefix"
