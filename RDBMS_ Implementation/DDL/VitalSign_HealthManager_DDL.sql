create database VitalSign_HealthManager;
use VitalSign_HealthManager;

DROP TABLE IF EXISTS `Patients`;
CREATE TABLE `Patients` (
  P_id varchar(20),
  P_Name varchar(255) NOT NULL,
  P_Email varchar(255) default NULL,
  P_DOB datetime,
  P_Gender varchar(255) default NULL, 
  P_Age integer as (2023 - year(P_DOB)),
  W_Id varchar(20),
  PRIMARY KEY (P_id),
  FOREIGN KEY(W_Id) REFERENCES Ward(W_Id)
);

DROP TABLE IF EXISTS `Staff`;
CREATE TABLE `Staff` (
  `St_ID` mediumint,
  `St_Name` varchar(255) NOT NULL,
  `St_Email` varchar(255) default NULL,
  `St_Contact` varchar(100) default NULL,
  `St_Position` varchar(255) default NULL,
  Dept_ID varchar(20) NOT NULL, 
  FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID),
  PRIMARY KEY (St_ID)
);

DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department` (
  `Dept_ID` varchar(20),
  `Dept_Name` varchar(255) NOT NULL,
  `StaffNum` mediumint default 0,
  PRIMARY KEY (Dept_ID)
);

DROP TABLE IF EXISTS `Doctor`;
CREATE TABLE `Doctor` (
  `D_Id` varchar(20),
  `D_Name` varchar(255) NOT NULL,
  `D_Age` mediumint default NULL,
  `D_Email` varchar(255) default NULL,
  PRIMARY KEY(D_Id)
);

DROP TABLE IF EXISTS `ResearchProject`;
CREATE TABLE `ResearchProject` (
  `Rp_Id` varchar(20),
  `ProjectName` varchar(255) NOT NULL,
  `P_Description` varchar(255),
  `P_StartDate` datetime,
  `P_EndDate` datetime,
  `Project_Status` varchar(20), 
  PRIMARY KEY (Rp_Id)
);

DROP TABLE IF exists `Surgeon`;
CREATE TABLE `Surgeon` (
  `D_Id` varchar(20),
  FOREIGN KEY (D_Id) REFERENCES Doctor(D_Id)
);

DROP TABLE IF exists `Researcher`;
CREATE TABLE `Researcher` (
  `D_Id` varchar(20),
  `Rp_Id` varchar(20),
  FOREIGN KEY (D_Id) REFERENCES Doctor(D_Id),
  FOREIGN KEY (Rp_Id) REFERENCES ResearchProject(Rp_Id)
);

DROP TABLE IF exists `General`;
CREATE TABLE `General` (
  `D_Id` varchar(20),
  FOREIGN KEY (D_Id) REFERENCES Doctor(D_Id)
);

DROP TABLE IF EXISTS `Ward`;
CREATE TABLE `Ward` (
  `W_Id` varchar(20) NOT NULL,
  `W_Supervisor` varchar(255) NOT NULL,
  `W_Capacity` mediumint NOT NULL,
  `Dept_Id` varchar(30) NOT NULL, 
  PRIMARY KEY(W_Id), 
  FOREIGN KEY(Dept_Id) REFERENCES Department(Dept_ID)
);

DROP TABLE IF EXISTS `Patient_Phone`;
CREATE TABLE `Patient_Phone` (
  `P_Id` varchar(20) NOT NULL,
  `P_Phone` varchar(100) NOT NULL,
  PRIMARY KEY(P_Id, P_Phone), 
  FOREIGN KEY(P_Id) REFERENCES Patients(P_Id)
);

DROP TABLE IF EXISTS `Doctor_Phone`;
CREATE TABLE `Doctor_Phone` (
  `D_Id` varchar(20) NOT NULL,
  `D_Phone` varchar(100) NOT NULL,
  PRIMARY KEY(D_Id, D_Phone), 
  FOREIGN KEY(D_Id) REFERENCES Doctor(D_Id)
);

DROP TABLE IF EXISTS `Appointment`;
CREATE TABLE `Appointment` (
  `A_Id` varchar(20) NOT NULL,
  `A_Date` varchar(255),
  `A_Status` varchar(255),
  PRIMARY KEY(A_Id)
);

DROP TABLE IF EXISTS `Patient_Visits`;
CREATE TABLE `Patient_Visits` (
  `AppointmentID` varchar(20) NOT NULL, 
  `D_Id` varchar(20) NOT NULL,
  `P_Id` varchar(20) NOT NULL, 
  PRIMARY KEY(AppointmentID, D_Id, P_Id), 
  FOREIGN KEY(D_Id) REFERENCES Doctor(D_Id), 
  FOREIGN KEY(P_Id) REFERENCES Patients(P_Id), 
  FOREIGN KEY(AppointmentID) REFERENCES Appointment(A_Id)
);

DROP TABLE IF EXISTS `ResearchTeam`;
CREATE TABLE `ResearchTeam` (
  `Team_ID` varchar(20) NOT NULL,
  `Rp_Id` varchar(20) NOT NULL,
  `DoctorNum` integer NOT NULL, 
  PRIMARY KEY(Team_ID),
  FOREIGN KEY(Rp_Id) REFERENCES ResearchProject(Rp_Id)
);

DROP TABLE IF EXISTS `ResearchPublication`;
CREATE TABLE `ResearchPublication` (
  `Rpub_Id` varchar(20) NOT NULL,
  `PubTitle` varchar(255) NOT NULL,
  `PubDate` datetime NOT NULL, 
  `Rp_Id` varchar(20) NOT NULL,
  PRIMARY KEY(Rpub_Id),
  FOREIGN KEY(Rp_Id) REFERENCES ResearchProject(Rp_Id)
);

DROP TABLE IF EXISTS `ResearchPublication_Authors`;
CREATE TABLE `ResearchPublication_Authors` (
  `Rpub_Id` varchar(20) NOT NULL,
  `Authors` varchar(255) NOT NULL,
  PRIMARY KEY(Rpub_Id, Authors),
  FOREIGN KEY(Rpub_Id) REFERENCES ResearchPublication(Rpub_Id)
);

DROP TABLE IF EXISTS `Medication`;
CREATE TABLE `Medication` (
  `M_ID` varchar(20) NOT NULL,
  `MedName` varchar(255) NOT NULL,
  `Dosage` varchar(255) NOT NULL,
  PRIMARY KEY(M_ID)
);

DROP TABLE IF EXISTS `MedicalRecord`;
CREATE TABLE `MedicalRecord` (
  `RecordID` varchar(20) NOT NULL,
  `P_Id` varchar(20) NOT NULL,
  `D_Id` varchar(20) NOT NULL,
  `M_ID` varchar(20) NOT NULL,
  PRIMARY KEY(RecordID, P_Id, D_Id, M_ID), 
  FOREIGN KEY(D_Id) REFERENCES Doctor(D_Id), 
  FOREIGN KEY(P_Id) REFERENCES Patients(P_Id),
  FOREIGN KEY(M_ID) REFERENCES Medication(M_ID)
);

DROP TABLE IF EXISTS `Doctor_Medication`;
CREATE TABLE `Doctor_Medication` (
  `D_Id` varchar(20) NOT NULL,
  `M_ID` varchar(20) NOT NULL,
  PRIMARY KEY(D_Id, M_ID), 
  FOREIGN KEY(D_Id) REFERENCES Doctor(D_Id), 
  FOREIGN KEY(M_ID) REFERENCES Medication(M_ID)
);

DROP TABLE IF EXISTS `Patient_Medication`;
CREATE TABLE `Patient_Medication` (
  `P_Id` varchar(20) NOT NULL,
  `M_ID` varchar(20) NOT NULL,
  PRIMARY KEY(P_Id, M_ID), 
  FOREIGN KEY(P_Id) REFERENCES Patients(P_Id),
  FOREIGN KEY(M_ID) REFERENCES Medication(M_ID)
);

DROP TABLE IF EXISTS `TreatmentPlan`;
CREATE TABLE `TreatmentPlan` (
  `Tp_Id` varchar(20) NOT NULL,
  `Start_Date` datetime,
  `End_Date` datetime,
  `M_ID` varchar(20) NOT NULL,
  `Rate` varchar(100) NOT NULL,
  PRIMARY KEY(Tp_Id), 
  FOREIGN KEY(M_ID) REFERENCES Medication(M_ID),
  CONSTRAINT C_TreatmentPlan CHECK (Start_Date <= End_Date)
);


DROP TABLE IF EXISTS `TreatmentPlan_Doctor`;
CREATE TABLE `TreatmentPlan_Doctor` (
  `Tp_Id` varchar(20) NOT NULL,
  `D_Id` varchar(20) NOT NULL,
  PRIMARY KEY(Tp_Id, D_Id), 
  FOREIGN KEY(D_Id) REFERENCES Doctor(D_Id),
  FOREIGN KEY(Tp_Id) REFERENCES TreatmentPlan(Tp_Id)
);

DROP TABLE IF EXISTS `TreatmentPlan_Patient`;
CREATE TABLE `TreatmentPlan_Patient` (
  `Tp_Id` varchar(20) NOT NULL,
  `P_Id` varchar(20) NOT NULL,
  PRIMARY KEY(Tp_Id, P_Id), 
  FOREIGN KEY(P_Id) REFERENCES Patients(P_Id),
  FOREIGN KEY(Tp_Id) REFERENCES TreatmentPlan(Tp_Id)
);