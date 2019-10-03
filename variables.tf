variable "aws_region" {
  description = "Region for the Terraform VPC"
  default = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "172.12.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "172.12.1.0/24"
}

#variable "private_subnet_cidr" {
#  description = "CIDR for the private subnet"
#  default = "172.12.2.0/24"
#}

variable "ami" {
  description = "Jenkin_Terraform AMI"
  default = "ami-033686d6d9fd34167"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "public_key"
}
