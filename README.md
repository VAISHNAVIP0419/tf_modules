Simple Terraform modular layout.

How to use:
1. Edit variables.tf to toggle modules (enable_ec2_1, enable_ebs_snapshot, etc).
2. Or comment module blocks in main.tf to destroy/recreate a single module's resources.
3. Run:
   terraform init
   terraform plan
   terraform apply

Notes:
- Default AWS region: ap-south-1.
- EC2 module supports create_key = true (create aws_key_pair from local public key) or false (use existing_key_name).
- EBS snapshot module creates a 1 GiB volume and snapshot (cheap).
