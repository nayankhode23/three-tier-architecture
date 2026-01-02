# Three-Tier AWS Architecture

Three-Tier AWS Architecture is an **Infrastructure-as-Code project** built with Terraform to provision a modular, scalable, and secure three-tier application stack on AWS.  
It demonstrates how to design and deploy a production-ready architecture with **networking, application, and database layers**, following best practices for security, modularity, and environment separation.

---

## 📑 Table of Contents
- [Features](#features)
- [Project Structure](#project-structure)
- [Technology Stack](#technology-stack)
- [Architecture & Network Flow](#architecture--network-flow)
- [Outputs](#toutputs)

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
## Project Structure
<img width="404" height="671" alt="image" src="https://github.com/user-attachments/assets/b8a96462-0f0c-4b2d-8549-b0f0cf0e9235" />



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
<img width="1024" height="559" alt="image" src="https://github.com/user-attachments/assets/fda6386d-56c7-42ec-a173-4bfc2962be2a" />

<img width="2031" height="1840" alt="App Architecture (1)" src="https://github.com/user-attachments/assets/c444aeef-8553-4480-9a32-8f8ead1e1544" />





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




---

## ⚙️ Outputs
<img width="1920" height="1020" alt="Screenshot 2025-12-16 025155" src="https://github.com/user-attachments/assets/961933dd-4b1e-4b48-b164-cb6583b97534" />


<img width="1920" height="1020" alt="Screenshot 2025-12-16 025140" src="https://github.com/user-attachments/assets/7d9e4362-b156-492a-895d-ec09a1378cc5" />

<img width="1920" height="1020" alt="Screenshot 2025-12-16 025048" src="https://github.com/user-attachments/assets/9a0bd7da-c893-42ca-976b-c9baef222cb1" />

<img width="1920" height="1020" alt="Screenshot 2025-12-16 025644" src="https://github.com/user-attachments/assets/aec7186f-5d66-4525-8a19-ed35b4c032ab" />

<img width="1920" height="1020" alt="Screenshot 2025-12-16 031340" src="https://github.com/user-attachments/assets/d81aa032-8e55-44e7-a73d-a8b3f4d39a42" />


<img width="1920" height="1020" alt="Screenshot 2025-12-16 031735" src="https://github.com/user-attachments/assets/79b220db-1b0a-4a47-b2be-c9bf8105b97f" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5ab04078-ea77-45e2-a1e5-78d5a8ffe483" />
<img width="951" height="411" alt="image" src="https://github.com/user-attachments/assets/87b16e6e-cb4e-46c7-bf33-4f64de31afbc" />
<img width="950" height="305" alt="image" src="https://github.com/user-attachments/assets/e9dc3845-f0b1-4ed8-bbce-f6074c85d9fd" />
<img width="1136" height="317" alt="image" src="https://github.com/user-attachments/assets/fbca3263-407b-4861-99fe-e27967561ecf" />
<img width="1142" height="492" alt="image" src="https://github.com/user-attachments/assets/af4d670b-857c-48b1-8fac-b60803afa435" />











