module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-dev"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

# resource "aws_eip" "nat" {
#   count = 3

#   vpc = true
# }

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   # The rest of arguments are omitted for brevity

#   enable_nat_gateway  = true
#   single_nat_gateway  = false
#   reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
#   external_nat_ip_ids = "${aws_eip.nat.*.id}"   # <= IPs specified here as input to the module
# }

# database_subnets    = ["10.0.21.0/24", "10.0.22.0/24"]
# elasticache_subnets = ["10.0.31.0/24", "10.0.32.0/24"]
# private_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
# redshift_subnets    = ["10.0.41.0/24", "10.0.42.0/24"]
# intra_subnets       = ["10.0.51.0/24", "10.0.52.0/24", "10.0.53.0/24"]


#   create_database_subnet_group           = true
#   create_database_subnet_route_table     = true
#   create_database_internet_gateway_route = true

#   enable_dns_hostnames = true
#   enable_dns_support   = true

#   # Find the pool RAM shared to your account
# # Info on RAM sharing pools: https://docs.aws.amazon.com/vpc/latest/ipam/share-pool-ipam.html
# data "aws_vpc_ipam_pool" "ipv4_vpc_dev" {
#   filter {
#     name   = "description"
#     values = ["*poolDev*"]
#   }

#   filter {
#     name   = "address-family"
#     values = ["ipv4"]
#   }
# }

# # Preview next CIDR from pool
# data "aws_vpc_ipam_preview_next_cidr" "previewed_cidr" {
#   ipam_pool_id   = data.aws_vpc_ipam_pool.ipv4_vpc_dev.id
#   netmask_length = 24
# }

# data "aws_region" "current" {}

# # Calculate subnet cidrs from previewed IPAM CIDR
# locals {
#   partition       = cidrsubnets(data.aws_vpc_ipam_preview_next_cidr.previewed_cidr.cidr, 2, 2)
#   private_subnets = cidrsubnets(local.partition[0], 2, 2)
#   public_subnets  = cidrsubnets(local.partition[1], 2, 2)
#   azs             = formatlist("${data.aws_region.current.name}%s", ["a", "b"])
# }

# module "vpc_cidr_from_ipam" {
#   source            = "terraform-aws-modules/vpc/aws"
#   name              = "vpc-cidr-from-ipam"
#   ipv4_ipam_pool_id = data.aws_vpc_ipam_pool.ipv4_vpc_dev.id
#   azs               = local.azs
#   cidr              = data.aws_vpc_ipam_preview_next_cidr.previewed_cidr.cidr
#   private_subnets   = local.private_subnets
#   public_subnets    = local.public_subnets
# }
