
CREATE TABLE REGISTRATION (
    COURSE_ID VARCHAR(10),
    COURSE_NAME VARCHAR(50),
    REGISTERED_STUDENTS INT,
    TOTAL_STRENGTH INT,
    REGISTRATION_DATE DATE
);


SQL> DESC REGISTRATION;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COURSE_ID                                          VARCHAR2(10)
 COURSE_NAME                                        VARCHAR2(50)
 REGISTERED_STUDENTS                                NUMBER(38)
 TOTAL_STRENGTH                                     NUMBER(38)
 REGISTRATION_DATE                                  DATE


INSERT INTO REGISTRATION (COURSE_ID, COURSE_NAME, REGISTERED_STUDENTS, TOTAL_STRENGTH, REGISTRATION_DATE)
VALUES ('001', '.NET', 107, 120, TO_DATE('2024-09-01', 'YYYY-MM-DD'));

INSERT INTO REGISTRATION (COURSE_ID, COURSE_NAME, REGISTERED_STUDENTS, TOTAL_STRENGTH, REGISTRATION_DATE)
VALUES ('002', 'JAVA', 118, 130, TO_DATE('2024-09-02', 'YYYY-MM-DD'));

INSERT INTO REGISTRATION (COURSE_ID, COURSE_NAME, REGISTERED_STUDENTS, TOTAL_STRENGTH, REGISTRATION_DATE)
VALUES ('009', 'ORACLE', 100, 110, TO_DATE('2024-09-03', 'YYYY-MM-DD'));

INSERT INTO REGISTRATION (COURSE_ID, COURSE_NAME, REGISTERED_STUDENTS, TOTAL_STRENGTH, REGISTRATION_DATE)
VALUES ('010', 'RUBY', 80, 90, TO_DATE('2024-09-04', 'YYYY-MM-DD'));

SQL> SELECT * FROM REGISTRATION;

COURSE_ID  COURSE_NAME                                        REGISTERED_STUDENTS TOTAL_STRENGTH REGISTRAT
---------- -------------------------------------------------- ------------------- -------------- ---------
001        .NET                                                               107            120 01-SEP-24
002        JAVA                                                               118            130 02-SEP-24
009        ORACLE                                                             100            110 03-SEP-24
010        RUBY                                                                80             90 04-SEP-24


---********************************************SQL INNER JOIN******************************************

--In sql, INNER JOIN is used to select all the records from two or more table where the condition is satisfied.

SELECT TIH_COURSES_NEW.COURSE_ID ,TIH_COURSES_NEW.COURSE_NAME , REGISTRATION.REGISTERED_STUDENTS
FROM TIH_COURSES_NEW INNER JOIN REGISTRATION
ON TIH_COURSES_NEW.COURSE_ID=REGISTRATION.COURSE_ID;


SQL> SELECT TIH_COURSES_NEW.COURSE_ID ,TIH_COURSES_NEW.COURSE_NAME , REGISTRATION.REGISTERED_STUDENTS
  2  FROM TIH_COURSES_NEW INNER JOIN REGISTRATION
  3  ON TIH_COURSES_NEW.COURSE_ID=REGISTRATION.COURSE_ID;

COU COURSE_NAME                                        REGISTERED_STUDENTS
--- -------------------------------------------------- -------------------
001 .Net                                                               107
002 Java                                                               118


--***********************************************SQL LEFT JOIN***************************************************

SELECT TIH_COURSES_NEW.COURSE_ID ,TIH_COURSES_NEW.COURSE_NAME , REGISTRATION.REGISTERED_STUDENTS
FROM TIH_COURSES_NEW LEFT JOIN REGISTRATION
ON TIH_COURSES_NEW.COURSE_ID=REGISTRATION.COURSE_ID;

SQL> SELECT TIH_COURSES_NEW.COURSE_ID ,TIH_COURSES_NEW.COURSE_NAME , REGISTRATION.REGISTERED_STUDENTS
  2  FROM TIH_COURSES_NEW LEFT JOIN REGISTRATION
  3  ON TIH_COURSES_NEW.COURSE_ID=REGISTRATION.COURSE_ID;

COU COURSE_NAME                                        REGISTERED_STUDENTS
--- -------------------------------------------------- -------------------
001 .Net                                                               107
002 Java                                                               118
005 Blogging Tutorial
006 JSP
003 ANSI SQL
004 Basics of Computer
007 Servlet

7 rows selected.


--*****************************************************************SQL RIGHT JOIN**************************************************

SELECT TIH_COURSES_NEW.COURSE_ID ,TIH_COURSES_NEW.COURSE_NAME , REGISTRATION.REGISTERED_STUDENTS
FROM TIH_COURSES_NEW RIGHT JOIN REGISTRATION
ON TIH_COURSES_NEW.COURSE_ID=REGISTRATION.COURSE_ID;


COU COURSE_NAME                                        REGISTERED_STUDENTS
--- -------------------------------------------------- -------------------
001 .Net                                                               107
002 Java                                                               118
                                                                       100
                                                                        80


--**************************************************SQL FULL JOIN******************************************

SELECT TIH_COURSES_NEW.COURSE_ID ,TIH_COURSES_NEW.COURSE_NAME , REGISTRATION.REGISTERED_STUDENTS
FROM TIH_COURSES_NEW FULL JOIN REGISTRATION
ON TIH_COURSES_NEW.COURSE_ID=REGISTRATION.COURSE_ID;


SQL> SELECT TIH_COURSES_NEW.COURSE_ID ,TIH_COURSES_NEW.COURSE_NAME , REGISTRATION.REGISTERED_STUDENTS
  2  FROM TIH_COURSES_NEW FULL JOIN REGISTRATION
  3  ON TIH_COURSES_NEW.COURSE_ID=REGISTRATION.COURSE_ID;

COU COURSE_NAME                                        REGISTERED_STUDENTS
--- -------------------------------------------------- -------------------
001 .Net                                                               107
002 Java                                                               118
003 ANSI SQL
004 Basics of Computer
005 Blogging Tutorial
006 JSP
007 Servlet
                                                                       100
                                                                        80

9 rows selected.



--**********************************SELF JOIN**********************************************

-- A self join is a regular join, but the table is joined with itself.

SELECT A.COURSE_ID AS COURSE_ID_A, 
       A.COURSE_NAME AS COURSE_NAME_A, 
       A.REGISTERED_STUDENTS AS REGISTERED_STUDENTS_A,
       B.COURSE_ID AS COURSE_ID_B, 
       B.COURSE_NAME AS COURSE_NAME_B, 
       B.REGISTERED_STUDENTS AS REGISTERED_STUDENTS_B
FROM REGISTRATION A
JOIN REGISTRATION B
ON A.REGISTERED_STUDENTS = B.REGISTERED_STUDENTS
AND A.COURSE_ID <> B.COURSE_ID;

SQL> SELECT A.COURSE_ID AS COURSE_ID_A,
  2         A.COURSE_NAME AS COURSE_NAME_A,
  3         A.REGISTERED_STUDENTS AS REGISTERED_STUDENTS_A,
  4         B.COURSE_ID AS COURSE_ID_B,
  5         B.COURSE_NAME AS COURSE_NAME_B,
  6         B.REGISTERED_STUDENTS AS REGISTERED_STUDENTS_B
  7  FROM REGISTRATION A
  8  JOIN REGISTRATION B
  9  ON A.REGISTERED_STUDENTS = B.REGISTERED_STUDENTS
 10  AND A.COURSE_ID <> B.COURSE_ID;

no rows selected



--===========================================================================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

CUSTOMERID CUSTOMERNAME                   CONTACTNAME                    ADDRESS                              CITY                 POSTALCODE COUNTRY
---------- ------------------------------ ------------------------------ ------------------------------------ -------------------- ---------- ---------------
         1 Alfreds Futterkiste            Maria Anders                   Obere Str. 57                        Berlin               12209      Germany

         2 Ana Trujillo Emparedados y helados Ana Trujillo               Avda. de la Constitución 2222       México D.F.          05021      Mexico

         3 Antonio Moreno Taquería          Antonio Moreno                Mataderos 2312                       México D.F.          05023      Mexico


SELECT C1.CustomerName AS CUSTOMERNAME1, 
       C2.CustomerName AS CUSTOMERNAME2, 
       C1.City
FROM Customers C1
INNER JOIN Customers C2 ON C1.City = C2.City AND C1.CustomerID <> C2.CustomerID
ORDER BY C1.City;

CUSTOMERNAME1                                              CUSTOMERNAME2                                         CITY
---------------------------------------------------------- ----------------------------------------------------- --------------------
Ana Trujillo Emparedados y helados                         Antonio Moreno Taquería                                México D.F.
Antonio Moreno Taquería                                    Ana Trujillo Emparedados y helados                    México D.F.
                              `