provider "aws" {
  profile = "leedonggyu"
}

module "default-3-tier" {
  source = "../../"

  vpc_name   = "poc"
  vpc_region = "ap-northeast-2"
  vpc_cidr   = "10.0.0.0/16"

  public_subnets = {
    "a" : "10.0.1.0/24"
    "b" : "10.0.2.0/24"
  }

  private_subnets = {
    "a" : "10.0.100.0/24"
    "b" : "10.0.101.0/24"
  }
}

output "v" {
  value = module.default-3-tier
}
