INSERT INTO Doctor_Medication
SELECT distinct D_Id, M_ID FROM MedicalRecord;

INSERT INTO Patient_Medication
SELECT distinct P_Id, M_ID FROM MedicalRecord;