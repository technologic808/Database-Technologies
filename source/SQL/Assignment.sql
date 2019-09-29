USE banna;

-- 1. Write a query in SQL to display all the information of the employees

SELECT 
    *
FROM
    emp;

-- 2. Write a query in SQL to find the salaries of all employees

SELECT 
    ename 'Name', sal 'Salary'
FROM
    emp;

-- 3. Write a query in SQL to display the unique designations for the
-- employees.

SELECT DISTINCT
    job
FROM
    emp;

-- 4. Write a query in SQL to list the emp_name and salary is increased by 15%
-- and expressed as no.of Dollars.

SELECT 
    ename, sal * 1.15 'Salary (Dollars)'
FROM
    emp;

-- 5. Write a query in SQL to produce the output of employees name and job
-- name as a fromat of "Employee & Job".

SELECT 
    CONCAT(ename, ' works as ', job) 'Employee & Job'
FROM
    emp;

-- 6. Write a query in SQL to produce the output of employees as follows:
-- Employee
-- JONAS(manager).

SELECT 
    CONCAT(ename, '(', job, ')') 'Employee(Job)'
FROM
    emp;

-- 7. Write a query in SQL to list the employees with Hire date in the format like
-- February 22, 1991.

SELECT 
    ename, DATE_FORMAT(hiredate, '%M %d, %Y') 'Hire Date'
FROM
    emp;


-- 8. Write a query in SQL to count the no. of characters without considering the
-- spaces for each name.

SELECT 
    ename, LENGTH(REPLACE(ename, ' ', '')) 'Number of letters'
FROM
    emp
GROUP BY ename;

-- 9. Write a query in SQL to list the emp_id,salary, and commission of all the
-- employees.

SELECT 
    empno, sal, comm
FROM
    emp;

-- 10. Write a query in SQL to display the unique department with jobs.

SELECT DISTINCT
    deptno, job
FROM
    emp;

-- 11. Write a query in SQL to list the employees who does not belong to
-- department 2001.

SELECT 
    ename
FROM
    emp
WHERE
    deptno != 20;

-- 12. Write a query in SQL to list the employees who joined before 1981.

SELECT 
    ename, YEAR(hiredate) 'Year of joining'
FROM
    emp
WHERE
    YEAR(hiredate) <= 1981;

-- 13. Write a query in SQL to display the average salaries of all the employees
-- who works as ANALYST.

SELECT 
    FLOOR(AVG(sal)) 'Average salary of Analysts'
FROM
    emp
WHERE
    job = 'ANALYST';

-- 14. Write a query in SQL to display the details of the employee KING.

SELECT 
    *
FROM
    emp
WHERE
    ename = 'KING';

-- 15. Write a query in SQL to display all the details of the employees whose
-- commission is more than their salary.

SELECT 
    *
FROM
    emp
WHERE
    sal < comm;

-- 16. Write a query in SQL to list the employees whose salary is more than
-- 3000 after giving 25% increment.

SELECT 
    ename, FLOOR(sal * 1.25) 'Incremented Salary'
FROM
    emp
WHERE
    (sal * 1.25) > 3000;

-- 17. Write a query in SQL to list the name of the employees, those having six characters to their name.

SELECT 
    ename
FROM
    emp
WHERE
    LENGTH(REPLACE(ename, ' ', '')) = 6;

-- 18. Write a query in SQL to list the employees who joined in the month
-- January.


SELECT 
    ename, MONTH(hiredate)
FROM
    emp
WHERE
    MONTH(hiredate) = 1;

-- 19. Write a query in SQL to list the name of employees and their manager
-- separated by the string 'works for'.

SELECT 
    CONCAT(ename, ' works for ', mgr) 'Employee and Manager'
FROM
    emp;

SELECT 
    CONCAT(a.ename, ' works with  ', b.ename) 'Who\'s WHO'
FROM
    emp a
        JOIN
    emp b ON a.mgr = b.empno;

-- 20. Write a query in SQL to list all the employees whose designation is
-- CLERK.

SELECT 
    *
FROM
    emp
WHERE
    job = 'CLERK';

-- 21. Write a query in SQL to list the employees whose experience is more than
-- 38 years. 

SELECT 
    *
FROM
    emp
WHERE
    (ABS(DATEDIFF(CURDATE(), hiredate)) / 365) > 38;


-- 22. Write a query in SQL to list the employees whose salaries are less than
-- 3500.

SELECT 
    *
FROM
    emp
WHERE
    sal < 3500;

-- 23. Write a query in SQL to list the name, job_name, and salary of any
-- employee whose designation is ANALYST.

SELECT 
    ename, job, sal
FROM
    emp
WHERE
    job = 'ANALYST';

-- 24. Write a query in SQL to list the employees who have joined in the year
-- 1981.

SELECT 
    *
FROM
    emp
WHERE
    YEAR(hiredate) = 1981;

-- 25. Write a query in SQL to list the name, id, hire_date, and salary of all the
-- employees joined before 1 apr 1981..


SELECT 
    ename, empno, hiredate, sal
FROM
    emp
WHERE
    hiredate < '1981-04-01';

-- 26. Write a query in SQL to list the employee name, and job_name who are
-- not working under a manager.

SELECT 
    ename, job
FROM
    emp
WHERE
    mgr IS NULL;

-- 27. Write a query in SQL to list all the employees joined on 3rd dec 81.

SELECT 
    *
FROM
    emp
WHERE
    hiredate = '1981-12-03';

-- 28. Write a query in SQL to list the id, name, salry, and experiences of all the
-- employees working for the manger 7698.

SELECT 
    empno,
    ename,
    sal,
    FLOOR((ABS(DATEDIFF(hiredate, CURDATE())) / 365)) Experience
FROM
    emp
WHERE
    mgr = 7698;

-- 29. Write a query in SQL to list the id, name, salary, and experience of all the
-- employees who earn more than 100 as daily salary.

SELECT 
    empno,
    ename,
    sal,
    FLOOR((ABS(DATEDIFF(hiredate, CURDATE())) / 365)) Experience
FROM
    emp
WHERE
    (sal / 30 > 100);

-- 30. Write a query in SQL to list the employees who are retiring after 31-Dec 89 after completion of 8 years of service period.

SELECT 
    ename
FROM
    emp
WHERE
    1990 < YEAR(hiredate) + 8;

-- 31. Write a query in SQL to list those employees whose salary is an odd
-- value.

SELECT 
    *
FROM
    emp
WHERE
    sal % 2 != 0;

-- 32. Write a query in SQL to list those employees whose salary contain only 3
-- digits.

SELECT 
    *
FROM
    emp
WHERE
    (sal < 1000);

-- 33. Write a query in SQL to list the employees who joined in the month of
-- APRIL.

SELECT 
    *
FROM
    emp
WHERE
    MONTH(hiredate) = 4;

-- 34. Write a query in SQL to list the employees those who joined in company
-- before 19th of the month.

SELECT 
    *
FROM
    emp
WHERE
    DAY(hiredate) < 19;


-- 35. Write a query in SQL to list the employees who are SALESMAN and
-- gathered an experience over 10 years. 

SELECT 
    *
FROM
    emp
WHERE
    job = 'SALESMAN'
        AND FLOOR((ABS(DATEDIFF(hiredate, CURDATE())) / 365)) > 10;

-- 36. Write a query in SQL to list the employees of department id 20 or 10
-- joined in the year 1981.

SELECT 
    ename
FROM
    emp
WHERE
    YEAR(hiredate) = 1981
        AND deptno IN (20 , 10);

-- 37. Write a query in SQL to list the employees of department id 10 or 20
-- joined in the year 1981.

SELECT 
    ename
FROM
    emp
WHERE
    YEAR(hiredate) = 1981
        AND deptno IN (20 , 10);

-- 38. Write a query in SQL to list all the employees of designation CLERK in
-- department no 20

SELECT 
    *
FROM
    emp
WHERE
    job = 'CLERK' AND deptno = 20;

-- 39. Write a query in SQL to list the ID, name, salary, and job_name of the
-- employees for -
-- 1. Annual salary is below 34000 but receiving some commission which should
-- not be more than the salary,
-- 2. And designation is SALESMAN and working for department 3001.

SELECT 
    empno, ename, job, sal
FROM
    emp
WHERE
    sal * 12 < 34000 AND comm < sal;


SELECT 
    empno, ename, job, sal
FROM
    emp
WHERE
    job = 'SALESMAN' AND deptno = 30;

-- 40. Write a query in SQL to list the employees who are either CLERK or
-- MANAGER.

SELECT 
    ename 'Clerks or Managers'
FROM
    emp
WHERE
    job = 'CLERK' OR job = 'MANAGER';
 
-- 41. Write a query in SQL to list the employees who joined in any year except
-- the month February.

SELECT 
    ename, MONTH(hiredate) JoiningMonth
FROM
    emp
WHERE
    MONTH(hiredate) != 2;

-- 42. Write a query in SQL to list the employees who joined in the year 81.

SELECT 
    ename, YEAR(hiredate) JoiningYear
FROM
    emp
WHERE
    YEAR(hiredate) = 1981;

-- 43. Write a query in SQL to list the employees who joined in the month of
-- June in 1981.


SELECT 
    ename,
    YEAR(hiredate) JoiningYear,
    MONTH(hiredate) JoiningMonth
FROM
    emp
WHERE
    YEAR(hiredate) = 1981
        AND MONTH(hiredate) = 6;


-- 44. Write a query in SQL to list the employees whose annual salary is within
-- the range 24000 and 50000.

SELECT 
    ename, sal * 12 AnnualSal
FROM
    emp
WHERE
    sal * 12 BETWEEN 24000 AND 50000;

-- 45. Write a query in SQL to list the employees who have joined on the
-- following dates 1st May,20th Feb, and 03rd Dec in the year 1981.

SELECT 
    ename, YEAR(hiredate), DAY(hiredate), MONTH(hiredate)
FROM
    emp
WHERE
    hiredate IN ('1981-02-20' , '1981-05-01', '1981-06-09');

-- 46. Write a query in SQL to list the employees working under the managers
-- 7902, 7698, 7698

SELECT 
    ename, mgr
FROM
    emp
WHERE
    mgr IN (7902 , 7698, 7698);

-- 47. Write a query in SQL to list the employees who joined after the month
-- JUNE in the year 1981.

SELECT 
    ename, hiredate
FROM
    emp
WHERE
    hiredate > '1981-06-01';


-- 48. Write a query in SQL to list the employees who joined in 80's.

SELECT 
    ename, hiredate
FROM
    emp
WHERE
    YEAR(hiredate) BETWEEN 1980 AND 1990;

-- 49. Write a query in SQL to list the managers of department 10 or 20. 


SELECT 
    ename, hiredate, sal
FROM
    emp
WHERE
    sal BETWEEN 1001 AND 2000
        AND MONTH(hiredate) = 2;

-- 51. Write a query in SQL to list all the employees who joined before or after
-- 1981.
SELECT 
    *
FROM
    emp
WHERE
    YEAR(hiredate) != 1981;

-- 52. Write a query in SQL to list the employees along with department name.
SELECT 
    ename, dname
FROM
    emp e,
    dept d
WHERE
    e.deptno = d.deptno;


-- 53. Write a query in SQL to list the name, job name, annual salary,
-- department id, department name and grade of the employees who earn 60000
-- in a year or not working as an ANALYST.
SELECT 
    ename, job, sal, e.deptno, d.dname, g.grade
FROM
    emp e,
    dept d,
    salgrade g
WHERE
    e.deptno = d.deptno
        AND sal BETWEEN g.losal AND g.hisal
        AND 60000 = (sal * 12)
        AND job != 'analyst';

-- 54. Write a query in SQL to list the name, job name, manager id, salary,
-- manager name, manager's salary for those employees whose salary is greater
-- than the salary of their managers.
SELECT 
    e1.ename, e1.job, e1.mgr, e1.sal, e2.ename, e2.sal
FROM
    emp e1,
    emp e2
WHERE
    e1.sal > e2.sal AND e2.empno = e1.mgr;


-- 55. Write a query in SQL to list the employees name, department, salary and
-- commission. For those whose salary is between 1000 and 5000 while location
-- is PERTH.
SELECT 
    ename, e.deptno, sal, comm, d.loc
FROM
    emp e,
    dept d
WHERE
    sal BETWEEN 1000 AND 5000
        AND d.loc = 'chicago'
        AND d.deptno = e.deptno;



-- 56. Write a query in SQL to list the grade, employee name for the department
-- id 10 or 30 but salary grade is not 4 while they joined the company before
-- 1992-12-31.

SELECT 
    e.ename, s.grade, hiredate, e.deptno, e.sal
FROM
    emp e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
        AND e.deptno IN (10 , 30)
        AND s.grade != 4
        AND e.hiredate < '1982-12-31';

-- 57. Write a query in SQL to list the employees whose manager name is
-- JONAS.
SELECT 
    e1.ename, e1.mgr, e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;


-- 58. Write a query in SQL to list the name and salary of FRANK if his salary is
-- equal to max_sal of his grade.

SELECT 
    e1.ename, e1.sal, s.grade
FROM
    emp e1,
    salgrade s
WHERE
    e1.sal BETWEEN s.losal AND s.hisal
        AND grade = 4
;

-- CHECK LATER #CHECKED!!!

SELECT 
    e.ename, e.sal
FROM
    emp e
WHERE
    e.ename = 'scott'
        AND e.sal IN (SELECT 
            MAX(e.sal)
        FROM
            emp e,
            salgrade s
        WHERE
            e.sal BETWEEN s.losal AND s.hisal
        GROUP BY s.grade)
;

SELECT 
    ename
FROM
    emp
WHERE
    job IN ('manager' , 'analyst')
        AND sal BETWEEN 2000 AND 5000
        AND comm IS NULL;


-- 60. Write a query in SQL to list the id, name, salary, and location of the
-- employees working at PERTH,or MELBOURNE with an experience over 10
-- years.

SELECT 
    empno, ename, sal, d.loc
FROM
    emp e
        INNER JOIN
    dept d ON e.deptno = d.deptno
WHERE
    CAST(YEAR(CURDATE()) AS UNSIGNED) - CAST(YEAR(hiredate) AS UNSIGNED) > 30
        AND d.loc IN ('new york' , 'dallas');


-- 61. Write a query in SQL to list the employees along with their location who
-- belongs to SYDNEY, MELBOURNE with a salary range between 2000 and
-- 5000 and joined in 1991. 

SELECT 
    *
FROM
    emp e
        INNER JOIN
    dept d ON e.deptno = d.deptno
WHERE
    sal BETWEEN 2000 AND 5000
        AND YEAR(hiredate) = '1981';

-- 62. Write a query in SQL to list the employees with their location and grade for
-- MARKETING department who comes from MELBOURNE or PERTH within
-- the grade 3 to 5 and experience over 5 years.
SELECT 
    e.ename, d.loc, s.grade, d.dname, e.hiredate
FROM
    salgrade s,
    emp e
        INNER JOIN
    dept d ON e.deptno = d.deptno
WHERE
    e.sal BETWEEN s.losal AND s.hisal
        AND s.grade BETWEEN 3 AND 5
        AND d.dname = 'research'
        AND d.loc IN ('new york' , 'dallas')
        AND CAST(YEAR(CURDATE()) AS UNSIGNED) - CAST(YEAR(hiredate) AS UNSIGNED) > 5;



-- 63. Write a query in SQL to list the employees who are senior to their own
-- manager.
SELECT 
    e.ename, e.hiredate, m.ename, m.hiredate
FROM
    emp e,
    emp m
WHERE
    e.mgr = m.empno
        AND YEAR(e.hiredate) < YEAR(m.hiredate);

-- 64. Write a query in SQL to list the employee with their grade for the grade
-- 4.
SELECT 
    e.ename, s.grade
FROM
    emp e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
        AND s.grade = 4;

-- 65. Write a query in SQL to list the employees of grade 3 in department
-- PRODUCTION or AUDIT who joined after 1991 and they are not MARKER or
-- ADELYN to their name.
SELECT 
    e.ename, s.grade, d.dname
FROM
    emp e
        INNER JOIN
    dept d ON e.deptno = d.deptno,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal
        AND s.grade = 3
        AND d.dname IN ('sales' , 'operartions')
        AND CAST(YEAR(hiredate) AS UNSIGNED) < 1991
        AND e.ename != 'ALLEN';


-- 66. Write a query in SQL to list the employees in the ascending order of their
-- salaries.
SELECT 
    ename, sal
FROM
    emp
ORDER BY sal ASC;


-- 67. Write a query in SQL to list the details of the employees in ascending
-- order to the department_id and descending order to the jobs.
SELECT 
    *
FROM
    emp
ORDER BY job DESC , deptno ASC;-- and then orders in segement by dept no


SELECT DISTINCT
    job
FROM
    emp
ORDER BY job DESC;

-- 69. Write a query in SQL to list the id, name, monthly salary, daily salary of all
-- the employees in the ascending order of their annual salary.
SELECT 
    empno,
    ename,
    sal,
    (sal / 30) daily_sal,
    (sal * 12) yearly_sal
FROM
    emp
ORDER BY sal ASC;

-- 70. Write a query in SQL to list the employees in descending order who are
-- either 'CLERK' or 'ANALYST'.
SELECT 
    ename, job
FROM
    emp
WHERE
    job IN ('clerk' , 'analyst')
ORDER BY job DESC;

-- 71. Write a query in SQL to display the location of CLARE.
SELECT 
    *
FROM
    emp
        INNER JOIN
    dept ON emp.deptno = dept.deptno
WHERE
    emp.ename = 'ford';

-- 72. Write a query in SQL to list the employees in ascending order of seniority
-- who joined on 1-MAY-91,or 3-DEC-91, or 19-JAN-90.
SELECT 
    e.ename, e.hiredate
FROM
    emp e
WHERE
    e.hiredate IN ('1980-12-17' , '1981-09-28', '1982-12-09')
ORDER BY e.hiredate DESC;


-- 73. Write a query in SQL to list the employees who are drawing the salary less
-- than 1000 and sort the output in ascending order on salary.
SELECT 
    ename, job, sal
FROM
    emp
WHERE
    sal < 1000
ORDER BY sal ASC;

-- 74. Write a query in SQL to list the details of the employees in ascending
-- order on the salary.
SELECT 
    *
FROM
    emp
ORDER BY sal ASC;


-- 75. Write a query in SQL to list the employees in ascending order on job name
-- and descending order on employee id. 
SELECT 
    empno, ename, job
FROM
    emp
ORDER BY job ASC , empno DESC;


-- 76. Write a query in SQL to list the unique jobs of department 2001 and 3001
-- in descending order.
SELECT DISTINCT
    job
FROM
    emp
WHERE
    deptno IN (20 , 30)
ORDER BY job DESC;


-- 77. Write a query in SQL to list all the employees except PRESIDENT and
-- MANAGER in ascending order of salaries.

SELECT 
    *
FROM
    emp
WHERE
    job NOT IN ('president' , 'manager')
ORDER BY sal;

-- 78. Write a query in SQL to list the employees in ascending order of the salary
-- whose annual salary is below 25000.

SELECT 
    *
FROM
    emp
WHERE
    sal * 12 < 25000
ORDER BY sal;


-- 79. Write a query in SQL to list the employee id, name, annual salary, daily
-- salary of all the employees in the ascending order of annual salary who works
-- as a SALESMAN.

SELECT 
    empno, ename, sal * 12 'YEARLY SAL', sal / 30 'DAILY SAL'
FROM
    emp
WHERE
    job LIKE 'sale%'
ORDER BY sal;

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
