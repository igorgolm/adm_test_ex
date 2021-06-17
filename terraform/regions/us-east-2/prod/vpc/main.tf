provider "aws" {
  region = var.region
}

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "./terraform.tfstate"
  }
}

module "vpc" {
  source = "../../../../modules/vpc"

  region  = var.region
  profile = var.profile

  name                                  = var.name
  cidr_block                            = var.vpc_cidr_block
  public_subnet_map_public_ip_on_launch = var.public_subnet_map_public_ip_on_launch
}

resource "aws_internet_gateway" "us_adm_prod" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "us_adm_prod"
  }
}

resource "aws_default_route_table" "default_route" {
  default_route_table_id = module.vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_adm_prod.id
  }
}

