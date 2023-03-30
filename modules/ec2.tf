# # resource "aws_ec2_availability_zone_group" "az_ec2_dev" {
# #   group_name    = "az_ec2_dev"
# #   opt_in_status = "opted-in"
# # }

# resource "aws_ec2_capacity_reservation" "ec2Dev" {
#   instance_type     = "t2.micro"
#   instance_platform = "Linux/UNIX"
#   availability_zone = "eu-west-2a"
#   instance_count    = 1
# }

# # Create a new host with instance type of c5.18xlarge with Auto Placement
# # and Host Recovery enabled.
# resource "aws_ec2_host" "test" {
#   instance_type     = "c5.18xlarge"
#   availability_zone = "eu-west-2a"
#   host_recovery     = "on"
#   auto_placement    = "on"
# }

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_instance" "instance_dev" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = "t3.micro"

#   tags = {
#     Name = "HelloWorld"
#   }
# }

# resource "aws_ec2_instance_state" "instance_state" {
#   instance_id = aws_instance.instance_dev.id
#   state       = "stopped"
# }
