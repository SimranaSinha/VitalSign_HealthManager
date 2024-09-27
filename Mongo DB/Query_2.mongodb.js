use('VitalSignHealthManager');

db.Staff.aggregate([
    {
        $group: {
            _id: "$St_Position",
            positionCount: { $sum: 1 }
        }
    },
    {
        $group: {
            _id: null,
            totalPositions: { $sum: "$positionCount" },
            positions: {
                $push: {
                    position: "$_id",
                    count: "$positionCount"
                }
            }
        }
    },
    {
        $unwind: "$positions"
    },
    {
        $project: {
            _id: 0,
            position: "$positions.position",
            averageCount: { $divide: ["$positions.count", "$totalPositions"] }
        }
    }
]);


