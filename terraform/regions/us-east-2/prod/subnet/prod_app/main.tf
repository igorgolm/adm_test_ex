terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../../vpc/terraform.tfstate"
  }
}

module "subnet" {
  source = "../../../../../modules/subnet"

  name                    = var.name
  cidr_block              = var.vpc_cidr_block
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone

  region  = var.region
  profile = var.profile
}

