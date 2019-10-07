use newdb;

db.employees.find().pretty();


// 2. Change the number of hours for project-1 to 5 for all employees with designation ao.

db.employees.update({"desg":"AO", 'project.name': "Project 1"},{$set:{'project.$.hrs':5}},{multi:1})
db.employees.find({"desg":"AO", 'project.name':"Project 1"}).pretty();


// 3. Add 2 projects project-3 and project-4 for employee whose name starts with ”Deep” with 2 hrs



// {
// 	"_id" : ObjectId("5d96f105fa4e26727bbd8e9e"),
// 	"empno" : 111,
// 	"ename" : "Jitesh",
// 	"sal" : 50000,
// 	"dept" : {
// 		"deptno" : 12,
// 		"dname" : "HR",
// 		"dloc" : "Mumbai"
// 	},
// 	"desg" : "Lab Assistant",
// 	"mgr" : {
// 		"name" : "Bhimashankar",
// 		"num" : 125
// 	},
// 	"project" : [
// 		{
// 			"name" : "VIVA",
// 			"hrs" : 1
// 		},
// 		{
// 			"name" : "LAB",
// 			"hrs" : 4
// 		}
// 	]
// }
