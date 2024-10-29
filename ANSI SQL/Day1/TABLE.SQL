-- **********creation of table **********

SQL> CREATE TABLE TIH_COURSES(
  2  Course_ID INT NOT NULL,
  3  Course_Name VARCHAR(30),
  4  Professor VARCHAR(30),
  5  Mode_Of_TraInning VARCHAR(30)
  6  );

Table created.

SQL> DESC TIH_COURSES;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 COURSE_ID                                 NOT NULL NUMBER(38)
 COURSE_NAME                                        VARCHAR2(30)
 PROFESSOR                                          VARCHAR2(30)
 MODE_OF_TRAINNING                                  VARCHAR2(30)


--*********INSERT DATA INTO THE TABLE **********

INSERT INTO TIH_COURSES
VALUES(001,	'.NET'	,'Mukesh Tiwari'	,'Online and Offline');

INSERT INTO TIH_COURSES
VALUES('002','Java' ,'Rajneesh Shukla','');	 

-- INSERT INTO tih_Courses (Course_ID, CourseName, Professor)
-- VALUES (002, 'Java', 'Rajneesh Shukla')
INSERT INTO TIH_COURSES
VALUES(003,'ANSI SQL','Rajneesh Shukla','Online');

INSERT INTO TIH_COURSES
VALUES(004,'Basics of Computer','Shweta','Online');


SQL> SELECT * FROM TIH_COURSES;

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         1 .NET                           Mukesh Tiwari                  Online and Offline
         2 Java                           Rajneesh Shukla
         4 Basics of Computer             Shweta                         Online
         3 ANSI SQL                       Rajneesh Shukla                Online



---**********************SELECT PARTICULAR COLUMN***************************

SELECT COURSE_ID,COURSE_NAME FROM TIH_COURSES;


SQL> SELECT COURSE_ID,COURSE_NAME FROM TIH_COURSES;

 COURSE_ID COURSE_NAME
---------- ------------------------------
         1 .NET
         2 Java
         4 Basics of Computer
         3 ANSI SQL



---******** SELECT DISTINCT (SELECT DISTINCT in sql helps to fetch distinct data from a coloumn.)********************

SQL> SELECT DISTINCT Professor FROM tih_Courses;

PROFESSOR
------------------------------
Mukesh Tiwari
Rajneesh Shukla
Shweta


SQL> SELECT DISTINCT MODE_OF_TRAINNING FROM TIH_COURSES;

MODE_OF_TRAINNING
------------------------------
Online and Offline

Online

---****************SELECT TOP************
--- in sql returns the topmost data from the table. 
---When using it, we also specify the number of rows that we would like to fetch from the top of the table.

SELECT TOP 2 * FROM TIH_COURSES; ---THIS IS NOT WORK IN ORACLE SQL


SQL> SELECT *
  2  FROM TIH_COURSES
  3  WHERE ROWNUM <= 2;

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         1 .NET                           Mukesh Tiwari                  Online and Offline
         2 Java                           Rajneesh Shukla


---******************************SQL SELECT AS***********************************

---We use SELECT AS in sql with a column name to assign that column a temporary name. 
---Similary it can also be used to give a table a temporary name as well.

SELECT COURSE_ID AS ID FROM TIH_COURSES



SELECT COURSE_ID AS ID FROM TIH_COURSES;

        ID
----------
         1
         2
         4
         3


---********************************SQL SELECT IN*******************************************
--IN operator in sql is used with WHERE clause to specify multiple values from a particular column. --

SELECT * FROM TIH_COURSES 
WHERE COURSE_ID IN (001,003);



SQL> SELECT * FROM TIH_COURSES
  2  WHERE COURSE_ID IN (001,003);

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         1 .NET                           Mukesh Tiwari                  Online and Offline
         3 ANSI SQL                       Rajneesh Shukla                Online



--*******************************************WHERE CLAUSE*******************************************
--In sql WHERE clause is used with SELECT, UPDATE, DELETE staements to perform operation based on certain conditions.--

SELECT * FROM TIH_COURSES 
WHERE COURSE_NAME='Java';

SQL> SELECT * FROM TIH_COURSES WHERE COURSE_NAME='Java';

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         2 Java                           Rajneesh Shukla


--************************SQL AND*********************************

SELECT * 
FROM TIH_COURSES 
WHERE MODE_OF_TRAINNING='Online' AND COURSE_NAME = 'ANSI SQL';

SQL> SELECT *
  2  FROM TIH_COURSES
  3  WHERE MODE_OF_TRAINNING='Online' AND COURSE_NAME = 'ANSI SQL';

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         3 ANSI SQL                       Rajneesh Shukla                Online


--******************SQL OR********************************************
SELECT * 
FROM TIH_COURSES 
WHERE MODE_OF_TRAINNING='Online' OR COURSE_NAME = 'ANSI SQL';

SQL> SELECT *
  2  FROM TIH_COURSES
  3  WHERE MODE_OF_TRAINNING='Online' OR COURSE_NAME = 'ANSI SQL';

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         4 Basics of Computer             Shweta                         Online
         3 ANSI SQL                       Rajneesh Shukla                Online


--**********************************SQL NOT*************************************

SELECT * FROM TIH_COURSES
WHERE NOT PROFESSOR='Sheweta';


SQL> SELECT * FROM TIH_COURSES
  2  WHERE NOT PROFESSOR='Sheweta';

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         1 .NET                           Mukesh Tiwari                  Online and Offline
         2 Java                           Rajneesh Shukla
         4 Basics of Computer             Shweta                         Online
         3 ANSI SQL                       Rajneesh Shukla                Online


--*************************************NULL***********************************

SELECT * 
FROM TIH_COURSES
WHERE MODE_OF_TRAINNING IS NULL;

SQL>
SQL> SELECT *
  2  FROM TIH_COURSES
  3  WHERE MODE_OF_TRAINNING IS NULL;

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         2 Java                           Rajneesh Shukla


--******************************************NOT NULL***********************************************
SELECT * FROM TIH_COURSES
WHERE MODE_OF_TRAINNING IS NOT NULL;




SQL> SELECT * FROM TIH_COURSES
  2  WHERE MODE_OF_TRAINNING IS NOT NULL;

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         1 .NET                           Mukesh Tiwari                  Online and Offline
         4 Basics of Computer             Shweta                         Online
         3 ANSI SQL                       Rajneesh Shukla                Online


--**************************************************SQL LIKE*************************************************

SELECT PROFESSOR FROM TIH_COURSES
WHERE PROFESSOR LIKE 'M%';

--1)
SQL> SELECT PROFESSOR FROM TIH_COURSES
  2  WHERE PROFESSOR LIKE 'M%';

PROFESSOR
------------------------------
Mukesh Tiwari

--=============================================================

SELECT * FROM TIH_COURSES 
WHERE COURSE_NAME LIKE '%ANSI SQL%';


SQL> SELECT * FROM TIH_COURSES
  2  WHERE COURSE_NAME LIKE '%ANSI SQL%';

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         3 ANSI SQL                       Rajneesh Shukla                Online


--=============================================================

SELECT * FROM TIH_COURSES
WHERE PROFESSOR LIKE '__j%';


SQL> SELECT * FROM TIH_COURSES
  2  WHERE PROFESSOR LIKE '__j%';

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         2 Java                           Rajneesh Shukla
         3 ANSI SQL                       Rajneesh Shukla                Online




--***********************************ORDER BY ASC / DESC*********************************************

SELECT * FROM TIH_COURSES
ORDER BY COURSE_ID ASC;

SQL> SELECT * FROM TIH_COURSES
  2  ORDER BY COURSE_ID ASC;

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         1 .NET                           Mukesh Tiwari                  Online and Offline
         2 Java                           Rajneesh Shukla
         3 ANSI SQL                       Rajneesh Shukla                Online
         4 Basics of Computer             Shweta                         Online


SELECT * FROM TIH_COURSES
ORDER BY COURSE_ID DESC;


SQL> SELECT * FROM TIH_COURSES
  2  ORDER BY COURSE_ID DESC;

 COURSE_ID COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINNING
---------- ------------------------------ ------------------------------ ------------------------------
         4 Basics of Computer             Shweta                         Online
         3 ANSI SQL                       Rajneesh Shukla                Online
         2 Java                           Rajneesh Shukla
         1 .NET                           Mukesh Tiwari                  Online and Offline
