variable "region" {
  default = "us-east-2"
}

variable "name" {
  default = "ADMIN_ICMP"
}

variable "profile" {
  default = "default"
}

variable "description" {
  default = "Rules for admin ICMP access"
}

variable "environment" {
  default = "production"
}

variable "ingress_rules" {
  default = [
    {
      from_port = "-1"
      to_port   = "-1"
      ingress_description = "Allow ICMP from admin home network"
      protocol = "icmp"
      cidr_blocks = ["87.95.119.160/32"]
    }
  ]
}
