AWS Infrastructure as Code (IaC) with Terraform

This repository contains a modular Terraform setup for provisioning AWS infrastructure for web applications. The project automates the deployment of a scalable and secure environment, including EC2 instances, VPC, ALB, S3, IAM roles, and security groups.


Project Overview
The goal of this project is to leverage Terraform modules to create reusable, scalable, and maintainable AWS infrastructure. It demonstrates best practices in Infrastructure as Code (IaC), ensuring consistent and automated provisioning.

Key Features:
Modular structure for easy reuse and scalability
Automated EC2 instance provisioning with user-data scripts
Load balancing using AWS Application Load Balancer (ALB)
Secure networking with custom VPC and security groups
Object storage integration using S3 buckets
IAM roles for secure access and permissions


Architecture Diagram
             +----------------+
             |   Internet     |
             +-------+--------+
                     |
              +------v-------+
              | Application  |
              | Load Balancer|
              +------+-------+
                     |
          +----------+----------+
          |                     |
+---------v--------+   +--------v--------+
| EC2 Instance 1   |   | EC2 Instance 2  |
|  (Web App)       |   |  (Web App)      |
+-----------------+   +-----------------+
          |
          v
      +---------+
      | S3 Bucket|
      +---------+


Terraform Workflow
Clone repo -> terraform init -> terraform plan -> terraform apply -> deployed AWS resources


Step-by-step Instructions:
Clone Repository:
git clone <repo-url>
cd <repo-folder>

Initialize Terraform:
terraform init

Review Infrastructure Plan:
terraform plan

Apply Terraform Scripts:
terraform apply

EC2 User-Data: Automatically configures instances (web server setup, app deployment)
Access Application: Through AWS ALB DNS

Terraform Modules
| Module                      | Purpose                                             |
| --------------------------- | --------------------------------------------------- |
| **vpc**                     | Creates VPC, subnets, internet gateway, and routing |
| **security_group**          | Defines security rules for EC2 and ALB              |
| **ec2_instance**            | Launches EC2 instances with user-data scripts       |
| **alb**                     | Configures Application Load Balancer                |
| **alb_listener**            | Listens to HTTP/HTTPS traffic on ALB                |
| **target_group**            | Defines target groups for ALB routing               |
| **target_group_attachment** | Associates EC2 instances with ALB target groups     |
| **s3_bucket**               | Creates S3 buckets for storage                      |
| **iam_role**                | Configures IAM roles and policies                   |

Tools & Tech
Terraform – Infrastructure as Code
AWS Services – VPC, EC2, ALB, Target Groups, Security Groups, S3, IAM
Bash/Shell Scripts – Automate EC2 setup via user-data
GitHub – Version control

Outcomes
Fully automated AWS infrastructure provisioning
Reusable Terraform modules for scaling applications
Secure and reliable environment with proper IAM and security groups
Quick deployment of web applications through ALB and EC2
