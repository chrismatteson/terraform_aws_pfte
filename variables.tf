# variables.tf – commonly configured parameters for our environment (i.e. projectName)

#################################################
# AWS Region
variable "region" {
  default = "us-east-2"
}

variable "availZones" {
  type    = "list"
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

#################################################
# Project naming

variable "projectName" {
  default = "myproject"
}

###############################################################
# Network Vars

variable "vpcCidr" {
  default = "10.0.0.0/16"
}

variable "publicCidrs" {
  type    = "list"
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
}

variable "appCidrs" {
  type    = "list"
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

variable "databaseCidrs" {
  type    = "list"
  default = ["10.0.20.0/24", "10.0.21.0/24", "10.0.22.0/24"]
}

variable "keyPairName" {}

variable "webAmi" {
  default = "ami-5e8bb23b" # AWS 2 for us-east-2
}
