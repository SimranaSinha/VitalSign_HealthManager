// Select the database to use.
use('VitalSignHealthManager');

db.Ward.find({ W_Capacity: { $gt: 40 } });

