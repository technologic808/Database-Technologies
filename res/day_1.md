* 1 table structure of emp and dept

        DESC emp;
        DESC dept;

* 2 query employee number, name and salary of all employees

        SELECT empno, ename, sal
        FROM emp; 

* 3 details of employee

        SELECT *
        FROM emp;

* 4 display emp no, name, sal, and da for all employee . da = sal*20

        SELECT empno, ename, sal, sal*20 DA
        FROM emp;

* 5 display empno, ename, hiredate. 

        SELECT empno "emp#", ename "employee name", hiredate "date of join", comm commission
        FROM emp; 
 

* 6 create a query to display unique dept number from employee

        SELECT DISTINCT DEPTNO
        FROM emp;

* 7 Display name concatenated with salary separated by comma and space and name the column as "Employee Salary"

        SELECT CONCAT (EMPNO,", ",SAL) "Employee Salary"
        FROM emp;


* 8 Display the o/p as follows
    * Blake works as managher in department 30

        SELECT CONCAT (ename, " works as a ", job, " in department ", DEPTNO) "Employees, Departments and Department Numbers"
        FROM emp;

* 9 Create a query which will display all employee data those whi is earning more than 2000

        SELECT *
        FROM emp
        WHERE sal > 2000;

* 10 Create a query which displays name, salarym date of join adn job of all employees who work as clerk

        SELECT ename, sal, hiredate, job
        FROM emp
        WHERE job = "clerk";

* 11 Query to display employee details of people getting salary between 2000 and 4000

        SELECT *
        FROM emp
        WHERE sal between 2000 and 4000;

* 12 Display ename, job, and hiredate of all employee who have been hired bwteen April 1, 1981 and March 31, 1982


        SELECT ename, job, hiredate
        FROM emp
        WHERE hiredate between "1981-04-01" and "1982-03-31";

* 13 display ename , dept no, of emp who work in d10 and d30

        SELECT ename, DEPTNO
        FROM emp
        WHERE DEPTNO in (10, 30);

* 14 display nbame and job of emp without managers

        SELECT ename, job
        FROM emp
        WHERE mgr IS NULL;

* 15 emp with name strting with s

        SELECT ename
        FROM emp
        WHERE ename LIKE 'S%';


        SELECT ename
        FROM emp
        WHERE ename REGEXP '^S';

* 16 display name, job, salary, of all emp whose job = mgr or analy and sal != 1000, 3000, 5000;

        SELECT ename, job, sal
        FROM emp
        WHERE job in ('MANAGER', 'ANALYST') and sal not in (1000, 3000, 5000);

* 17 display name, sal , of all emp comm more than 75% of sa


        SELECT ename, sal
        FROM emp
        WHERE comm > 0.75 * sal;

* 18 display emp no, sal, sal inc by 15%  (whole num) as New Salary


        SELECT empno, sal, floor(sal*1.15) "New Salary"
        FROM emp;


## OUTPUT
        
        mysql> source C:\Users\dac\Desktop\September 23\hello.sql

| Field    | Type         | Null | Key | Default | Extra |
|----------|--------------|------|-----|---------|-------|
| EMPNO    | int(4)       | NO   |     | NULL    |       |
| ENAME    | varchar(10)  | YES  |     | NULL    |       |
| JOB      | varchar(9)   | YES  |     | NULL    |       |
| MGR      | int(4)       | YES  |     | NULL    |       |
| HIREDATE | date         | YES  |     | NULL    |       |
| SAL      | decimal(7,2) | YES  |     | NULL    |       |
| COMM     | decimal(7,2) | YES  |     | NULL    |       |
| DEPTNO   | int(2)       | YES  |     | NULL    |       |

8 rows in set (0.00 sec)

| Field  | Type        | Null | Key | Default | Extra |
|--------|-------------|------|-----|---------|-------|
| DEPTNO | int(2)      | YES  |     | NULL    |       |
| DNAME  | varchar(14) | YES  |     | NULL    |       |
| LOC    | varchar(13) | YES  |     | NULL    |       |

3 rows in set (0.00 sec)

| empno | ename  | sal     |
|-------|--------|---------|
|  7369 | SMITH  |  800.00 |
|  7499 | ALLEN  | 1600.00 |
|  7521 | WARD   | 1250.00 |
|  7566 | JONES  | 2975.00 |
|  7654 | MARTIN | 1250.00 |
|  7698 | BLAKE  | 2850.00 |
|  7782 | CLARK  | 2450.00 |
|  7788 | SCOTT  | 3000.00 |
|  7839 | KING   | 5000.00 |
|  7844 | TURNER | 1500.00 |
|  7876 | ADAMS  | 1100.00 |
|  7900 | JAMES  |  950.00 |
|  7902 | FORD   | 3000.00 |
|  7934 | MILLER | 1300.00 |

14 rows in set (0.00 sec)

| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
|-------|--------|-----------|------|------------|---------|---------|--------|
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1982-12-09 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1983-01-12 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |

14 rows in set (0.00 sec)

| empno | ename  | sal     | DA        |
|-------|--------|---------|-----------|
|  7369 | SMITH  |  800.00 |  16000.00 |
|  7499 | ALLEN  | 1600.00 |  32000.00 |
|  7521 | WARD   | 1250.00 |  25000.00 |
|  7566 | JONES  | 2975.00 |  59500.00 |
|  7654 | MARTIN | 1250.00 |  25000.00 |
|  7698 | BLAKE  | 2850.00 |  57000.00 |
|  7782 | CLARK  | 2450.00 |  49000.00 |
|  7788 | SCOTT  | 3000.00 |  60000.00 |
|  7839 | KING   | 5000.00 | 100000.00 |
|  7844 | TURNER | 1500.00 |  30000.00 |
|  7876 | ADAMS  | 1100.00 |  22000.00 |
|  7900 | JAMES  |  950.00 |  19000.00 |
|  7902 | FORD   | 3000.00 |  60000.00 |
|  7934 | MILLER | 1300.00 |  26000.00 |

14 rows in set (0.00 sec)


| emp# | employee name | date of join | commission |
|------|---------------|--------------|------------|
| 7369 | SMITH         | 1980-12-17   |       NULL |
| 7499 | ALLEN         | 1981-02-20   |     300.00 |
| 7521 | WARD          | 1981-02-22   |     500.00 |
| 7566 | JONES         | 1981-04-02   |       NULL |
| 7654 | MARTIN        | 1981-09-28   |    1400.00 |
| 7698 | BLAKE         | 1981-05-01   |       NULL |
| 7782 | CLARK         | 1981-06-09   |       NULL |
| 7788 | SCOTT         | 1982-12-09   |       NULL |
| 7839 | KING          | 1981-11-17   |       NULL |
| 7844 | TURNER        | 1981-09-08   |       0.00 |
| 7876 | ADAMS         | 1983-01-12   |       NULL |
| 7900 | JAMES         | 1981-12-03   |       NULL |
| 7902 | FORD          | 1981-12-03   |       NULL |
| 7934 | MILLER        | 1982-01-23   |       NULL |

14 rows in set (0.00 sec)

| DEPTNO |
|--------|
|     20 |
|     30 |
|     10 |

3 rows in set (0.00 sec)

| Employee Salary |
|-----------------|
| 7369, 800.00    |
| 7499, 1600.00   |
| 7521, 1250.00   |
| 7566, 2975.00   |
| 7654, 1250.00   |
| 7698, 2850.00   |
| 7782, 2450.00   |
| 7788, 3000.00   |
| 7839, 5000.00   |
| 7844, 1500.00   |
| 7876, 1100.00   |
| 7900, 950.00    |
| 7902, 3000.00   |
| 7934, 1300.00   |

14 rows in set (0.00 sec)

| Employees, Departments and Department Numbers |
|-----------------------------------------------|
| SMITH works as a CLERK in department 20       |
| ALLEN works as a SALESMAN in department 30    |
| WARD works as a SALESMAN in department 30     |
| JONES works as a MANAGER in department 20     |
| MARTIN works as a SALESMAN in department 30   |
| BLAKE works as a MANAGER in department 30     |
| CLARK works as a MANAGER in department 10     |
| SCOTT works as a ANALYST in department 20     |
| KING works as a PRESIDENT in department 10    |
| TURNER works as a SALESMAN in department 30   |
| ADAMS works as a CLERK in department 20       |
| JAMES works as a CLERK in department 30       |
| FORD works as a ANALYST in department 20      |
| MILLER works as a CLERK in department 10      |

14 rows in set (0.00 sec)

| EMPNO | ENAME | JOB       | MGR  | HIREDATE   | SAL     | COMM | DEPTNO |
|-------|-------|-----------|------|------------|---------|------|--------|
|  7566 | JONES | MANAGER   | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7698 | BLAKE | MANAGER   | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
|  7782 | CLARK | MANAGER   | 7839 | 1981-06-09 | 2450.00 | NULL |     10 |
|  7788 | SCOTT | ANALYST   | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7839 | KING  | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 |
|  7902 | FORD  | ANALYST   | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |

6 rows in set (0.00 sec)

| ename  | sal     | hiredate   | job   |
|--------|---------|------------|-------|
| SMITH  |  800.00 | 1980-12-17 | CLERK |
| ADAMS  | 1100.00 | 1983-01-12 | CLERK |
| JAMES  |  950.00 | 1981-12-03 | CLERK |
| MILLER | 1300.00 | 1982-01-23 | CLERK |

4 rows in set (0.00 sec)

| EMPNO | ENAME | JOB     | MGR  | HIREDATE   | SAL     | COMM | DEPTNO |
|-------|-------|---------|------|------------|---------|------|--------|
|  7566 | JONES | MANAGER | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
|  7698 | BLAKE | MANAGER | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
|  7782 | CLARK | MANAGER | 7839 | 1981-06-09 | 2450.00 | NULL |     10 |
|  7788 | SCOTT | ANALYST | 7566 | 1982-12-09 | 3000.00 | NULL |     20 |
|  7902 | FORD  | ANALYST | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |

5 rows in set (0.00 sec)

| ename  | job       | hiredate   |
|--------|-----------|------------|
| JONES  | MANAGER   | 1981-04-02 |
| MARTIN | SALESMAN  | 1981-09-28 |
| BLAKE  | MANAGER   | 1981-05-01 |
| CLARK  | MANAGER   | 1981-06-09 |
| KING   | PRESIDENT | 1981-11-17 |
| TURNER | SALESMAN  | 1981-09-08 |
| JAMES  | CLERK     | 1981-12-03 |
| FORD   | ANALYST   | 1981-12-03 |
| MILLER | CLERK     | 1982-01-23 |

9 rows in set (0.00 sec)

| ename  | DEPTNO |
|--------|--------|
| ALLEN  |     30 |
| WARD   |     30 |
| MARTIN |     30 |
| BLAKE  |     30 |
| CLARK  |     10 |
| KING   |     10 |
| TURNER |     30 |
| JAMES  |     30 |
| MILLER |     10 |

9 rows in set (0.00 sec)

| ename | job       |
|-------|-----------|
| KING  | PRESIDENT |

1 row in set (0.00 sec)

| ename |
|-------|
| SMITH |
| SCOTT |

2 rows in set (0.00 sec)


| ename |
|-------|
| SMITH |
| SCOTT |

2 rows in set (0.00 sec)

| ename | job     | sal     |
|-------|---------|---------|
| JONES | MANAGER | 2975.00 |
| BLAKE | MANAGER | 2850.00 |
| CLARK | MANAGER | 2450.00 |
3 rows in set (0.00 sec)


| ename  | sal     |
|--------|---------|
| MARTIN | 1250.00 |

1 row in set (0.00 sec)


| empno | sal     | New Salary |
|-------|---------|------------|
|  7369 |  800.00 |        920 |
|  7499 | 1600.00 |       1840 |
|  7521 | 1250.00 |       1437 |
|  7566 | 2975.00 |       3421 |
|  7654 | 1250.00 |       1437 |
|  7698 | 2850.00 |       3277 |
|  7782 | 2450.00 |       2817 |
|  7788 | 3000.00 |       3450 |
|  7839 | 5000.00 |       5750 |
|  7844 | 1500.00 |       1725 |
|  7876 | 1100.00 |       1265 |
|  7900 |  950.00 |       1092 |
|  7902 | 3000.00 |       3450 |
|  7934 | 1300.00 |       1495 |

14 rows in set (0.00 sec)
