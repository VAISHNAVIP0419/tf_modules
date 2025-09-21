# Terraform AWS Modules Practice

## Task
Practice creating Terraform modules for different AWS resources so that each resource is reusable, isolated, and easy to manage.  

## Objective
The goal of this task is to deploy a basic AWS infrastructure using Terraform, ensuring modularity and reusability. The infrastructure includes:

- **VPC** with public subnets and an Internet Gateway  
- **Security Group**  
- **Four EC2 instances**  
- **EBS volume and snapshot**  
- **S3 bucket**  

All Terraform code for this task is stored in the GitHub repository:  
[https://github.com/VAISHNAVIP0419/tf_modules.git](https://github.com/VAISHNAVIP0419/tf_modules.git)  

---

## Terraform Modules

1. **EC2 Module**  
   - Launches EC2 instances with key pairs.  
   - Associates instances with subnets and security groups.  

2. **VPC Module**  
   - Creates a VPC, public subnets, Internet Gateway, and route tables.  

3. **EBS Snapshot Module**  
   - Creates EBS volumes and snapshots for backup.  

4. **S3 Module**  
   - Creates an S3 bucket with versioning enabled and ownership enforced.  

---
