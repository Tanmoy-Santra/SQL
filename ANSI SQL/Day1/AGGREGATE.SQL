
CREATE TABLE TIH_COURSES_NEW (
    Course_ID VARCHAR(3) PRIMARY KEY,
    Course_Name VARCHAR(50),
    Professor VARCHAR(50),
    Mode_of_Training VARCHAR(50),
    Course_Fee NUMBER(6, 2)
);


INSERT INTO TIH_COURSES_NEW (Course_ID, Course_Name, Professor, Mode_of_Training, Course_Fee) 
VALUES ('001', '.Net', 'Mukesh Tiwari', 'Online and Offline', 550);

INSERT INTO TIH_COURSES_NEW (Course_ID, Course_Name, Professor, Mode_of_Training, Course_Fee) 
VALUES ('002', 'Java', 'Rajneesh Shukla', 'Online and Offline', 550);

INSERT INTO TIH_COURSES_NEW (Course_ID, Course_Name, Professor, Mode_of_Training, Course_Fee) 
VALUES ('003', 'ANSI SQL', 'Rajneesh Shukla', 'Online', 500);

INSERT INTO TIH_COURSES_NEW (Course_ID, Course_Name, Professor, Mode_of_Training, Course_Fee) 
VALUES ('004', 'Basics of Computer', 'Shweta', 'Online', 350);

INSERT INTO TIH_COURSES_NEW (Course_ID, Course_Name, Professor, Mode_of_Training, Course_Fee) 
VALUES ('005', 'Blogging Tutorial', 'Puja', 'Online', 250);

INSERT INTO TIH_COURSES_NEW (Course_ID, Course_Name, Professor, Mode_of_Training, Course_Fee) 
VALUES ('006', 'JSP', 'Alok Pandey', 'Online and Offline', 350);

INSERT INTO TIH_COURSES_NEW (Course_ID, Course_Name, Professor, Mode_of_Training, Course_Fee) 
VALUES ('007', 'Servlet', 'Mukesh Tiwari', 'Online and Offline', 350);


COURS COURSE_NAME                    PROFESSOR                      MODE_OF_TRAINING     COURSE_FEE
----- ------------------------------ ------------------------------ -------------------- ----------
001   .Net                           Mukesh Tiwari                  Online and Offline       550.00
002   Java                           Rajneesh Shukla                Online and Offline       550.00
003   ANSI SQL                       Rajneesh Shukla                Online                   500.00
004   Basics of Computer             Shweta                         Online                   350.00
005   Blogging Tutorial              Puja                           Online                   250.00
006   JSP                            Alok Pandey                    Online and Offline       350.00
007   Servlet                        Mukesh Tiwari                  Online and Offline       350.00


--***********************************count****************************************

SELECT COUNT(COURS_ID) FROM TIH_COURSES_NEW ;

SQL> SELECT COUNT(COURSE_ID) FROM TIH_COURSES_NEW ;

COUNT(COURSE_ID)
----------------
               7

--**************************************AVG********************************************

SELECT AVG(COURSE_FEE) AS AVG_COURSE_FEE FROM TIH_COURSES_NEW;

SQL> SELECT AVG(COURSE_FEE) AS AVG_COURSE_FEE FROM TIH_COURSES_NEW;

AVG_COURSE_FEE
--------------
    414.285714


--*****************************************SUM*********************************************

SELECT SUM(COURSE_FEE) AS TOTAL_COURSE_FEE FROM TIH_COURSES_NEW;


SQL> SELECT SUM(COURSE_FEE) AS TOTAL_COURSE_FEE FROM TIH_COURSES_NEW;

TOTAL_COURSE_FEE
----------------
            2900


--=*******************************************MAX**************************************

SELECT MAX(COURSE_FEE) FROM TIH_COURSES_NEW;


SQL> SELECT MAX(COURSE_FEE) FROM TIH_COURSES_NEW;

MAX(COURSE_FEE)
---------------
            550

--****************************************MIN*********************************

SELECT MIN(COURSE_FEE) FROM TIH_COURSES_NEW;


SQL> SELECT MIN(COURSE_FEE) FROM TIH_COURSES_NEW;

MIN(COURSE_FEE)
---------------
            250

--********************************************SQL GROUP BY************************************************

--In Sql, GROUP BY statement is mostly used along with the aggregate functions like COUNT, MAX, MIN, etc to group the result based on one or multiple columns.--

SQL> SELECT MIN(COURSE_FEE) FROM TIH_COURSES_NEW
  2  GROUP BY COURSE_FEE;

MIN(COURSE_FEE)
---------------
            550
            500
            350
            250

SELECT MIN(COURSE_FEE) FROM TIH_COURSES_NEW
GROUP BY COURSE_FEE ORDER BY COURSE_FEE ASC;


SQL> SELECT MIN(COURSE_FEE) FROM TIH_COURSES_NEW
  2  GROUP BY COURSE_FEE ORDER BY COURSE_FEE ASC;

MIN(COURSE_FEE)
---------------
            250
            350
            500
            550



SELECT COURSE_FEE, MAX(COURSE_ID) FROM TIH_COURSES_NEW
GROUP BY COURSE_FEE;

SQL> SELECT COURSE_FEE, MAX(COURSE_ID) FROM TIH_COURSES_NEW
  2  GROUP BY COURSE_FEE;

COURSE_FEE MAX
---------- ---
       550 002
       500 003
       350 007
       250 005



SELECT COUNT(COURSE_NAME) AS COURSE,PROFESSOR 
FROM TIH_COURSES_NEW GROUP BY PROFESSOR;


SQL> SELECT COUNT(COURSE_NAME) AS COURSE,PROFESSOR
  2  FROM TIH_COURSES_NEW GROUP BY PROFESSOR;

    COURSE PROFESSOR
---------- --------------------------------------------------
         2 Mukesh Tiwari
         2 Rajneesh Shukla
         1 Shweta
         1 Puja
         1 Alok Pandey
