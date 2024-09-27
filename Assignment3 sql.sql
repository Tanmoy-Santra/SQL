-- Assignment-3

-- Data Manipulation (DML)-II:
-- 1. Count the total number of orders.
SQL> select count(order_no) from sales_order_old;

COUNT(ORDER_NO)
---------------
              6

SQL> select * from sales_order_old;

ORDER_ ORDER_DAT CLIENT SALESM D B DELIVERY_ ORDER_STAT
------ --------- ------ ------ - - --------- ----------
O19001 12-JAN-96 C001   S001   F N 20-JAN-96 InProcess
O19002 25-JAN-96 C002   S002   P N 27-JAN-96 BackOrder
O46865 18-FEB-96 C003   S003   F Y 20-FEB-96 Fullfilled
O19003 03-APR-96 C001   S001   F Y 07-APR-96 Fullfilled
O46866 20-MAY-96 C004   S002   P N 22-MAY-96 Cancelled
O19008 24-MAY-96 C005   S004   F N 26-MAY-96 InProcess

-- 2. Calculate the average sale price of all the products.

SQL> select * from product_master;

PRODUC DESCRIPTION                              PROFIT_PERCENT UNIT_MEASU QTY_ON_HAND REORDER_LEVEL SELL_PRICE COST_PRICE
------ ---------------------------------------- -------------- ---------- ----------- ------------- ---------- ----------
P00001 1.44 Floppies                                         5 Piece              100            20        525        500
P03453 Monitors                                              6 Piece               10             3      12000      11280
P06734 Mouse                                                 5 Piece               20             5       1050        100
P07865 1.22 Floppies                                         5 Piece              100            20        525        500
P07868 Keyboard                                              2 Piece               10             3       3150       3050
P07885 CD Drive                                            2.5 Piece               10             3       5250       5100
P07965 540 HDD                                               4 Piece               10             3       8400       8000
P07975 1.44 Drive                                            5 Piece               10             3       1050        900
P08865 1.22 Drive                                            5 Piece                2             3       1025        850

9 rows selected.

SQL> select avg(sell_price) from product_master;

AVG(SELL_PRICE)
---------------
     3663.88889

-- 3. Count the number of products having price greater than or equal to 1500.

SQL> select count(product_no) from product_master where cost_price>=1500;

COUNT(PRODUCT_NO)
-----------------
                4

-- 4. Determine the maximum and minimum product prices. Rename the output as max_price and min_price
-- respectively.

SQL> select max(cost_price) as max_cost , min(cost_price) as min_cost from product_master;

  MAX_COST   MIN_COST
---------- ----------
     11280        100


-- 5. Create the following tables and insert the data as mentioned below:
-- a) Emp table

-- Column Null Type
-- -------- ----------- --------------
-- EMPNO NOT NULL NUMBER(4,0)
-- ENAME VARCHAR2(10)
-- JOB VARCHAR2(9)
-- MGR NUMBER(4,0)
-- HIREDATE - DATE
-- SAL - NUMBER(7,2)
-- COMM - NUMBER(7,2)
-- DEPTNO NOT NULL NUMBER(2,0)

-- Data in Emp table [Value absent means NULL]
-- EMPNO ENAME JOB MGR HIREDATE SAL COMM DEPTNO
-- ----- ---------- --------- --------- --------- --------- --------- ---------
-- 7369 SMITH CLERK 7902 17-DEC-80 800 20
-- 7499 ALLEN SALESMAN 7698 20-FEB-81 1600 300 30
-- 7521 WARD SALESMAN 7698 22-FEB-81 1250 500 30
-- 7566 JONES MANAGER 7839 02-APR-81 2975 20
-- 7654 MARTIN SALESMAN 7698 28-SEP-81 1250 1400 30
-- 7698 BLAKE MANAGER 7839 01-MAY-81 2850 30
-- 7782 CLARK MANAGER 7839 09-JUN-81 2450 10
-- 7788 SCOTT ANALYST 7566 19-APR-87 3000 20
-- 7839 KING PRESIDENT 17-NOV-81 5000 10
-- 7844 TURNER SALESMAN 7698 08-SEP-81 1500 0 30
-- 7876 ADAMS CLERK 7788 23-MAY-87 1100 20
-- 7900 JAMES CLERK 7698 03-DEC-81 950 30
-- 7902 FORD ANALYST 7566 03-DEC-81 3000 20
-- 7934 MILLER CLERK 7782 23-JAN-82 1300 10
-- b) Dept table:

-- Column Null Type
-- -------- ----------- --------------
-- deptno NOT NULL NUMBER(2,0),
-- dname NOT NULL VARCHAR2(14),
-- loc NOT NULL VARCHAR2(13),

-- Page 2 of 2
-- Laboratory Assignments Session: 2023-24
-- MCKVIE/CSE/PC-CS692

-- Data in Dept table

-- DEPTNO DNAME LOC
-- ------ -------------- ----------
-- 10 ACCOUNTING NEW YORK
-- 20 RESEARCH DALLAS
-- 30 SALES CHICAGO
-- 40 OPERATIONS BOSTON

-- c) Salgrade table

-- Column Null Type
-- ------ ----- -------
-- grade NUMBER,
-- losal NUMBER,
-- hisal NUMBER
-- Data in Salgrade table:

-- GRADE LOSAL HISAL
-- ---------- -------- -------
-- 1 700 1200
-- 2 1201 1400
-- 3 1401 2000
-- 4 2001 3000
-- 5 3001 9999

-- 6. Solve the following SQL (DML) query use Emp and Dept table created above
-- a) List all department no, employee no, manager no. from emp table.

SQL> select empno,deptno,mgr from emp;

     EMPNO     DEPTNO        MGR
---------- ---------- ----------
      7369         20       7902
      7499         30       7698
      7521         30       7698
      7566         20       7839
      7654         30       7698
      7698         30       7839
      7782         10       7839
      7788         20       7566
      7839         10
      7844         30       7698
      7876         20       7788

     EMPNO     DEPTNO        MGR
---------- ---------- ----------
      7900         30       7698
      7902         20       7566
      7934         10       7782


-- b) List all department name and location from dept table.

SQL> select dname,loc from dept;

DNAME          LOC
-------------- -------------
ACCOUNTING     NEW YORK
RESEARCH       DALLAS
SALES          CHICAGO
OPERATIONS     BOSTON


-- c) List the employees belong to the department 20.

SQL> select empno,deptno from emp where deptno=20;

     EMPNO     DEPTNO
---------- ----------
      7369         20
      7566         20
      7788         20
      7876         20
      7902         20

-- d) List the name and salary of the employee whose salary is more than 2500.

SQL> select ename,sal from emp where sal>2500;

ENAME             SAL
---------- ----------
JONES            2975
BLAKE            2850
SCOTT           35000
KING             5000
FORD             3000

-- e) List the details of the employee who have joined before end of July 81.


SQL> select * from emp where to_char(hiredate,'MON') > 'JUL' and  to_char(hiredate,'YY') >='81';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7782 CLARK      MANAGER         7839 09-JUN-81       2450         10         10
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30
      7876 ADAMS      CLERK           7788 23-MAY-87       1100         20         20


-- f) List the name of the employees who are not manager.


SQL> select empno,ename,job from emp where job like 'MANAGER';

     EMPNO ENAME      JOB
---------- ---------- ---------
      7566 JONES      MANAGER
      7698 BLAKE      MANAGER
      7782 CLARK      MANAGER

-- g) List the name of employees whose name end with ‘S’.
SQL> select ename from emp where ename like '%S';

ENAME
----------
JONES
ADAMS
JAMES

-- h) List the name of employees whose name has exactly 5 characters long.

SQL> select ename from emp where length(ename)=5;

ENAME
----------
SMITH
ALLEN
JONES
BLAKE
CLARK
SCOTT
ADAMS
JAMES

8 rows selected.

-- i) List the name of employees whose name having ‘R’ as the third character.

SQL> select ename from emp where ename like '__R%';

ENAME
----------
WARD
MARTIN
TURNER
FORD

-- j) List all employee names and their salaries, whose salary lies between 1500/- and 3500/- both inclusive.

SQL> select ename,sal from emp where sal>=1500 and sal<=3500;

ENAME             SAL
---------- ----------
ALLEN            1600
JONES            2975
BLAKE            2850
CLARK            2450
TURNER           1500
FORD             3000

6 rows selected.

-- k) List all employee names and their and their manager whose manager is 7902 or 7566 0r 7789.

SQL> select ename,mgr from emp where mgr=7902 or mgr=7566 or mgr=7789;

ENAME             MGR
---------- ----------
SMITH            7902
SCOTT            7566
FORD             7566


-- l) List all employees which start with either J or T.

SQL> select ename from emp where ename like 'J%' or ename like 'T%';

ENAME
----------
JONES
TURNER
JAMES

-- m) List all employee names and jobs, whose job title includes M or P.


SQL> select ename,job from emp where job like '%P%' or job like  '%M%';

ENAME      JOB
---------- ---------
ALLEN      SALESMAN
WARD       SALESMAN
JONES      MANAGER
MARTIN     SALESMAN
BLAKE      MANAGER
CLARK      MANAGER
KING       PRESIDENT
TURNER     SALESMAN

8 rows selected.


-- n) List all jobs available in employee table.


SQL> select job from emp;

JOB
---------
CLERK
SALESMAN
SALESMAN
MANAGER
SALESMAN
MANAGER
MANAGER
ANALYST
PRESIDENT
SALESMAN
CLERK

JOB
---------
CLERK
ANALYST
CLERK

14 rows selected.

-- o) List all employees who belong to the department 10 or 20.

SQL> select ename,deptno from emp where deptno=10 or deptno=20;

ENAME          DEPTNO
---------- ----------
SMITH              20
JONES              20
CLARK              10
SCOTT              20
KING               10
ADAMS              20
FORD               20
MILLER             10

8 rows selected.

SQL> select ename,deptno from emp where deptno in(10,20);

ENAME          DEPTNO
---------- ----------
SMITH              20
JONES              20
CLARK              10
SCOTT              20
KING               10
ADAMS              20
FORD               20
MILLER             10

8 rows selected.

-- p) List all employee names, salary and 15% raise in salary.

SQL> select ename,sal,sal+(sal*.15) as rais_sal from emp;

ENAME             SAL   RAIS_SAL
---------- ---------- ----------
SMITH             800        920
ALLEN            1600       1840
WARD             1250     1437.5
JONES            2975    3421.25
MARTIN           1250     1437.5
BLAKE            2850     3277.5
CLARK            2450     2817.5
SCOTT           35000      40250
KING             5000       5750
TURNER           1500       1725
ADAMS            1100       1265

ENAME             SAL   RAIS_SAL
---------- ---------- ----------
JAMES             950     1092.5
FORD             3000       3450
MILLER           1300       1495

-- q) List minimum, maximum, average salaries of employee.
SQL> select avg(sal),min(sal),max(sal) from emp;

  AVG(SAL)   MIN(SAL)   MAX(SAL)
---------- ---------- ----------
4358.92857        800      35000

-- r) Find how many job titles are available in employee table.

SQL> select count(job) from emp;

COUNT(JOB)
----------
        14

-- s) What is the difference between maximum and minimum salaries of employees in the organization?


SQL> SELECT MAX(sal) - MIN(sal) AS salary_difference
  2  FROM emp;

SALARY_DIFFERENCE
-----------------
            34200

-- t) Find how much amount the company is spending towards salaries.

SQL> SELECT SUM(sal) AS total_salary_expense
  2  FROM emp;

TOTAL_SALARY_EXPENSE
--------------------
               61025


-- u) Display name of employees with deptno. 20.

SQL> select ename,deptno from emp where deptno=20;

ENAME          DEPTNO
---------- ----------
SMITH              20
JONES              20
SCOTT              20
ADAMS              20
FORD               20
-- v) List ename who are not eligible for commission.
SQL> select * from emp where comm is NULL;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30
      7839 KING       PRESIDENT            17-NOV-81       5000                    10
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10

-- w) Find no.of dept in employee table.

SQL> select count(deptno) from emp;

COUNT(DEPTNO)
-------------
           14
-- x) List ename and designation of the employee who does not report to anybody..


SQL> SELECT ename, job
  2  FROM emp
  3  WHERE mgr IS NULL;

ENAME      JOB
---------- ---------
KING       PRESIDENT

-- y) List the name of the employees who are less than 38 years old in the organization with respect to today’s date.

SQL> SELECT ename from emp where (sysdate-hiredate)/365<=38;



ENAME
----------
SMITH
ALLEN
WARD
JONES
MARTIN
BLAKE
CLARK
SCOTT
KING
TURNER
ADAMS

ENAME
----------
JAMES
FORD
MILLER

14 rows selected.



SQL> SELECT ename, hiredate FROM emp  WHERE SYSDATE - hiredate < 38*365;

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80
ALLEN      20-FEB-81
WARD       22-FEB-81
JONES      02-APR-81
MARTIN     28-SEP-81
BLAKE      01-MAY-81
CLARK      09-JUN-81
SCOTT      19-APR-87
KING       17-NOV-81
TURNER     08-SEP-81
ADAMS      23-MAY-87

ENAME      HIREDATE
---------- ---------
JAMES      03-DEC-81
FORD       03-DEC-81
MILLER     23-JAN-82

14 rows selected.
