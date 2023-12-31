################################################################
## Common
################################################################
variable "vpc_name" {
  type        = string
  description = "vpc name"
}

variable "vpc_region" {
  type        = string
  description = "region"

  default = "ap-northeast-2"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr block"
  default     = "10.0.0.0/16"
}

################################################################
## webserver subnet
################################################################
variable "webserver_subnets" {
  type        = map(string)
  description = "key : a or b, value : cidr_block"
}

################################################################
## was subnet
################################################################
variable "was_subnets" {
  type        = map(string)
  description = "key : a or b, value : cidr_block"
}

################################################################
## db subnet
################################################################
variable "db_subnets" {
  type        = map(string)
  description = "key : a or b, value : cidr_block"
}
