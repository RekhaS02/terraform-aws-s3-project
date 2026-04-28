# AWS Static Website Hosting with Terraform 🚀

This project automates the deployment of a static website on AWS using Terraform. It showcases how to use Infrastructure as Code (IaC) to create an S3 bucket, configure it for web hosting, and upload files in seconds.

## Project Overview
The goal of this project was to move away from manual AWS Console clicks and use automation to:
* Create a globally unique **S3 Bucket**.
* Configure **Public Access Blocks** to allow web traffic.
* Set an **S3 Bucket Policy** for public read access.
* Upload `index.html` and other assets automatically.
* Output the **Website URL** directly to the terminal.

## Architecture
* **Provider:** AWS
* **Service:** S3 (Simple Storage Service)
* **IaC Tool:** Terraform
* **Language:** HCL (HashiCorp Configuration Language)

##  How to Run This Project
To replicate this deployment, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/RekhaS02/terraform-aws-s3-project.git](https://github.com/RekhaS02/terraform-aws-s3-project.git)
   cd terraform-aws-s3-project
   
2. **Initialize Terraform:**
   terraform init

3. **Check the execution plan:**
   terraform plan

4. **Deploy to AWS:**
   terraform apply -auto-approve

5. **Results**
  After the apply command finishes, Terraform outputs a website_endpoint. You can view the live site at that URL!

  Note: For security and cost management, I run terraform destroy after testing to remove the resources.
   
