INSERT INTO TreatmentPlan_Doctor 
SELECT distinct t.Tp_Id, m.D_Id
FROM TreatmentPlan t
INNER JOIN Doctor_Medication m on t.M_Id = m.M_Id;

INSERT INTO TreatmentPlan_Patient
SELECT distinct t.Tp_Id, p.P_Id
FROM TreatmentPlan t
INNER JOIN Patient_Medication p on t.M_Id = p.M_Id;
