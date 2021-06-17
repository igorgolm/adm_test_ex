provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_instance" "instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  ebs_optimized               = var.ebs_optimized
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.public_ip
  availability_zone           = var.availability_zone
  disable_api_termination     = var.api_termination
  count                       = var.number
  tags = {
    Name = var.number == 1 ? var.name : format(var.name, count.index + 1)
  }

  volume_tags = {
    Name = var.number == 1 ? var.name : format(var.name, count.index + 1)
  }
  root_block_device {
    volume_size           = var.root_vsize
    delete_on_termination = var.disk_termination
    volume_type           = var.volume_type
  }

  lifecycle {
    ignore_changes = [ami]
  }
}

resource "aws_network_interface" "interface" {
  subnet_id = var.subnet_id
  count     = var.interface_enabled >= 1 ? var.number : 0
  attachment  {
    instance     = element(aws_instance.instance.*.id, count.index)
    device_index = var.net_device_index 
  }
}

resource "aws_eip" "eip" {
  count    = var.eip_enabled >= 1 ? var.number :0
  vpc      = "true"
  instance = element(aws_instance.instance.*.id, count.index)
}
