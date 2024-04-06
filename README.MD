# This is VPC module

# high availability by creating Aailabity zones us-east-1a & us-east-1b
* Internet gatway
* 2 public subnets
* 2 private subnets
* 2 database subnets

* 1 route for IGW
* 1 public route table
* public route table association
* 1 private route table
* private route table association
* 1 database route table
* database route table association

# Variables

1. cidr_block # this is mandatory cidr for VPC
2. common_tags # optional 
3. vpc_tags # optional 
4. enable_dns_support = true
5. enable_dns_hostnames = true 
6. public_cidr # List of public subnet
7. public_subnet_names  # List of public subnets names
8. azs # List of availability zones
9. igw_tags # this is optional

10. private_cidr # List of private subnet
11. private_subnet_names  # List of private subnets names
11. database_cidr # List of database subnet
12. database_subnet_names  # List of database subnets names
13. public_rt_tags # This optional -> public route table tags 

14. igw_r_cidr # This is internet gateway route cidr.
15. private_rt_tags # This is optional route table tags 
16. database_rt_tags # # This is optional route table tags 




