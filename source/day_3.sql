-- 26. Write a query in SQL to list the employee name, and job_name who are
-- not working under a manager.

SELECT ename, job 
FROM emp
WHERE mgr IS NULL;

-- 27. Write a query in SQL to list all the employees joined on 3rd dec 81.

SELECT * 
FROM emp
WHERE hiredate = '1981-12-03';

-- 28. Write a query in SQL to list the id, name, salry, and experiences of all the
-- employees working for the manger 7698.

SELECT empno, ename, sal, floor((abs(datediff(hiredate, curdate()))/365)) Experience
FROM emp
WHERE mgr = 7698;

-- 29. Write a query in SQL to list the id, name, salary, and experience of all the
-- employees who earn more than 100 as daily salary.

SELECT empno, ename, sal, floor((abs(datediff(hiredate, curdate()))/365)) Experience
FROM emp 
WHERE (sal/30 > 100);

-- 30. Write a query in SQL to list the employees who are retiring after 31-Dec 89 after completion of 8 years of service period.

SELECT ename
FROM emp
WHERE 1990 < year(hiredate) + 8;

-- 31. Write a query in SQL to list those employees whose salary is an odd
-- value.

SELECT *
FROM emp
WHERE sal % 2 != 0;

-- 32. Write a query in SQL to list those employees whose salary contain only 3
-- digits.

SELECT *
FROM emp
WHERE (sal < 1000) ;

-- 33. Write a query in SQL to list the employees who joined in the month of
-- APRIL.

SELECT *
FROM emp
WHERE month(hiredate) = 4;

-- 34. Write a query in SQL to list the employees those who joined in company
-- before 19th of the month.

SELECT *
FROM emp
WHERE day(hiredate) < 19;


-- 35. Write a query in SQL to list the employees who are SALESMAN and
-- gathered an experience over 10 years. 

SELECT *
FROM emp
WHERE job = 'SALESMAN' AND floor((abs(datediff(hiredate, curdate()))/365)) > 10;

-- 36. Write a query in SQL to list the employees of department id 20 or 10
-- joined in the year 1981.

SELECT ename
FROM emp
WHERE year(hiredate) = 1981 AND deptno IN (20, 10);

-- 37. Write a query in SQL to list the employees of department id 10 or 20
-- joined in the year 1981.

SELECT ename
FROM emp
WHERE year(hiredate) = 1981 AND deptno IN (20, 10);

-- 38. Write a query in SQL to list all the employees of designation CLERK in
-- department no 20

SELECT  *
FROM emp
WHERE job = 'CLERK' AND deptno = 20;

-- 39. Write a query in SQL to list the ID, name, salary, and job_name of the
-- employees for -
-- 1. Annual salary is below 34000 but receiving some commission which should
-- not be more than the salary,
-- 2. And designation is SALESMAN and working for department 3001.

SELECT empno, ename, job, sal
FROM emp
WHERE sal * 12 < 34000 and comm < sal;


SELECT empno, ename, job, sal
FROM emp
WHERE job = 'SALESMAN' and deptno = 30;

-- 40. Write a query in SQL to list the employees who are either CLERK or
-- MANAGER.

SELECT ename "Clerks or Managers" 
FROM emp
WHERE job = 'CLERK' or job = 'MANAGER';
 
-- 41. Write a query in SQL to list the employees who joined in any year except
-- the month February.

SELECT ename, month(hiredate) JoiningMonth
FROM emp
WHERE month(hiredate) != 2;  

-- 42. Write a query in SQL to list the employees who joined in the year 81.

SELECT ename, year(hiredate) JoiningYear
FROM emp
WHERE year(hiredate) = 1981;  

-- 43. Write a query in SQL to list the employees who joined in the month of
-- June in 1981.


SELECT ename, year(hiredate) JoiningYear, month(hiredate) JoiningMonth
FROM emp
WHERE year(hiredate) = 1981 and month(hiredate) = 6 ;  


-- 44. Write a query in SQL to list the employees whose annual salary is within
-- the range 24000 and 50000.

SELECT ename, sal*12 AnnualSal
FROM emp
WHERE sal*12 between 24000 and 50000;

-- 45. Write a query in SQL to list the employees who have joined on the
-- following dates 1st May,20th Feb, and 03rd Dec in the year 1981.

SELECT ename, year(hiredate), day(hiredate), month(hiredate)
FROM emp
WHERE hiredate IN ( '1981-02-20', '1981-05-01', '1981-06-09');

-- 46. Write a query in SQL to list the employees working under the managers
-- 7902, 7698, 7698

SELECT ename, mgr
FROM emp
WHERE mgr in ( 7902, 7698, 7698);

-- 47. Write a query in SQL to list the employees who joined after the month
-- JUNE in the year 1981.

SELECT ename, hiredate
FROM emp
WHERE hiredate > '1981-06-01';


-- 48. Write a query in SQL to list the employees who joined in 80's.

SELECT ename, hiredate
FROM emp
WHERE year(hiredate) between 1980 and 1990;

-- 49. Write a query in SQL to list the managers of department 10 or 20. 


-- SELECT a.ename
-- FROM emp a join emp b
-- ON a.mgr = b.empno
-- WHERE a.deptno in (10, 20);

-- 50. Write a query in SQL to list the employees, joined in the month
-- FEBRUARY with a salary range between 1001 to 2000.

SELECT ename, hiredate, sal
FROM emp
WHERE sal between 1001 and 2000 and month(hiredate) = 2 ;

-- 51. Write a query in SQL to list all the employees who joined before or after
-- 1991.
-- 52. Write a query in SQL to list the employees along with department name.
-- 53. Write a query in SQL to list the name, job name, annual salary,
-- department id, department name and grade of the employees who earn 60000
-- in a year or not working as an ANALYST.
-- 54. Write a query in SQL to list the name, job name, manager id, salary,
-- manager name, manager's salary for those employees whose salary is greater
-- than the salary of their managers.
-- 55. Write a query in SQL to list the employees name, department, salary and
-- commission. For those whose salary is between 2000 and 5000 while location
-- is PERTH.
-- 56. Write a query in SQL to list the grade, employee name for the department
-- id 1001 or 3001 but salary grade is not 4 while they joined the company before
-- 1992-12-31.
-- 57. Write a query in SQL to list the employees whose manager name is
-- JONAS.
-- 58. Write a query in SQL to list the name and salary of FRANK if his salary is
-- equal to max_sal of his grade.
-- 59. Write a query in SQL to list the employees who are working either
-- MANAGER or ANALYST with a salary range between 2000 to 5000 without
-- any commission.
-- 60. Write a query in SQL to list the id, name, salary, and location of the
-- employees working at PERTH,or MELBOURNE with an experience over 10
-- years.
-- 61. Write a query in SQL to list the employees along with their location who
-- belongs to SYDNEY, MELBOURNE with a salary range between 2000 and
-- 5000 and joined in 1991. 
-- 62. Write a query in SQL to list the employees with their location and grade for
-- MARKETING department who comes from MELBOURNE or PERTH within
-- the grade 3 to 5 and experience over 5 years.
-- 63. Write a query in SQL to list the employees who are senior to their own
-- manager.
-- 64. Write a query in SQL to list the employee with their grade for the grade
-- 4.
-- 65. Write a query in SQL to list the employees of grade 3 in department
-- PRODUCTION or AUDIT who joined after 1991 and they are not MARKER or
-- ADELYN to their name.
-- 66. Write a query in SQL to list the employees in the ascending order of their
-- salaries.
-- 67. Write a query in SQL to list the details of the employees in ascending
-- order to the department_id and descending order to the jobs.
-- 68. Write a query in SQL to display all the unique job in descending order.
-- 69. Write a query in SQL to list the id, name, monthly salary, daily salary of all
-- the employees in the ascending order of their annual salary.
-- 70. Write a query in SQL to list the employees in descending order who are
-- either 'CLERK' or 'ANALYST'.
-- 71. Write a query in SQL to display the location of CLARE.
-- 72. Write a query in SQL to list the employees in ascending order of seniority
-- who joined on 1-MAY-91,or 3-DEC-91, or 19-JAN-90.
-- 73. Write a query in SQL to list the employees who are drawing the salary less
-- than 1000 and sort the output in ascending order on salary.
-- 74. Write a query in SQL to list the details of the employees in ascending
-- order on the salary.
-- 75. Write a query in SQL to list the employees in ascending order on job name
-- and descending order on employee id. 
-- 76. Write a query in SQL to list the unique jobs of department 2001 and 3001
-- in descending order.
-- 77. Write a query in SQL to list all the employees except PRESIDENT and
-- MANAGER in ascending order of salaries.
-- 78. Write a query in SQL to list the employees in ascending order of the salary
-- whose annual salary is below 25000.
-- 79. Write a query in SQL to list the employee id, name, annual salary, daily
-- salary of all the employees in the ascending order of annual salary who works
-- as a SALESMAN.
