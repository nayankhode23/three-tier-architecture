# Three-Tier AWS Architecture

Three-Tier AWS Architecture is an **Infrastructure-as-Code project** built with Terraform to provision a modular, scalable, and secure three-tier application stack on AWS.  
It demonstrates how to design and deploy a production-ready architecture with **networking, application, and database layers**, following best practices for security, modularity, and environment separation.

---

## 📑 Table of Contents
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture & Network Flow](#architecture--network-flow)
- [Setup Instructions](#setup-instructions)
- [Project Structure](#project-structure)
- [Terraform Outputs](#terraform-outputs)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## ✨ Features
- Modular Terraform code with separate **VPC, App, and DB modules**
- Environment-specific configuration (`dev`, `staging`, `prod`)
- Secure networking with **public, private app, and private DB subnets**
- Application Load Balancer (ALB) routing traffic to frontend EC2
- Backend EC2 accessible only from frontend
- RDS MySQL database in private subnets with **Secrets Manager** for credentials
- Remote state management with **S3 backend** (and optional DynamoDB locking)

---

## 🛠 Technology Stack
- **Terraform** (Infrastructure as Code)
- **AWS Services**:
  - VPC, Subnets, Route Tables, NAT Gateway, Internet Gateway
  - EC2 Instances (Frontend & Backend)
  - Application Load Balancer (ALB)
  - RDS MySQL
  - AWS Secrets Manager
- **Languages**:
  - Bash (user data scripts)
  - Python (simple backend HTTP server)

---

## 🏗 Architecture & Network Flow
The project provisions a classic **three-tier architecture**:

- **Frontend Tier**  
  - EC2 instance in public subnet  
  - Receives traffic via ALB (HTTP 80)  

- **Backend Tier**  
  - EC2 instance in private app subnet  
  - Accessible only from frontend SG (port 8080)  

- **Database Tier**  
  - RDS MySQL in private DB subnets  
  - Accessible only from backend SG (port 3306)  
  - Credentials stored in Secrets Manager  

**Network Flow**:  
Internet → ALB → Frontend EC2 → Backend EC2 → RDS DB  

👉 *Add architecture diagram screenshot here*

---

## ⚙️ Setup Instructions
1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/three-tier-architecture.git
   cd three-tier-architecture/envs/dev



