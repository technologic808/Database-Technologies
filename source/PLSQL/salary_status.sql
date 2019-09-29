# Write a procedure to display the following employee information
# Employee Name, Department Name, Designation, 
# Salary Status ( Greater/Lesser/Equal ) respective to average salary of their own department 

DELIMITER $$  
Drop procedure IF EXISTS  emp_info;  
CREATE PROCEDURE emp_info()  
BEGIN  

SELECT 
    e.ename "Employee Name",
    d.dname "Department",
    e.job "Designation",
    e.sal "Salary",
    (
		SELECT 
			FLOOR(AVG(e2.sal))
		FROM
			emp e2
		WHERE
			e2.deptno = e.deptno
		GROUP BY e2.deptno
    ) AS "Avg_Sal",
    IF(e.sal = (SELECT 
                AVG(e2.sal)
            FROM
                emp e2
            WHERE
                e2.deptno = e.deptno
            GROUP BY e2.deptno),
        'Equal',
        IF(e.sal > (SELECT 
                    AVG(e2.sal)
                FROM
                    emp e2
                WHERE
                    e2.deptno = e.deptno
                GROUP BY e2.deptno),
            'Greater',
            'Lesser')) AS "Salary Status"
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno;


END$$  

DELIMITER ;

call emp_info();