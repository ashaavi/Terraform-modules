terraform {
 backend "s3"{
       bucket = "shivayanamaha"
       region = "ap-south-1"
       key = "terraform/remotestate/terraform.tfstate"

       dynamodb_table = "backend"
     } 
}

module "module-vpc" {
    source = "./Terraform/modules/"
    vpc-cidr-block = "10.0.0.0/16"
    PvtSub-cidr-block = "10.0.1.0/24"
    PubSub-cidr-block = "10.0.0.1/24"
    public_instance_name = "priinstance"
    private_instance_name = "pubinstance" 
    key_pair = "newkey"
    ami = "ami-0f8ca728008ff5af4"
    instance-type = "t2.micro"
}
