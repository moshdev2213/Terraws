 # 🌍 Terraws - AWS Infrastructure with Terraform 🛠️
 
<img width="960" alt="19 (1)" src="https://github.com/user-attachments/assets/9306a105-358e-4bcc-8a77-82bf9c6ba689">
 
 ## 🎯 Project Overview
 
 The **Terraws** project automates the deployment of a scalable and secure AWS infrastructure. It is designed to demonstrate key AWS services and features, including EC2, VPC, S3, and Load Balancers. The infrastructure is organized into reusable modules, making it easier to maintain and extend.
 
 ### 👾 Features of the Project:
 
 1. **VPC Setup** 🏠
    - Creates a custom **VPC** to isolate resources securely.
    - Two **public subnets** are created within this VPC to host EC2 instances. Each instance has internet access via a **public route table** and **internet gateway**.
    - Enables flexibility for adding more resources in the future, such as private subnets or NAT gateways.
 
 2. **EC2 Instances** 🖥️
    - Two EC2 instances, each deployed in separate public subnets for high availability.
    - EC2 instances are pre-configured to connect to the internet and access other AWS services like S3 (future integration via IAM Roles planned).
    - Easy scaling to accommodate more EC2 instances as needed.
    
 3. **S3 Bucket for Storage** 📦
    - An **S3 bucket** is created to serve as a scalable storage solution.
    - Future plans include setting up fine-grained **IAM roles** to allow EC2 instances to interact securely with the S3 bucket.
    - Can be used for storing logs, backups, or any other project files that need to be accessed from the EC2 instances.
 
 4. **Load Balancer** 🖧
    - A highly available **Application Load Balancer (ALB)** distributes traffic across the EC2 instances.
    - The load balancer ensures that traffic is evenly distributed, and it automatically adjusts as more instances are added.
    - With health checks enabled, the load balancer ensures that traffic only goes to healthy EC2 instances.
 
 5. **State Management** 🗄️
    - Terraform state is stored in a remote **S3 bucket** for centralized and persistent state management. This ensures that all team members work with the same state file.
    - A **DynamoDB table** is used to enable state locking, preventing race conditions when multiple users attempt to run Terraform commands concurrently.
 
 ### 🏗️ Infrastructure Architecture
 
 Here's a quick look at the AWS architecture deployed by this Terraform project:
 
 - **VPC** with two public subnets, each hosting an EC2 instance.
 - **Application Load Balancer** to distribute traffic across EC2 instances.
 - **S3 Bucket** for storage, accessible by EC2 instances.
 - Terraform **state stored in S3**, with **locking in DynamoDB** to ensure safe, concurrent operations.

 
 ---
 
 ## 🚀 Deployed Ec2 Images
![ec1](https://github.com/user-attachments/assets/b3ceda3b-550f-46b1-b83f-2738de275066)

<br/>

![ec2](https://github.com/user-attachments/assets/8b45a0af-9615-418d-8870-2a9dcae3ed5f)

 ## 🚀 Getting Started with Terraform
 
 ### 1. **Install Terraform** 🧑‍💻
 Make sure you have Terraform installed on your machine. You can download it from the official site:
 
 ```bash
 # For macOS (via brew)
 brew install terraform
 
 # For Linux (via apt)
 sudo apt-get install terraform
 
 # For Windows
 choco install terraform
 ```
 
 Check the installation:
 
 ```bash
 terraform --version
 ```
 
 ### 2. **Configure AWS CLI** 🔑
 
 Terraform interacts with AWS using your AWS credentials. Set up the AWS CLI and configure your access keys.
 
 ```bash
 # Install AWS CLI
 brew install awscli # For macOS
 sudo apt install awscli # For Linux
 
 # Configure the AWS CLI
 aws configure
 ```
 
 You'll be prompted to enter your:
 - **AWS Access Key ID**
 - **AWS Secret Access Key**
 - **Default region name** (e.g., `us-east-1`)
 - **Default output format** (e.g., `json`)
 
 ### 3. **Clone the Repository** 🧩
 
 ```bash
 git clone https://github.com/yourusername/terraws.git
 cd terraws
 ```
 
 ### 4. **Structure** 📂
 
 The project is modularized to maintain a clean and reusable structure:
 ```
 /terraws
 │
 ├── /modules
 │   ├── /vpc
 │   ├── /ec2
 │   ├── /loadbalancer
 │   └── /s3
 │
 ├── /assets
 │   ├── ec2_01.png
 │   ├── ec2_02.png
 |
 ├── /scripts
 │   ├── startup_script_ec2_01.sh
 │   ├── startup_script_ec2_02.sh
 |
 ├── main.tf       # Main entry point for Terraform
 ├── variables.tf  # Variables definition
 ├── outputs.tf    # Outputs definition
 └── terraform.tfstate # State file stored remotely
 └── backend.tf # file about remote state and locker
 ```
 
 ### 5. **Configure S3 Backend & DynamoDB for State Management** 🗄️
 
 Before you start, ensure the state is stored securely by configuring S3 and DynamoDB. This project already includes the backend configuration in `main.tf`:
 
 ```hcl
 terraform {
   backend "s3" {
     bucket         = "your-s3-bucket-name"
     key            = "path/to/terraform.tfstate"
     region         = "us-east-1"
     dynamodb_table = "terraform-lock-table"
   }
 }
 ```
 
 ### 6. **Initialize Terraform** ⚙️
 
 Run the following to initialize the Terraform environment and download the necessary providers:
 
 ```bash
 terraform init
 ```

If using a config file for the backend then use below command
  ```bash
 terraform init -backend-config=backend.conf
 ```
 
 ### 7. **Plan the Infrastructure** 📝
 
 To check what changes will be applied without actually making any changes:
 
 ```bash
 terraform plan
 ```
 
 ### 8. **Apply the Configuration** 🚀
 
 To provision your AWS infrastructure:
 
 ```bash
 terraform apply
 ```
 
 You’ll be prompted to type `yes` to confirm and apply the changes.
 
 ### 9. **Access Your Infrastructure** 🌐
 
 Once the infrastructure is set up, you'll get outputs like:
 - EC2 instance public IPs 🌐
 - Load Balancer DNS name 🖧
 - VPC ID 🏠
 
 ### 10. **Tear Down the Environment** 💣
 
 When you're done and want to clean up, run:
 
 ```bash
 terraform destroy
 ```
 
 This will remove all the resources created by Terraform.
 
 ---
 
 ## 📜 Detailed Features and Setup:
 
 ### VPC Module 🏠
 
 - Configures a **custom VPC** with two public subnets.
 - Attaches an **Internet Gateway** for outgoing traffic to the internet.
 - Routes internet-bound traffic through a **public route table**.
 
 ### EC2 Module 🖥️
 
 - Launches **EC2 instances** in each of the public subnets.
 - Includes key-pair setup for **SSH access** to the instances.
 - Configures **security groups** to allow SSH (port 22) and HTTP (port 80) traffic.
 
 ### Load Balancer Module 🖧
 
 - Deploys an **Application Load Balancer** to distribute traffic across EC2 instances.
 - Configures **listeners** and **target groups** for the EC2 instances.
 - Includes **health checks** to ensure the load balancer only sends traffic to healthy instances.
 
 ### S3 Module 📦
 
 - Creates an **S3 bucket** for storage needs (e.g., logs, backups, etc.).
 - Planned **IAM roles** to securely manage access to the S3 bucket from EC2 instances.
 
 ---
 
 ## 📜 Future Improvements
 
 - **IAM Roles**: Adding fine-grained access control to S3 for EC2 instances.
 - **Auto Scaling**: Configuring auto-scaling for EC2 instances behind the load balancer.
 - **Monitoring & Logging**: Set up AWS CloudWatch for monitoring and alarms.
 - **Database Integration**: Plan to include an RDS instance or DynamoDB for data storage.
 
 ---

 ### 🌟 Let's build the cloud infrastructure, with code 🌟
 