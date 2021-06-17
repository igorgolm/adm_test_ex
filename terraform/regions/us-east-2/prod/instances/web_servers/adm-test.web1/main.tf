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
    path = "../../../vpc/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnet" {
  backend = "local"
  config = {
    path = "../../../subnet/prod_app/terraform.tfstate"
  }
}

data "aws_security_group" "sg" {
  count  = length(var.sg_tags)
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  filter {
    name = "tag:Name"
    values = [var.sg_tags[count.index]]
  }
}

module "centos" {
  source = "../../../../../../modules/instance/us-east-2/centos"

  name                   = var.name
  instance_type          = var.instance_type
  ami                    = var.ami
  subnet_id              = data.terraform_remote_state.subnet.outputs.subnet_id_out
  vpc_security_group_ids = data.aws_security_group.sg.*.id
  root_vsize             = var.root_vsize
}
