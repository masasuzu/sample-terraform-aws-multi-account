variable "account" {
  type        = string
  description = "アカウント名"
  default     = "account-a"
}

variable "vpc" {
  type = object({
    cidr            = string
    private_subnets = list(string)
  })
  description = "vpc情報"
  default = {
    cidr            = "10.1.0.0/16"
    private_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  }
}

variable "azs" {
  type        = list(string)
  description = "使用するAZ"
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

variable "account_b_id" {
  type        = string
  description = "アカウントBのID"
}
