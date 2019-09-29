
-- 80. Write a query in SQL to list the employee id, name, hire_date, current date
-- and experience of the employees in ascending order on their experiences.

SELECT 
    empno,
    ename,
    hiredate,
    CURDATE(),
    FLOOR(ABS(DATEDIFF(CURDATE(), hiredate)) / 365) 'Experience'
FROM
    emp
ORDER BY ABS(DATEDIFF(CURDATE(), hiredate)) / 365;

-- 81. Write a query in SQL to list the employees in ascending order of
-- designations of those, joined after the second half of 1982.

SELECT 
    *
FROM
    emp
WHERE
    (YEAR(hiredate) = 1982
        AND MONTH(hiredate) > 5)
        OR YEAR(hiredate) > 1982
ORDER BY JOB;


-- 82. Write a query in SQL to list the total information of employees table along
-- with department, and location of all the employees working under Accounting
-- and sales in the ascending department no.

SELECT 
    *
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno
        AND d.dname IN ('accounting' , 'sales')
ORDER BY d.deptno;

-- 83. Write a query in SQL to display the total information of the employees
-- along with grades in ascending order.

SELECT 
    *
FROM
    emp e,
    salgrade g
WHERE
    e.sal BETWEEN g.losal AND g.hisal;

-- 84. Write a query in SQL to list the name, job name, department, salary, and
-- grade of the employees according to the department in ascending order.

SELECT 
    e.ename, e.job, e.deptno, d.dname, e.sal, s.grade
FROM
    emp e,
    dept d,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
        AND e.deptno = d.deptno
ORDER BY d.dname;

-- 85. Write a query in SQL to list the name, job name, salary, grade and
-- department name of employees except CLERK and sort result set on the
-- basis of highest salary.

SELECT 
    e.empno, e.ename, e.job, d.dname, e.sal, s.grade
FROM
    emp e,
    salgrade s,
    dept d
WHERE
    e.sal BETWEEN s.losal AND s.hisal
        AND e.deptno = d.deptno
        AND e.job != 'clerk'
ORDER BY sal DESC;

-- 86. Write a query in SQL to list the employee ID, name, salary, department,
-- grade, experience, and annual salary of employees working for department
-- 1001 or 2001.
SELECT 
    e.empno,
    e.ename,
    d.dname,
    s.grade,
    FLOOR(ABS(DATEDIFF(CURDATE(), hiredate)) / 365) 'Experience',
    e.sal * 12 Annual_Salary
FROM
    emp e,
    dept d,
    salgrade s
WHERE
    e.deptno = d.deptno
        AND e.deptno IN (20 , 30)
        AND e.sal BETWEEN s.losal AND s.hisal;


-- 87. Write a query in SQL to list the details of the employees along with the
-- details of their departments.
SELECT 
    *
FROM
    emp
        JOIN
    dept ON emp.deptno = dept.deptno;


-- 88. Write a query in SQL to list the employees who are senior to their own
-- MANAGERS.

SELECT 
    e1.ename 'Emp Name',
    e1.mgr 'Mgr Code',
    e2.ename 'MGR Name',
    e1.hiredate 'Emp Hire',
    e2.hiredate 'Mgr hiredate'
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno
        AND e1.hiredate < e2.hiredate;

 
-- 89. Write a query in SQL to list the employee id, name, salary, and
-- department id of the employees in ascending order of salary who works in the
-- department 10.

SELECT 
    empno, ename, sal, deptno
FROM
    emp
WHERE
    deptno IN (10)
ORDER BY sal;

-- 90. Write a query in SQL to find the highest salary from all the employees.

SELECT 
    *
FROM
    emp
WHERE
    sal = (SELECT 
            MAX(sal)
        FROM
            emp);

-- 91. Write a query in SQL to find the average salary and average total
-- remuneration(salary and commission) for each type of job.

SELECT 
    job, AVG(sal), AVG(sal + comm)
FROM
    emp
GROUP BY job;

-- 92. Write a query in SQL to find the total annual salary distributed against
-- each job in the year 1981.

SELECT 
    job, SUM(sal) * 12 'total annual salary distributed'
FROM
    emp
WHERE
    YEAR(hiredate) <= 1981
GROUP BY job;

-- 93. Write a query in SQL to list the employee id, name, department id, location
-- of all the employees.

SELECT 
    e.empno, e.ename, e.deptno, d.loc
FROM
    emp e,
    dept d;

-- 94. Write a query in SQL to list the employee id, name, location, department of
-- all the employees in  departments 10 and 20.

SELECT 
    e.empno, e.ename, d.loc, d.dname
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno
        AND e.deptno IN ('10' , '20');

-- 95. Write a query in SQL to list the employee id, name, location, department of
-- all the departments 10 and 20.

SELECT 
    e.empno, e.ename, d.loc, d.dname
FROM
    emp e,
    dept d
WHERE
    e.deptno IN (10 , 20);

-- 96. Write a query in SQL to list the manager no and the number of employees
-- working for those managers in ascending order on manager id.

SELECT 
    e2.empno, COUNT(*)
FROM
    EMP E1,
    EMP E2
WHERE
    e1.mgr = e2.empno
GROUP BY e2.empno
ORDER BY e2.empno;

-- 97. Write a query in SQL to display the number of employee for each job in
-- each department.

SELECT 
    dept.dname, job, COUNT(*) 'Employees'
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno
GROUP BY dept.dname , job
ORDER BY dname;

-- 98. Write a query in SQL to list the department where at least two employees
-- are working.

SELECT 
    d.dname, COUNT(*)
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(*) > 2
;

-- 99. Write a query in SQL to display the Grade, Number of employees, and
-- maximum salary of each grade.

SELECT 
    s.grade, COUNT(*) 'Number of employees', MAX(sal)
FROM
    emp e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
GROUP BY s.grade
ORDER BY s.grade;

-- 100. Write a query in SQL to display the department name, grade, no. of
-- employees where at least two employees are working as a SALESMAN.

SELECT 
    d.dname, s.grade, COUNT(*)
FROM
    emp e,
    dept d,
    salgrade s
WHERE
    e.deptno = d.deptno
        AND e.sal BETWEEN s.losal AND s.hisal
        AND d.deptno = (SELECT 
            deptno
        FROM
            emp
        WHERE
            (job = 'clerk')
        GROUP BY job , deptno
        HAVING COUNT(*) > 1
        ORDER BY deptno)
GROUP BY d.dname , s.grade
ORDER BY d.dname;


-- 101. Write a query in SQL to list the no. of employees in each department
-- where the no. is less than 4.

SELECT 
    d.dname, COUNT(*)
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY e.deptno
HAVING COUNT(*) < 4;

-- 102. Write a query in SQL to list the name of departments where atleast 2
-- employees are working in that department. 

SELECT 
    d.dname, COUNT(*)
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(*) > 1
;

-- 103. Write a query in SQL to check whether all the employees numbers are
-- indeed unique.

Select ename,  'NAME IS UNIQUE'
from emp where
EXISTS (select * 
where 
(select count(DISTINCT empno) from emp) = (select count(empno) from emp)
);

-- 104. Write a query in SQL to list the no. of employees and average salary
-- within each department for each job name.

SELECT 
    d.dname, e.job, COUNT(*), AVG(e.sal)
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY d.dname , e.job
ORDER BY d.dname
;

-- 105. Write a query in SQL to list the names of those employees starting with
-- 'A' and with five characters in length.

SELECT 
    ename
FROM
    emp
WHERE
    ename REGEXP '^A....';

-- 106. Write a query in SQL to list the employees whose name is six characters
-- in length and third character must be 'R'.

SELECT 
    ename
FROM
    emp
WHERE
    ename REGEXP '^..r...';

-- 107. Write a query in SQL to list the name of the employee of five characters
-- long and starting with 'A' and ending with 'N'.


SELECT 
    ename
FROM
    emp
WHERE
    ename REGEXP '^A...N$';


-- 108. Write a query in SQL to list the employees who joined in the month of
-- which second character is 'a'.

SELECT 
    ename, MONTHNAME(hiredate)
FROM
    emp
WHERE
    MONTHNAME(hiredate) REGEXP '^.a';

-- 109. Write a query in SQL to list the employees whose names containing the
-- character set 'AR' together.

SELECT 
    ename
FROM
    emp
WHERE
    ename REGEXP 'ar';


-- 110. Write a query in SQL to list the employees those who joined in 90's.

SELECT 
    ename, YEAR(hiredate)
FROM
    emp
WHERE
    YEAR(hiredate) REGEXP '198';


-- 111. Write a query in SQL to list the employees whose ID not starting with
-- digit 78.

SELECT 
    empno, ename, YEAR(hiredate)
FROM
    emp
WHERE
    empno NOT REGEXP '^78';

-- 112. Write a query in SQL to list the employees whose names containing the
-- letter 'A'.


SELECT 
    ename
FROM
    emp
WHERE
    ename REGEXP 'a';

-- 113. Write a query in SQL to list the employees whose name is ending with 'S'
-- and five characters long.

SELECT 
    ename
FROM
    emp
WHERE
    ename REGEXP '....s$';


-- 114. Write a query in SQL to list the employees who joined in the month
-- having char 'A' at any position.

SELECT 
    ename, MONTHNAME(hiredate)
FROM
    emp
WHERE
    MONTHNAME(hiredate) REGEXP 'a';

-- 115. Write a query in SQL to list the employees who joined in the month
-- having second char is 'A'. 

SELECT 
    ename, MONTHNAME(hiredate)
FROM
    emp
WHERE
    MONTHNAME(hiredate) REGEXP '^.a';
