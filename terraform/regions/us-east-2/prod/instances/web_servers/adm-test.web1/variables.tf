variable "name" {
  default = "adm-test.web1"
}

variable "root_vsize" {
  default = "10"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-01e36b7901e884a10"
}

variable "region" {
  default = "us-east-2"
}

variable "sg_tags" {
  type    = list(string)
  default = ["ADMIN_ICMP", "ADMIN_SSH", "APP_HTTP"]
}

variable "environment" {
  default = "production"
}

variable "subnet" {
  default = "us_prod_app"
}

