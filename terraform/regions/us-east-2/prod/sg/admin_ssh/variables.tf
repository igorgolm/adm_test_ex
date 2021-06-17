variable "region" {
  default = "us-east-2"
}

variable "name" {
  default = "ADMIN_SSH"
}

variable "profile" {
  default = "default"
}

variable "description" {
  default = "Rules for admin SSH access"
}

variable "environment" {
  default = "production"
}

variable "ingress_rules" {
  default = [
    {
      from_port = 22
      to_port   = 22
      ingress_description = "Allow SSH access from admin home network"
      protocol = "tcp"
      cidr_blocks = ["87.95.119.160/32"]
    }
  ]
}
