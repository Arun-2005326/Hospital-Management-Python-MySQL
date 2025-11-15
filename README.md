# 🏥 Hospital Management System (MySQL + Python)

This project is a simple **Hospital Management Database System** developed using **MySQL**.  
It includes well-structured database tables for managing:

- Patients  
- Doctors  
- Appointments  
- Treatments  
- Billing  

The project also includes a **Python–MySQL connection script** to fetch and display hospital records through Python.

---

## 📌 Features

### ✅ Database Structure
- Patient registration  
- Doctor details  
- Appointment scheduling  
- Treatment records  
- Billing system  

### ✅ SQL Functions Used
- CREATE TABLE  
- INSERT  
- SELECT  
- JOIN (multiple table joins)  
- FOREIGN KEY relationships  

### ✅ Python Integration
A Python script (`connect_mysql.py`) is included to:
- Connect MySQL to Python  
- Retrieve and print patient/billing details  
- Test database connection  

---

## 🗄️ Database Tables

### 1. `patients`
| Column | Type |
|--------|------|
| patient_id | INT (PK, AUTO_INCREMENT) |
| name | VARCHAR(50) |
| age | INT |
| gender | VARCHAR(40) |
| phone | VARCHAR(16) |
| address | VARCHAR(100) |

### 2. `doctors`
| Column | Type |
|--------|------|
| doctor_id | INT (PK, AUTO_INCREMENT) |
| name | VARCHAR(100) |
| specialization | VARCHAR(120) |
| phone | VARCHAR(16) |

### 3. `appointments`
| Column | Type |
|--------|------|
| appointment_id | INT (PK, AUTO_INCREMENT) |
| patient_id | INT (FK) |
| doctor_id | INT (FK) |
| date | DATE |
| time | TIME |

### 4. `treatments`
| Column | Type |
|--------|------|
| treatment_id | INT (PK, AUTO_INCREMENT) |
| appointment_id | INT (FK) |
| diagnosis | VARCHAR(20) |
| medicine | VARCHAR(20) |

### 5. `billing`
| Column | Type |
|--------|------|
| bill_id | INT (PK, AUTO_INCREMENT) |
| treatment_id | INT (FK) |
| amount | DECIMAL(10,2) |
| status | VARCHAR(20) |

---

## 🚀 How to Run This Project

### **1️⃣ Import SQL File into MySQL Workbench**
1. Open MySQL Workbench  
2. Go to **File → Open SQL Script**  
3. Select `hospital_db.sql`  
4. Click **Run** (⚡ icon)

This will create:
- All tables  
- All sample data  

---

## 🐍 Python – MySQL Connection

### **2️⃣ Install the connector:**
```bash
pip install mysql-connector-python
