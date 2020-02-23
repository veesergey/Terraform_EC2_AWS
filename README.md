# Terraform_EC2_AWS
Create an EC2 Linux Instance with AWS

Example of how to create an EC2 instance using Terraform in AWS. You need an account with AWS for this to work, along with
Terraform installed.

What this does is create a Linux EC2 instance in the US-EAST-1 region. The AMI used is Amazon Linux 2, which comes with a free tier so people new to AWS can get their feet wet at free to low costs. 

Also created alongside and automatically added to the EC2 instance is a security group that allows SSH connection to the instance as well as web traffic. The reason for this security group is because I am using this instance to host a web app I created called YelpCamp.
