variable "vpc_cidr" {
  type = string
  description = "The cidr block for the VPC"
}

variable "public_subnet_cidr" {
    type = string
    description = "The cidr block for the public subnet VPC"
}

variable "private_subnet_cidr" {
    type = string
   description = "The cidr block for the private subnet VPC"  
}

variable "availability_zone" {
   type = string
   description = "The availability zone for the subnet"
}

variable "batch_code" {
    type = string
   description = "The batch code for the instance" 
  
}

variable "isPrivateSubnetNeeded" {
  type = bool
  description = "whether a private subnet is needed"
  
}