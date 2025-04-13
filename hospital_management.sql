-- Create database
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;

-- Departments Table
CREATE TABLE departments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  image VARCHAR(255) DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);




-- Doctors Table
CREATE TABLE doctors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  username VARCHAR(100),
  password VARCHAR(100),
  gender VARCHAR(20),
  dob DATE,
  phone VARCHAR(15),
  aadhar VARCHAR(20),
  email VARCHAR(100),
  address TEXT,
  degrees VARCHAR(255),
  institutions VARCHAR(255),
  graduation_year VARCHAR(10),
  experience VARCHAR(100),
  department_id INT,
  designation VARCHAR(100),
  joining_date DATE,
  employment_status VARCHAR(50),
  working_hours VARCHAR(50),
  image VARCHAR(255)
);



-- Patients Table
CREATE TABLE patients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  username VARCHAR(100),
  password VARCHAR(100),
  gender VARCHAR(20),
  dob DATE,
  phone VARCHAR(15),
  aadhar VARCHAR(20),
  email VARCHAR(100),
  address TEXT,
  blood_group VARCHAR(10),
  medical_history TEXT,
  registration_date DATE,
  image VARCHAR(255)
);


-- Appointments Table
CREATE TABLE appointments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  department_id INT,
  appointment_date DATE,
   notes TEXT,
  report_path VARCHAR(255),
  status VARCHAR(20) DEFAULT 'Pending'
);


-- Queries Table
CREATE TABLE queries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  subject VARCHAR(150),
  message TEXT,
  reply TEXT,  -- Corrected this line
  date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




-- Feedback Table
CREATE TABLE feedback (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  message TEXT,
  date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- medical report 
CREATE TABLE medical_reports (
  id INT AUTO_INCREMENT PRIMARY KEY,
  appointment_id INT NOT NULL,
  report_file VARCHAR(255),
  uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE
);
