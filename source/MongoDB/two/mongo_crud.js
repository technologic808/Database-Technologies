// Create a Employee Collection add 5 documents:

db.createCollection("employees");

db.employees.insertOne({
	empno: 111,
	ename: "Deepali Vaidya",
	sal: 40000.0,
	dept: { deptno: 12, dname: "HR", dloc: "Mumbai" },
	desg: "Analyst",
	mgr: { name: "Satish", num: 111 },
	project: [{ name: "Project 1", hrs: 4 }, { name: "Project 2", hrs: 4 }]
});

db.employees.insertOne({
	empno: 112,
	ename: "Praphul Kolte",
	sal: 450000.0,
	dept: { deptno: 22, dname: "DevOps", dloc: "Pune" },
	desg: "VP",
	mgr: { name: "King", num: 1 },
	project: [{ name: "Project X", hrs: 300 }, { name: "Project 2", hrs: 4 }]
});

db.employees.insertOne({
	empno: 111,
	ename: "Kishori Khadilkar",
	sal: 500000.0,
	dept: { deptno: 31, dname: "Training", dloc: "Pimpri Chinchwad" },
	desg: "Trainer",
	mgr: { name: "King", num: 1 },
	project: [{ name: "Project 1", hrs: 4 }, { name: "Project T", hrs: 100 }]
});

db.employees.insertOne({
	empno: 111,
	ename: "Mahesh K",
	sal: 50000.0,
	dept: { deptno: 12, dname: "HR", dloc: "Mumbai" },
	desg: "Lab Assistant",
	mgr: { name: "Bhimashankar", num: 125 },
	project: [{ name: "VIVA", hrs: 1 }, { name: "LAB", hrs: 4 }]
});

db.employees.insertOne({
	empno: 111,
	ename: "Jitesh",
	sal: 50000.0,
	dept: { deptno: 12, dname: "HR", dloc: "Mumbai" },
	desg: "Lab Assistant",
	mgr: { name: "Bhimashankar", num: 125 },
	project: [{ name: "VIVA", hrs: 1 }, { name: "LAB", hrs: 4 }]
});

db.employees.find().count();

db.employees.find().pretty();

// 1. All Employee’s with the desg as ‘Analyst’ are now called as (AO) Administrative Officers.

db.employees.update(
	{ desg: "Analyst" },
	{ desg: "AO" },
	{
		upsert: 0,
		multi: 1
	}
);

// Update the Employee collection for this.

// 2. Change the number of hours for project-1 to 5 for all employees with designation ao.

db.employees.update(
	{ desg: "AO", "project.name": "Project 1" },
	{ $set: { "project.$.hrs": 5 } },
	{ multi: 1 }
);

db.employees.find({ desg: "AO", "project.name": "Project 1" }).pretty();

// 3. Add 2 projects project-3 and project-4 for employee whose name starts with ”Deep” with 2 hrs
// 4. Add bonus rs 2000 for all employees with salary > 50000 and 1500 if salary <50000 and >
// 30000 otherwise bonus will be 1000
// 5. Change manager name to Tushar for all employees whose manager is currently “satish”
// And manager number to 3333
// 6. Increase salary of all employees from “purchase department” by 15000
// 7. Decrease number of hrs by 2 for all employees who are working on project-2
// 8. Delete project-2 from all employee document if they are working on the project for 4
// hrs.
// 9. Change the salary of employees to 10000 only if their salary is < 10000
// 10. Increase bonus of all employees by 500 if the bonus is <2000 or their salary is <
// 20000 or if employee belong to sales department
// 11. Add 2 new project at position 2 for all employees with designation analyst or salary is
// equal to either 30000 or 33000 or 35000
// 12. Delete last project of all employees with department name is “HR” and if the location
// is Mumbai
// 13. Change designation of all employees to senior programmer if they are working on
// name:”Project-1” for 4 hrs
// 14. Add list of hobbies in all employees document whose manager is Rajan or Revati
// 15. Add list of skillset in all employee documents who are working on project-4 for 3 hrs
// or on project-3 for 4 hrs
// 16. Add a new hobby as blogging at 3 position in hobbies array for all employess whose
// name starts with R or p and ends with j or s
// 17. Increase salary by 10000 for all employees who are working on project-2 or project-3
// or project-1
// Decrease bonus by 1000 rs And increase salary by 1000rs for all employees whose
// department location is Mumbai
// 18. Remove all employees working on project-1
// 19. Replace document of employee with name “Deepak to some new document
// 20. Change skill python to python 3.8 for all employees if python is there in the skillset
// 21. Add 2 skills MongoDb and Perl at the end of skillset array for all employees who are
// working at Pune location
// 22. Delete first hobby from hobby array for all employees who are working on project-1
// or project-2
// 23. Delete last hobby from hobbies array for all employees who are working on project
// which is at 2 nd position in projects array for 4 hrs
// 24. Add 2 new projects at the end of array for all employees whose skillset contains Perl
// or python
// 25. Change hrs to 6 for project-1 for all employees if they working on the project-1 for <
// 6 hrs. otherwise keep the existing value.
