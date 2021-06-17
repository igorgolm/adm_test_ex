variable "region" {
  default = "us-east-2"
}

variable "name" {
  default = "DB_MYSQL"
}

variable "profile" {
  default = "default"
}

variable "description" {
  default = "Rules for MySQL access from app subnet"
}

variable "cidrs" {
  type    = list(string)
  default = ["192.168.130.64/26"]
}

variable "environment" {
  default = "production"
}

variable "ingress_rules" {
  default = [
    {
      from_port = 3306
      to_port   = 3306
      ingress_description = "Allow MySQL access (3306) from app subnet"
      protocol = "tcp"
      cidr_blocks = ["192.168.130.64/26"]
    }
  ]
}
