# Specifies a provider. This doesnt have to be AWS because Terraform can be used for any cloud provider.
# However, Syntax will obviously change depending on which provider you use.

# The default profile is grabbed from your machine info, its recommended that you do not hardcode your account
# for security reasons. If you've used and logged in via the Amazon CLI on your machine, terraform will find 
# and fill in that information for you automatically.

provider "aws" {
    profile = "default" 
    region = "${var.aws_region}"
}

# Specifies whats being created. In this case its a linux EC2 instance.
# It also adds a security group. Notice that the security group is added to the instance despite it being
# defined further down. Terraform automatically figures out the relationship in dependencies and will know
# that it must create the security group first, and then add it to the instance.

resource "aws_instance" "linux2" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    security_groups = ["allow_ssh_http"]
    tags = {
        name = "Linux EC2"
    }
}

# This is the creation of the security group. There are two outbound rules that are being created.

resource "aws_security_group" "ssh_http" {
    name = "allow_ssh_http"
    description = "Allows incoming SSH connection to port 22 and http for port 80."
    
  ingress {
      description = "Allows SSH connections (linux)"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allows Internet traffic connections"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    
  }

}