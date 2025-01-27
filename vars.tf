################################################################
## Common
################################################################
variable "prefix" {
  type        = string
  description = "모든 자원의 prefix 입니다."
}

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

variable "is_enable_nat" {
  type        = bool
  description = "nat gateway 활성화 여부"
  default     = true
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

variable "endpoint_setting" {
  description = "endpoint 설정하기위한 세팅값 입니다"

  default = {
    s3_is_enable           = true
    ecr_is_enable          = true
    sqs_is_enable          = true
    apigateway_is_enable   = true
    codepipeline_is_enable = true
  }
}

variable "public_tags" {
  default = {}
}

variable "private_tags" {
  default = {}
}