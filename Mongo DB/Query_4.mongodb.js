
// Select the database to use.
use('VitalSignHealthManager');

db.Patients.aggregate([
    {
        $group: {
            _id: {
                ageCategory: {
                    $cond: { if: { $gte: ["$P_Age", 18] }, then: "Greater than 18", else: "Less than 18" }
                },
                gender: "$P_Gender"
            },
            count: { $sum: 1 }
        }
    }
]);

