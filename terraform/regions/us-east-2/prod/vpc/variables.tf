variable "vpc_cidr_block" {
  default = "192.168.130.0/24"
}

variable "public_subnet_map_public_ip_on_launch" {
  default = true
}

variable "name" {
  default = "us_adm_prod"
}

variable "region" {
  default = "us-east-2"
}

variable "profile" {
  default = "default"
}

