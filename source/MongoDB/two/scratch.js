use newdb;


db.employees.update(
    { desg: "Analyst" },
    { $set: { desg: "AO" }},
    {     
        multi: true
    }
 )

db.employees.find().pretty();

