# 🏥 VitalSign Health Manager

A **hybrid hospital data management system** integrating **MySQL (Relational DB)** and **MongoDB (NoSQL)** to efficiently manage structured and unstructured healthcare data.

This project focuses on **database design, implementation, and querying**, supported by conceptual modeling and Python integration.

---

## 📌 Overview

Healthcare systems generate diverse data types:

* Structured → patient records, appointments, billing
* Unstructured → notes, reports, medical data

This system combines:

* **RDBMS (MySQL)** → consistency & relationships
* **MongoDB (NoSQL)** → flexibility & scalability

---

## ⚙️ Tech Stack

* 🐍 Python
* 🗄️ MySQL
* 🍃 MongoDB
* 📊 EER Modeling
* 📐 UML Diagrams

---

## 📂 Project Structure

```bash
VitalSign_HealthManager/
│
├── Mongo DB/
│   ├── Query_1.mongodb.js
│   ├── Query_2.mongodb.js
│   ├── Query_3.mongodb.js
│   └── Query_4.mongodb.js
│
├── RDBMS_Implementation/
│   ├── DDL/
│   │   └── VitalSign_HealthManager_DDL.sql
│   │
│   ├── DML/
│   │   ├── Patients_Data.sql
│   │   ├── Doctor_Data.sql
│   │   ├── Appointment_Data.sql
│   │   ├── Medication_Data.sql
│   │   ├── Department_Data.sql
│   │   ├── Patient_Visits_Data.sql
│   │   ├── TreatmentPlan_Data.sql
│   │   ├── ResearchProject_Data.sql
│   │   └── ... (multiple healthcare entities)
│   │
│   └── SQL Query/
│       └── BasicAnalysis.sql
│
├── Conceptual Modelling/
│   ├── EER Model
│   └── UML Diagram
│
├── Python_Implementation.ipynb
├── DMA_FinalProjectReport_Group21.pdf
└── README.md
```

---

## 🧠 Key Features

* Hybrid database architecture (**SQL + NoSQL**)
* Complete **database lifecycle implementation**:

  * Schema design (DDL)
  * Data population (DML)
  * Querying & analysis
* Handles complex healthcare entities:

  * Patients, Doctors, Departments
  * Appointments & Visits
  * Treatment Plans & Medications
  * Research Projects & Publications
* MongoDB support for flexible data storage
* Python integration for data access and processing

---

## 🏗️ Database Design

* **EER Model**

  * Defines entities, relationships, constraints
* **Relational Schema**

  * Normalized tables with primary & foreign keys
* **NoSQL Design**

  * Supports semi-structured healthcare data

---

## 📊 SQL Capabilities

* Complex joins across healthcare entities
* Analytical queries for hospital operations
* Data integrity using constraints
* Structured dataset creation using DML scripts

---

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone https://github.com/SimranaSinha/VitalSign_HealthManager.git
cd VitalSign_HealthManager
```

### 2. Set up MySQL

* Run:

```sql
VitalSign_HealthManager_DDL.sql
```

* Then execute all files in `DML/` to populate data

### 3. Run Queries

```sql
BasicAnalysis.sql
```

### 4. MongoDB

* Run `.mongodb.js` files in MongoDB shell or Compass

### 5. Python Integration

```bash
jupyter notebook Python_Implementation.ipynb
```

---

## 📈 Key Learnings

* Designing scalable healthcare database systems
* Working with **hybrid SQL + NoSQL architectures**
* Writing optimized SQL queries for real-world use cases
* Data modeling using EER and UML
* Managing complex relational dependencies

---

## 📄 Project Report

Detailed analysis and implementation:
📄 `DMA_FinalProjectReport_Group21.pdf`



