Deployed a 2-tier architected application (web and database tiers) in AWS by using Terrafrom IaC. Consider high availability (HA), fault tolerance, scalability, and security.

Create an IAM user with minimum permission to execute the Terraform IaC into AWS. 
Generate the Access key and Secret access key key of that user.
Configure that user with AWS CLI in your system.

IAM Policy to create a user refer to IAMUserPolicy file.

For this exercise, we have created 7 terraform files.

1. provider.tf: it is the Config file. It specifies  the provider and the region.
2. network_resources.tf: File contains the Network infrastructure of all the resources to be used. It contains the IaC of VPC, Subnets, IG, Route Table, LB, and Target balancer.
3. iampolicy.tf: The file contains the IAM policy to access RDS from EC2 instance.
4. iamrole.tf: The file creates the IAM role to access RDS from EC2 instance.
5. ec2-resources.tf: The files create two ec2 instances.
6. db-resources.tf: The file creates an RDS MySql DB instance.
7. security_resources.tf: Creates the associated security group that needs to be used by resources.
