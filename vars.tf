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
## public subnet
################################################################
variable "public_subnets" {
  type        = map(string)
  description = "key : a or b, value : cidr_block"
}

################################################################
## private subnet
################################################################
variable "private_subnets" {
  type        = map(string)
  description = "key : a or b, value : cidr_block"
}

