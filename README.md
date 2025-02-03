# Two-Tier Architecture with ALB using Terraform

## Overview

This repository contains Terraform configurations to deploy a two-tier architecture on AWS, utilizing an Application Load Balancer (ALB) to distribute traffic between two EC2 instances in different subnets.

## Architecture

- **VPC**: A Virtual Private Cloud (VPC) with a CIDR block of `10.1.0.0/16`.
- **Subnets**: Two public subnets (`10.1.1.0/24` and `10.1.2.0/24`) in different Availability Zones.
- **Internet Gateway**: Provides internet access to resources in the VPC.
- **Route Table**: A public route table that routes all internet-bound traffic via the Internet Gateway.
- **Security Groups**:
  - ALB Security Group: Allows HTTP (80) traffic from anywhere.
  - EC2 Security Group: Allows HTTP (80) and SSH (22) traffic from anywhere.
- **Application Load Balancer (ALB)**:
  - Public-facing ALB distributes HTTP traffic to EC2 instances.
- **Target Group**:
  - EC2 instances are registered to an ALB Target Group.
- **EC2 Instances**:
  - Two EC2 instances (`t2.micro`) running a simple web server.
  - User data script installs Apache HTTP server and serves a basic HTML page.

## Prerequisites

- AWS CLI installed and configured
- Terraform installed (`>=1.0` recommended)
- IAM user with required permissions to create VPC, EC2, ALB, and related resources

## Deployment Steps

1. **Clone this repository:**
   ```sh
   git clone https://github.com/your-repo/Two-Tier-Architecture-with-ALB.git
   cd Two-Tier-Architecture-with-ALB
   ```
2. **Initialize Terraform:**
   ```sh
   terraform init
   ```
3. **Plan the deployment:**
   ```sh
   terraform plan
   ```
4. **Apply the Terraform configuration:**
   ```sh
   terraform apply -auto-approve
   ```
5. **Retrieve the ALB DNS name:**
   ```sh
   terraform output ipaddress
   ```
6. **Access the web application:**
   Open the ALB DNS name in a browser to see the "Hello World" message.

## Cleanup

To destroy all resources and clean up the AWS environment:

```sh
terraform destroy -auto-approve
```

## File Structure

```
├── main.tf                # Main Terraform configuration
├── variables.tf           # Input variables
├── outputs.tf             # Outputs
├── userdata.sh            # User data script for EC2 instance
├── terraform.tfvars       # Variable values (ignored in .gitignore for security)
└── README.md              # Documentation (this file)
```

## Notes

- Modify `terraform.tfvars` to customize your deployment.
- Ensure the provided AMI ID (`ami-0c614dee691cbbf37`) is valid for your AWS region.
- Make sure Terraform and AWS CLI are installed and configured before running the script.
