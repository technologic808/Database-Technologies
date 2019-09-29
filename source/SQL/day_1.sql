-- 1 table structure of emp and dept
DESC emp;
DESC dept;

-- 2 query employee number, name and salary of all employees
SELECT empno, ename, sal
FROM emp; 

-- 3 details of employee
SELECT *
FROM emp;

-- 4 display emp no, name, sal, and da for all employee . da = sal*20
SELECT empno, ename, sal, sal*20 DA
FROM emp;

-- 5 display empno, ename, hiredate. 
SELECT empno "emp#", ename "employee name", hiredate "date of join", comm commission
FROM emp; 
 

-- 6 create a query to display unique dept number from employee
SELECT DISTINCT DEPTNO
FROM emp;

-- 7 Display name concatenated with salary separated by comma and space and name the column as "Employee Salary"
SELECT CONCAT (EMPNO,", ",SAL) "Employee Salary"
FROM emp;


-- 8 Display the o/p as follows
    -- Blake works as managher in department 30
SELECT CONCAT (ename, " works as a ", job, " in department ", DEPTNO) "Employees, Departments and Department Numbers"
FROM emp;

-- 9 Create a query which will display all employee data those whi is earning more than 2000

SELECT *
FROM emp
WHERE sal > 2000;

-- 10 Create a query which displays name, salarym date of join adn job of all employees who work as clerk

SELECT ename, sal, hiredate, job
FROM emp
WHERE job = "clerk";

-- 11 Query to display employee details of people getting salary between 2000 and 4000
SELECT *
FROM emp
WHERE sal between 2000 and 4000;

-- 12 Display ename, job, and hiredate of all employee who have been hired bwteen April 1, 1981 and March 31, 1982
SELECT ename, job, hiredate
FROM emp
WHERE hiredate between "1981-04-01" and "1982-03-31";

-- 13 display ename , dept no, of emp who work in d10 and d30
SELECT ename, DEPTNO
FROM emp
WHERE DEPTNO in (10, 30);
--  +----------+--------------+------+-----+---------+-------+
-- | Field    | Type         | Null | Key | Default | Extra |
-- +----------+--------------+------+-----+---------+-------+
-- | EMPNO    | int(4)       | NO   |     | NULL    |       |
-- | ENAME    | varchar(10)  | YES  |     | NULL    |       |
-- | JOB      | varchar(9)   | YES  |     | NULL    |       |
-- | MGR      | int(4)       | YES  |     | NULL    |       |
-- | HIREDATE | date         | YES  |     | NULL    |       |
-- | SAL      | decimal(7,2) | YES  |     | NULL    |       |
-- | COMM     | decimal(7,2) | YES  |     | NULL    |       |
-- | DEPTNO   | int(2)       | YES  |     | NULL    |       |
-- +----------+--------------+------+-----+---------+-------+


-- 14 display nbame and job of emp without managers
SELECT ename, job
FROM emp
WHERE mgr IS NULL;

-- 15 emp with name strting with s
SELECT ename
FROM emp
WHERE ename LIKE 'S%';

SELECT ename
FROM emp
WHERE ename REGEXP '^S';

-- 16 display name, job, salary, of all emp whose job = mgr or analy and sal != 1000, 3000, 5000;
SELECT ename, job, sal
FROM emp
WHERE job in ('MANAGER', 'ANALYST') and sal not in (1000, 3000, 5000);

-- 17 display name, sal , of all emp comm more than 75% of sa

SELECT ename, sal
FROM emp
WHERE comm > 0.75 * sal;

-- 18 display emp no, sal, sal inc by 15%  (whole num) as New Salary

SELECT empno, sal, floor(sal*1.15) "New Salary"
FROM emp;

