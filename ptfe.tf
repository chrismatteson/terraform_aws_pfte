###############################################################
# Queries

# get the default vpc for this account/region
data "aws_vpc" "default_vpc" {
  default = true
}

# get a list of subnets in the default vpc
data "aws_subnet_ids" "default_subnets" {
  vpc_id = "${data.aws_vpc.default_vpc.id}"
}

#################################################

resource "aws_instance" "ptfe" {
  ami                    = "${var.webAmi}"
  instance_type          = "t2.large"
  subnet_id              = "${data.aws_subnet_ids.default_subnets.ids[0]}"
  key_name               = "${var.keyPairName}"
  vpc_security_group_ids = ["${aws_security_group.ptfe_sg.id}"]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = "60"
  }

  tags {
    Name    = "${var.projectName}-ptfe"
    Project = "${var.projectName}"
  }
}

resource "aws_security_group" "ptfe_sg" {
  name   = "${var.projectName}-ptfe-sg"
  vpc_id = "${data.aws_vpc.default_vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "${var.projectName}-sg"
    Project = "${var.projectName}"
  }
}
