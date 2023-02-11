provider "aws" {
 region = "ap-south-1"
}


resource "aws_vpc" "my-vpc" {
    cidr_block = var.vpc-cidr-block
} 

resource "aws_subnet" "public-subnet" {
    cidr_block =  var.PubSub-cidr-block
    vpc_id = aws_vpc.my-vpc.id
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = var.PvtSub-cidr-block
    availability_zone = "ap-south-1"
}

resource "aws_internet_gateway" "igw" {
      vpc_id = aws_vpc.my-vpc.id
}
resource "aws_route_table" "route-table1" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    } 
     
resource "aws_route_table_association" "aws-rta" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.route-table1.id
}

resource "aws_security_group" "security-group" {
    vpc_id = aws_vpc.my-vpc.id
    ingress {
        protocol = "tcp"
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        }
}

resource "aws_instance" "public-instance" {
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [aws_security_group.security-group.id]
    instance_type = var.instance-type
    ami = var.ami
    key_name = var.key_pair
    tags = {
        Name = "var.public_instance_name"
    }
}

resource "aws_instance" "private-instance" {
    subnet_id = aws_subnet.private-subnet.id
    vpc_security_group_ids = [aws_security_group.security-group.id]
    ami = var.ami
    instance_type = var.instance-type
    key_name = var.key_pair
    tags = {
        Name = "var.private_instance_name"
    }
}

