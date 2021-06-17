variable "vpc_cidr_block" {
  default = "192.168.130.64/26"
}

variable "region" {
  default = "us-east-2"
}

variable "map_public_ip_on_launch" {
  default = true
}

variable "name" {
  default = "us_prod_app"
}

variable "profile" {
  default = "default"
}

variable "environment" {
  default = "production"
}

variable "availability_zone" {
  default = "us-east-2a"
}

