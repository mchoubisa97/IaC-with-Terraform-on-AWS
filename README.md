Infrastructure as Code (IaC) with Terraform on AWS

This repository contains a modular Terraform setup for provisioning and managing AWS infrastructure, designed to automate the deployment of web applications in a scalable and secure manner.


Overview
This project demonstrates Infrastructure as Code using Terraform to automate AWS resources. It includes modular configurations for networking, compute, storage, and application load balancing. The setup is reusable, scalable, and suitable for deploying web applications with best practices for security and automation.


Features
Modular Terraform design for easy maintenance and reuse
Automated provisioning of:
VPC with subnets
EC2 instances
S3 buckets
Application Load Balancer (ALB)
Target groups and listeners
Security groups
IAM roles
EC2 user-data scripts for automated application setup
Supports scalability and reproducibility for cloud environments


Modules
alb – Creates Application Load Balancer
alb_listener – Configures ALB listeners
ec2_instance – Provisions EC2 instances with user-data scripts
iam_role – Creates IAM roles and policies
s3_bucket – Provisions S3 buckets with proper permissions
security_group – Configures security groups for EC2 & ALB
target_group – Defines target groups for load balancing
target_group_attachment – Attaches EC2 instances to target groups
vpc – Creates VPC, subnets, and route tables


Prerequisites
Terraform >= 1.5.0
AWS CLI configured with proper credentials
An AWS account with sufficient permissions


Installation & Deployment
Clone the repository
git clone https://github.com/mchoubisa97/terraform-aws-iac.git
cd terraform-aws-iac

Initialize Terraform
terraform init

Plan the deployment
terraform plan

Apply the configuration
terraform apply

Confirm the plan when prompted.
Terraform will provision all resources in your AWS account.
Destroy the infrastructure (optional)
terraform destroy


Usage
EC2 instances are automatically configured using user-data scripts.
ALB distributes traffic across EC2 instances.
S3 buckets can be used for application storage or static assets.
Add or modify modules to customize infrastructure for your applications.
