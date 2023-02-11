variable "instance-type" {
  default = "t2.micro"
}
variable "ami" {
  default = "ami-0f8ca728008ff5af4"
}

variable "key_pair" {
  default = "newkey"
}
variable "private_instance_name" {
  default = "priinstance"
}
variable "public_instance_name" {
  default = "pubinstance"
}

variable "vpc-cidr-block" {
  default = "10.0.0.0/16"
}
variable "PvtSub-cidr-block" {
  default = "10.0.2.0/24"
}
variable "PubSub-cidr-block" {
  default = "10.0.1.0/24"
}
