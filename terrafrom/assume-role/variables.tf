variable "account_a" {
  type = object({
    id   = string
    name = string
    vpc = object({
      cidr            = string
      private_subnets = list(string)
    })
    azs = list(string)
  })
  description = "アカウントAの設定"
}

variable "account_b" {
  type = object({
    id   = string
    name = string
    vpc = object({
      cidr            = string
      private_subnets = list(string)
    })
    azs = list(string)
  })
  description = "アカウントBの設定"
}

variable "common_prefix" {
  type        = string
  description = "共通のプレフィックス"
}
