use('VitalSignHealthManager');

db.Medication.aggregate([
    {
        $group: {
            _id: "$MedName",
            total_count: { $sum: 1 }
        }
    }
]);



    