module "vpc1" {
    source = "./modules/IaaC"
    vpc_cidr = "10.0.0.0/16"
    public_subnet_cidr = "10.0.1.0/24"
    private_subnet_cidr = "10.0.2.0/24"
    availability_zone = "us-west-2a"
    batch_code = "tg-Devops-11am"
    isPrivateSubnetNeeded =true
}

module "vpc2" {
    source = "./modules/IaaC"
    vpc_cidr = "192.168.0.0/16"
    public_subnet_cidr = "192.168.1.0/24"
    private_subnet_cidr = "10.0.2.0/24"
    availability_zone = "us-west-2a"
    batch_code = "tg-Devops-12pm"
    isPrivateSubnetNeeded =false
}