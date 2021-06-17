variable "region" {
  default = "us-east-2"
}

variable "name" {
  default = "APP_HTTP"
}

variable "profile" {
  default = "default"
}

variable "description" {
  default = "Rules for admin HTTP access"
}

variable "environment" {
  default = "production"
}

variable "ingress_rules" {
  default = [
    {
      from_port = 80
      to_port   = 80
      ingress_description = "HTTP access from admin home"
      protocol = "tcp"
      cidr_blocks = ["87.95.119.160/32"]
    },
    {
      from_port = 443
      to_port   = 443
      ingress_description = "HTTPS access from admin home"
      protocol = "tcp"
      cidr_blocks = ["87.95.119.160/32"]
    },
  ]
}
